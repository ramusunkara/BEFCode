namespace :data do
  namespace :people do
    desc 'Import the people'
    task :import => :scrape do
      base_url = 'http://www.siliconvalleybadgers.com/node/7'
      filename = Rails.root.join('config', 'people.yml')

      exceptions = {
        'Neng Bing Doh' => ['Neng', 'Bing Doh'],
        'David Van Etten' => ['David', 'Van Etten'],
        'Dhaval N. Shah' => ['Dhaval', 'Shah']
      }

      people = YAML.load(File.open(filename))
      people.each do |hash|
        name_parts = hash.name.split
        if name_parts.count != 2
          name_parts = exceptions.fetch(hash.name)
        end

        first_name, last_name = name_parts

        person = Person.where(first_name: first_name, last_name: last_name).first_or_initialize

        person.title = hash.title
        person.organization = hash.organization
        person.linkedin_url = hash.linkedin_url

        person.tags << Tag.where(title: hash.tags)
        unless hash.image =~ /blank\.png$/
          image_url = URI::join(base_url, URI.encode(hash.image))
          person.image = open(image_url)
        end

        person.save!
      end
    end

    desc 'Scrape the people from the existing site'
    task :scrape => :environment do
      filename = Rails.root.join('config', 'people.yml')

      if File.exists?(filename)
        puts "#{filename} already exists"
        next
      end

      base_url = 'http://www.siliconvalleybadgers.com/node/7'

      people = people_from_url(base_url)

      tags_and_urls(base_url).each do |tag, url|
        next if tag == 'Show All'

        tagged_people = people_from_url(url)

        tagged_people.each do |tagged_person|
          matches = people.select { |p| p.name == tagged_person.name }

          if matches.count != 1
            raise "Unexpected matches (#{matches.count}) for #{tagged_person}"
          end

          person = matches.first

          person.tags << tag
        end
      end

      File.open(filename, 'w') do |writer|
        writer.write(people.to_yaml)
      end
    end

    def tags_and_urls(url)
      doc = Nokogiri::HTML(open(url))

      filter_box = doc.css('div.field-items p').find do |p|
        p.content.starts_with? 'Sort Filter'
      end

      filter_box.css('a').map do |link|
        [link.content.strip, "#{url}#{link['href']}"]
      end
    end

    def people_from_url(url)
      doc = Nokogiri::HTML(open(url))

      doc.css('td').map do |cell|
        person_from_cell(cell)
      end
    end

    def person_from_cell(cell)
      lines = cell.content.split("\n")
      image = cell.css('img').first
      link = cell.css('a').first

      lines = lines.map { |line| line.strip }
      lines = lines.select { |line| line.present? }

      if lines.count != 3
        raise "Unexpected data: #{lines}"
      end

      name, title, company = lines

      person = Hashie::Mash.new

      person.name = name
      person.title = title
      person.company = company
      person.image = image['src'] if image
      person.linkedin_url = link['href'] if link
      person.tags = []

      person
    end
  end
end

namespace :data do
  desc 'Scrape the people from the existing site'
  task :scrape => :environment do
    url = 'http://www.siliconvalleybadgers.com/node/7'

    doc = Nokogiri::HTML(open(url))

    people = []

    doc.css('td').each do |cell|
      lines = cell.content.split("\n")
      image = cell.css('img').first
      link = cell.css('a').first

      lines = lines.map { |line| line.strip }
      lines = lines.select { |line| line.present? }

      name, title, company = lines

      person = Hashie::Mash.new

      person.name = name
      person.title = title
      person.company = company
      person.image = image['src'] if image
      person.linkedin_url = link['href'] if link

      people << person
    end

    puts people

    # TODO:
    #
    # 1.  Parse the people in each filter link and update the people with
    # a list of tags.
    #
    # 2.  Store in yaml.
    #
    # 3.  Separate task to parse yaml and update db.
  end
end

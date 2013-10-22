module Settings
  NAMESPACED_SOURCES = [
    {
      source: Rails.root.join('config', 'settings.yml'),
      namespace: Rails.env
    }
  ]

  SOURCES = [Rails.root.join('config', "credentials-#{Rails.env}.yml")]

  CONFIG = Hashie::Mash.new

  def load_namespaced_sources
    NAMESPACED_SOURCES.each do |source_and_namespace|
      source = source_and_namespace[:source]
      namespace = source_and_namespace[:namespace]

      file_contents = open(source).read
      hash = YAML.load(ERB.new(file_contents).result).to_hash[namespace]
      CONFIG.deep_merge!(hash)
    end
  end

  def load_sources
    SOURCES.each do |source|
      next unless File.exists?(source)

      file_contents = open(source).read
      hash = YAML.load(ERB.new(file_contents).result).to_hash
      CONFIG.deep_merge!(hash)
    end
  end

  def update_hash_values_from_environment!(hash)
    hash.each_pair do |key, value|
      next unless value.is_a?(Hash)

      if value.environment.present? && ENV[value.environment].present?
        hash[key] = ENV[value.environment]
      else
        update_hash_values_from_environment!(value)
      end
    end
  end

  def load_environment
    update_hash_values_from_environment!(CONFIG)
  end

  def load_settings
    load_namespaced_sources
    load_sources
    load_environment
  end

  module_function :update_hash_values_from_environment!

  module_function :load_namespaced_sources
  module_function :load_sources
  module_function :load_environment

  module_function :load_settings

  load_settings
end

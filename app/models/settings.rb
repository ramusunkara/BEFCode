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

  def load_environment
    memo = {}
    # TODO: Make this recursive.
    CONFIG.each_with_object(memo) do |kv, memo|
      k, v = kv
      next unless v.is_a?(Hash) && v.environment.present?

      replacement = ENV[v.environment]
      if replacement.present?
        memo[k] = replacement
      else
        raise "Missing environment variable #{v.environment}"
      end
    end

    CONFIG.deep_merge!(memo)
  end

  def load_settings
    load_namespaced_sources
    load_sources
    load_environment
  end

  module_function :load_namespaced_sources
  module_function :load_sources
  module_function :load_environment

  module_function :load_settings

  load_settings
end

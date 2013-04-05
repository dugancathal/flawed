module Facebook
  class Config < Struct.new(:config)
    def self.from_yaml_file(filename)
      self.config = YAML::load_file(filename)[Rails.env]
    end

    def self.[](key)
      config[key]
    end

    def self.config=(conf)
      @@config = conf
    end

    def self.config
      @@config ||= {}
    end
  end
end

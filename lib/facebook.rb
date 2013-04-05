module Facebook
  class Config < Struct.new(:config)
    def self.from_yaml_file(filename)
      @@config = YAML::load_file(filename)[Rails.env]
    end

    def self.[](key)
      @@config[key]
    end
  end
end

module Facebook
  class Config < Struct.new(:config)
    def self.from_yaml_file(filename)
      self.new(YAML::load_file(filename)[Rails.env])
    end
  end
end

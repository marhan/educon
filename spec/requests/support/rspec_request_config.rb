require "yaml"
require "hashie"

module ConfigLoader
  class Config

    def initialize(config_file)
      self.config_file = config_file
    end

    attr_accessor :config_file

    def to_hash
      load_config config_file
    end

    def to_mash
      Hashie::Mash.new to_hash
    end

    def load_config(config_file)
      raise ArgumentError, "Missing config file: #{config_file}" unless File.exist?(config_file)
      config = File.read config_file
      config = YAML.load config
      config
    end
  end

  def self.create(config_file)
    Config.new(config_file).to_mash
  end

end

require 'mash'
require 'yaml'
require 'singleton'

class SettingsHandler < Mash
  include Singleton
  
  class << self
    def load!(name, value)
      if value.kind_of?(Hash)
        instance.send("#{name}=", Mash.new(value))
      else
        instance.send("#{name}=", value)
      end
    end
  
    def load_from_yaml!(filename, complain=true)
      if File.exists?(filename)
        data = YAML.load(File.read(filename))
        data = prune_data_by_environment(data)
        data.each{ |key, val| load!(key, val) } if data
      else
        puts "[simple_settings] Could not find settings file -- #{filename}" if complain
      end
    end

    def prune_data_by_environment(data)
      env = ENV["RAILS_ENV"] || ENV["MERB_ENV"]
      puts "Settings ENV: #{env}"
      return data[env] if env
      data
    end
  end
end

config_file = if Object.const_defined?(:RAILS_ROOT)
                File.join(RAILS_ROOT, "config", "settings.yml")
              elsif Object.const_defined?(:MERB_ROOT)
                File.join(MERB_ROOT, "config", "settings.yml")
              else
                "settings.yml"
              end

SettingsHandler.load_from_yaml!(config_file)
SimpleSettings = Settings = SettingsHandler.instance

class RibbonGenerator < Rails::Generators::Base
  desc "Set Ribbon API Key"
  argument :api_key, banner: "APIKEY"

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_initializer
    if !api_key_configured? && api_key.blank?
      puts "Must pass API key to create config/initializers/ribbon.rb"
      exit
    end
    template 'templates/initializer.rb', 'config/initializers/ribbon.rb'
  end

  def api_key_configured?
    File.exists?('config/initializers/ribbon.rb')
  end
end

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RadA1
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
      config.before_configuration do
        env_file = '.env'
        File.open(env_file).each do |line|
          key, value = line.split('=')
          ENV[key.to_s] = value
        end if File.exists?(env_file)
      end
  end
end

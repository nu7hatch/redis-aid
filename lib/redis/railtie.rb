require 'rails'

class Redis
  class Railtie < Rails::Railtie
    
    initializer "redis_aid.configure_rails_initialization" do |app|
      app.class.send :include, Redis::Aid
      redis_config_file = Rails.root.join('config/redis.yml')
      
      if File.exists?(redis_config_file)
        redis_config = HashWithIndifferentAccess.new(YAML.load_file(redis_config_file))
        app.redis = Redis.new(redis_config[Rails.env]) if redis_config[Rails.env]
      end
    end

    generators do
      require "redis/generators/install/install_generator.rb"
    end
    
  end # Railtie
end # Redis

require 'redis/generators'

class Redis
  module Generators
    class InstallGenerator < Base

      class_option :host, :type => :string, :default => 'localhost', :desc => "Name of the Redis host use" 

      def create_files
        template 'redis.yml', "config/redis.yml"
        say "Please ensure Gemfile contains: gem 'redis', '>= 2.0'"
        say "For production environment Redis configuration, set environment variables as indicated in config/redis.yml"
      end

      protected

      def host
        options[:host] || 'localhost'
      end

    end # Install
  end # Generators
end # Redis

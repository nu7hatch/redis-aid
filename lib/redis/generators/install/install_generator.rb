require 'rails/generators/base'

class Redis
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      def self.source_root
        @_redis_source_root ||= File.expand_path(File.join("../templates"), __FILE__)
      end
      
      class_option :host, :type => :string, :required => false, :default => 'localhost', :desc => "Name of the Redis host use" 

      def create_files
        options[:host] ||= 'localhost'
        template 'redis.yml.tt', "config/redis.yml"
        say "Please ensure Gemfile contains: gem 'redis', '>= 2.0'"
        say "For production environment Redis configuration, set environment variables as indicated in config/redis.yml"
      end

    end # Install
  end # Generators
end # Redis

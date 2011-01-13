require 'rails/generators/named_base'

class Redis
  module Generators
    class Base < Rails::Generators::NamedBase

      def self.source_root
        @_redis_aid_source_root ||= File.expand_path(File.join("../generators/", generator_name, 'templates'))
      end

    end # Base
  end # Generators
end # Redis

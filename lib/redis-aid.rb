require "redis"
require "nest"

class Redis
  module Aid

    class << self
      def version
        "0.0.1"
      end

      attr_accessor :redis

      def redis
        @redis ||= Redis.new
      end

      def Namespace(ns)
        Redis::Aid.instance_variable_set("@ns", ns)
        Redis::Aid
      end
      alias :Ns :Namespace
    end # << self

    module ClassMethods
      attr_accessor :redis

      def redis
        @redis ||= Redis::Aid.redis
      end

      def ns=(namespace)
        @redis = Nest.new(namespace, redis)
      end
    end # ClassMethods
    
    module InstanceMethods
      def redis
        self.class.redis
      end
    end # InstanceMethods
    
    def self.included(base) # :nodoc:
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
      base.ns = @ns and @ns = nil if @ns 
    end

  end # Aid
end # Redis

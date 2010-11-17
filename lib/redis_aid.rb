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
        @ns = Nest.new(namespace)
      end

      def ns
        @ns ||= Nest.new
      end
    end # ClassMethods
    
    module InstanceMethods
      def redis
        self.class.redis
      end

      def ns
        self.class.ns
      end
    end # InstanceMethods
    
    def self.included(receiver) # :nodoc:
      receiver.send :extend, ClassMethods
      receiver.send :include, InstanceMethods
      receiver.instance_variable_set("@ns", @ns) and @ns = nil if @ns
    end

  end # Aid
end # Redis

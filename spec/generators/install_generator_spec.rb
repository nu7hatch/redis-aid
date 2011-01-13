#require File.expand_path("../../spec_helper", __FILE__)
#require "redis/generators/install/install_generator"

#describe Redis::Generators::InstallGenerator do 
#  context "with no args" do
#    it "should generate a redis configuration file with default host" do
#      subject.should generate("config/redis.yml") { |content|
#        content.should match(/host\: localhost/)
#      }
#    end
#  end
#
#  context "with a host" do
#    with_args 'host.com'
#
#    it "should generate a redis configuration file with given host" do
#      subject.should generate("config/redis.yml") { |content|
#        content.should match(/host\: host\.com/)
#      }
#    end
#  end
#end

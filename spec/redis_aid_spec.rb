require File.expand_path("../spec_helper", __FILE__)

class First
  include Redis::Aid
end

class Second
  include Redis::Aid::Ns(:test)
end

describe Redis::Aid do
  subject do
    Redis::Aid
  end

  describe "#redis" do
    context "when no connection set before" do
      it "should return default connection" do
        Redis::Aid.redis.should be_kind_of Redis
      end
    end

    context "when connection set before" do
      it "should return it" do
        Redis::Aid.redis = "test"
        Redis::Aid.redis.should == "test"
      end
    end
  end
end

describe "Class with Redis Aid" do
  subject do 
    First
  end

  before do
    Redis::Aid.redis = "test"
  end

  describe ".redis" do
    context "when no custom connection set before" do    
      it "should return global connection" do
        klass = subject
        klass.redis.should == "test"
      end
    end

    context "when custom connection set" do
      it "should return it" do
        klass = subject
        klass.redis = "test2"
        klass.redis.should == "test2"
      end
    end
  end

  describe "#redis" do
    it "should be alias for .redis" do
      klass = subject.new
      klass.class.redis = "testing"
      klass.redis.should == "testing"
    end
  end
end

describe "Class with namespaced Redis Aid" do
  subject do 
    Second
  end

  before do
    Redis::Aid.redis = Redis.new
  end

  describe "#redis" do
    it "should return nested client instance" do
      klass = subject
      klass.redis.should be_kind_of Nest
    end

    it "should work properly" do
      Redis::Aid.redis.set("test:bar:bla", "testing")
      klass = subject
      klass.redis[:bar][:bla].get.should == "testing"
    end
  end
end

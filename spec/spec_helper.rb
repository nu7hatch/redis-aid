require "rspec"
require "mocha"
require "redis-aid"

RSpec.configured do |conf|
  conf.mock_with :mocha
end

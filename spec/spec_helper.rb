require "rspec"
require "mocha"
require "redis-aid"

RSpec.configure do |conf|
  conf.mock_with :mocha
end

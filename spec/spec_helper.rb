require 'bundler'

Bundler.setup
Bundler.require

require 'goliath/test_helper'
require 'yajl'
require_relative '../read_later'
Goliath.env = :test

RSpec.configure do |c|
  c.include Goliath::TestHelper, example_group: {
    file_path: /spec\/integration/
  }
end

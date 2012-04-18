#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
Bundler.require :default

require 'goliath'

class ReadLater < Goliath::API
  use Goliath::Rack::Params
  use Goliath::Rack::DefaultMimeType
  use Goliath::Rack::Render, 'json'

  use Goliath::Rack::Validation::RequiredParam, { key: 'url', type: 'Url'}

  def response(env)
    db.aquery("INSERT INTO `articles` (`url`) VALUES ('#{params[:url]}'")
    [200, {}, 'OK']
  end
end

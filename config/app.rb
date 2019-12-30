# frozen_string_literal: true

require "config/sequel"
require "config/models"

require "roda"
require "strum"

unless defined?(Unreloader)
  require "rack/unreloader"
  Unreloader = Rack::Unreloader.new(reload: false)
end

Unreloader.require("services")

# Main StreamingServiceApp route class
class StreamingServiceApp < Roda
  opts[:root] = ENV["STRUM_ROOT"]
  plugin :all_verbs
  plugin :symbol_status
  plugin :json, content_type: "application/vnd.api+json"
  plugin :json_parser

  plugin :hash_routes
  Unreloader.require("routes")

  route(&:hash_routes)

  # for more details usage
  # route do |req|
  #   req.public
  #   req.hash_routes
  # end
end

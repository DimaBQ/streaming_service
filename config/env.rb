# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("..", __dir__), File.expand_path("../lib", __dir__))

ENV["RACK_ENV"] ||= "development"

unless ENV["RACK_ENV"] == "production"
  require "dotenv"
  Dotenv.load(".env.#{ENV['RACK_ENV'].downcase}", ".env.local")
end

ENV["STRUM_ROOT"] = File.expand_path("..", __dir__)

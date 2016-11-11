require "./clug/*"
require "http/server"
require "option_parser"
require "kemal"

ENV["PORT"] = "3333" unless ENV.has_key?("PORT")
Kemal.config.port = ENV["PORT"].to_i


# database


# controllers
require "./controllers/base_controller.cr"
require "./controllers/home_controller.cr"

Kemal.run
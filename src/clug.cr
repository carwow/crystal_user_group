require "./clug/*"
require "http/server"
require "option_parser"
require "kemal"

Kemal.config.port = 3333

require "./controllers/base_controller.cr"
require "./controllers/home_controller.cr"

Kemal.run
require "./clug/*"
require "http/server"
require "option_parser"
require "kemal"
require "yaml"
require "pg"
require "ecr/macros"


ENV["PORT"] = "3333" unless ENV.has_key?("PORT")
Kemal.config.port = ENV["PORT"].to_i


# database
# db = YAML.parse(File.read("./config/development.yml"))["database"]

# class AppProperties
#   ECR.def_to_s "./config/development.yml.ecr"
# end


io = MemoryIO.new
ECR.embed "./config/development.yml.ecr", io
puts io.to_s

DB = PG.connect("postgres://clug:carwow@localhost/lcrug_development")                

# controllers
require "./controllers/base_controller.cr"
require "./controllers/home_controller.cr"

Kemal.run
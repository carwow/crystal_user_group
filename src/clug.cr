require "./clug/*"
require "http/server"
require "kemal"
require "pg"
require "../tasks/database_migrator"
require "../config/app_config"


ENV["PORT"] = "3333" unless ENV.has_key?("PORT")
Kemal.config.port = ENV["PORT"].to_i


# database
DATABASE = PG.connect(AppConfig.new.db_connection_string)

# controllers
require "./controllers/base_controller.cr"
require "./controllers/home_controller.cr"

#models
require "./models/base_model.cr"
require "./models/meetup.cr"


DatabaseMigrator.new.create
DatabaseMigrator.new.migrate
Kemal.run
require "yaml"
require "ecr/macros"

class AppConfig

  def initialize
    ENV["KEMAL_ENV"] = "development" unless ENV.has_key?("KEMAL_ENV")
    set_dev_properties if ENV["KEMAL_ENV"] == "development"
  end

  def set_dev_properties
    ENV["db_name"] = "lcrug_development"
    ENV["db_user"] = "clug"
    ENV["db_password"] = "carwow"
    ENV["db_host"] = "localhost"
  end

  def db_user
    ENV["db_user"]
  end

  def db_password
    ENV["db_password"]
  end

  def db_host
    ENV["db_host"]
  end

  def db_name
    ENV["db_name"]
  end

    def db_connection_string
    "postgres://#{db_user}:#{db_password}@#{db_host}/#{db_name}"
  end

end
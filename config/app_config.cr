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

  # def initialize
  #   io = MemoryIO.new
  #   ENV["KEMAL_ENV"] = "development" unless ENV.has_key?("KEMAL_ENV")
  #   ECR.embed("./config/#{ENV["KEMAL_ENV"].to_s}.yml.ecr", io)
  #   @config = YAML.parse(io.to_s)    
  #   io.close
  # end

  def db_connection_string
    "postgres://#{ENV["db_user"]}:#{ENV["db_password"]}@#{ENV["db_host"]}/#{ENV["db_name"]}"
  end

end
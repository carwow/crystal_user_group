class AppConfig

  def initialize
    io = MemoryIO.new

    ENV["KEMAL_ENV"] = "development" unless ENV.has_key?("KEMAL_ENV")
    ECR.embed("./config/#{ENV["KEMAL_ENV"].to_s}.yml.ecr", io)
    @config = YAML.parse(io.to_s)
    io.close
  end

  def db_config
    @config["database"]
  end

  def db_connection_string
    "postgres://#{db_config["user"]}:#{db_config["password"]}@#{db_config["host"]}/#{db_config["name"]}"    
  end
end
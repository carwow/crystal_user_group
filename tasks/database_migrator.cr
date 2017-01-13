require "http/server"
require "kemal"
require "pg"
require "../config/app_config"

class DatabaseMigrator
  @db : DB::Database
  
  def initialize
    ENV["KEMAL_ENV"] = "development" unless ENV.has_key?("KEMAL_ENV")
    set_dev_properties if ENV["KEMAL_ENV"] == "development"
    @config = AppConfig.new
    @db = PG.connect(@config.db_connection_string)
  end

  def set_dev_properties
    ENV["db_name"] = "lcrug_development"
    ENV["db_user"] = "clug"
    ENV["db_password"] = "carwow"
    ENV["db_host"] = "localhost"
  end
  
  def migrate
    migrations = Dir.entries("./db/migrate").select!{|file| file.ends_with?(".sql")}.as(Array(String))

    migrations = migrations.sort do |first, second|      
      first.split('_').first.to_i <=> second.split('_').first.to_i
    end

    migrations.each do |filename|
      next unless filename.ends_with?(".sql")
      run_migration(filename)
    end
  end

  def run_migration(filename)
    return if migration_already_run?(filename)    
    sql = File.read("./db/migrate/#{filename}")
    @db.exec(sql)

    @db.exec("INSERT INTO migrations VALUES('#{filename}', current_timestamp);")
    puts "finished running migration: #{filename}"
  end

  def migration_already_run?(filename)
    migration = @db.query("SELECT name FROM migrations WHERE name = '#{filename}'")
    migration.move_next
  end

  def create
    puts "creating database..."
    system("createdb #{@config.db_name} -O #{@config.db_user}")
    @db.exec("CREATE TABLE IF NOT EXISTS migrations(name varchar(255), migrated_on timestamp);")
    puts "...done!"
  end 
end
require "pg"
require "yaml"

class DatabaseMigrator

  def initialize
    @db_config = YAML.parse(File.read("./config/development.yml"))["database"].as(YAML::Any)
  end

  def connection
    connection_string = "postgres://#{@db_config["user"]}:#{@db_config["password"]}@#{@db_config["host"]}/#{@db_config["name"]}"
    puts connection_string
    if @db.nil?
      @db = PG.connect(connection_string)
    end
    @db.as(PG::Connection)
  end
	
  def run    
    migrations = Dir.foreach("./db/migrate") do |filename|
      next unless filename.ends_with?(".sql")
      run_migration(filename)
    end
  end

  def run_migration(filename)
    return if migration_already_run?(filename)
    sql = File.read("./db/migrate/#{filename}")
    connection.exec(sql)
    connection.exec("INSERT INTO migrations VALUES('#{filename}');")
  end

  def migration_already_run?(filename)
    migration = connection.exec("SELECT * FROM migrations WHERE name = '#{filename}'")
    migration.rows.any?
  end

  def generate_migration(filename)
    File.new("./db/migrate/#{Time.now.to_s}_#{filename}.sql")
  end

  def create
    system("createdb #{@db_config["name"]} -O #{@db_config["user"]}")
    connection.exec("CREATE TABLE migrations(name varchar(255));")
  end 
end
require "./tasks/database_migrator"
require "kemal"

puts "Please specify a task -- TASK_NAME" if ARGV.empty?
unless ARGV.empty?
  ARGV.each do |argument|
    DatabaseMigrator.new.create if argument == "db:create"
    DatabaseMigrator.new.migrate if argument == "db:migrate"
  end
end

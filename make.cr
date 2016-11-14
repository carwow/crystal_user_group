#!/usr/bin/env/crystal

require "./tasks/database_migrator"
require "kemal"

puts "Please specify a task -- TASK_NAME" if ARGV.empty?
unless ARGV.empty?
  ARGV.each do |argument|
    DatabaseMigrator.new.run if argument == "db:migrate"
    DatabaseMigrator.new.create if argument == "db:create"
    # DatabaseMigrator.new.generate_migration if argument == "generate_migration"
  end
end

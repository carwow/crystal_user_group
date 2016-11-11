require "./tasks/database_migrator"

puts "Running"
puts "Please specify a task -- TASK_NAME" if ARGV.empty?
unless ARGV.empty?
  ARGV.each do |argument|
    hello if argument == "hello"
    DatabaseMigrator.new.run if argument == "db:migrate"
    DatabaseMigrator.new.create if argument == "db:create"
    # DatabaseMigrator.new.generate_migration if argument == "generate_migration"
  end
end

def hello
  puts "hello"
end

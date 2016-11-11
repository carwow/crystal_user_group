puts "Running"
puts "Please specify a task -- TASK_NAME" if ARGV.empty?
unless ARGV.empty?
  ARGV.each do |argument|
    hello if argument == "hello"
  end
end

def hello
  puts "hello"
end

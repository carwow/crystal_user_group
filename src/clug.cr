require "./clug/*"
require "http/server"
require "option_parser"

bind = "0.0.0.0"
port = 3333

OptionParser.parse! do |opts|
  opts.on("-p PORT", "--port PORT", "define port to run server") do |opt|
    port = opt.to_i
  end
end

server = HTTP::Server.new(bind, port) do |context|
  context.response.content_type = "text/plain"
  context.response << "Hello world, got #{context.request.path}"
end

puts "Listening on http://#{bind}:#{port}"
server.listen
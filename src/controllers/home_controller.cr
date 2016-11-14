class HomeController < BaseController
	
  get "/" do
    # result = Meetup.all
    result = "todo"

    s = MemoryIO.new
    ENV.inspect(s)
    current_env = s.to_s

    render_template("index", "layout")
  end

end
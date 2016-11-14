class HomeController < BaseController
	
  get "/" do
    # result = DB.exec({String}, "select data from test_2").to_hash
    result = Meetup.all

    s = MemoryIO.new
    ENV.inspect(s)
    current_env = s.to_s


    render_template("index", "layout")
  end

end
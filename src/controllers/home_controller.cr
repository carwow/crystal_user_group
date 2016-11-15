class HomeController < BaseController
	
  get "/" do
    result = Meetup.all.first
    # result = "todo"

    render_template("index", "layout")
  end

end
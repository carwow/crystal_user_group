class HomeController < BaseController
	
  get "/" do
    result = Meetup.all
    # result = "todo"

    render_template("index", "layout")
  end

end
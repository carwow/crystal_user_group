class HomeController < BaseController
	
  get "/" do
    result = Meetup.all

    render_template("index", "layout")
  end

end
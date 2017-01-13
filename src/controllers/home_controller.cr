class HomeController < BaseController
	
  get "/" do
    meetup = Meetup.all.last

    render_template("index", "layout")
  end

end
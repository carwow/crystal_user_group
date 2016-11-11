class HomeController < BaseController
	
  get "/" do
    render_template("index", "layout_two")
  end

end
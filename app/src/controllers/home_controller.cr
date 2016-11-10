class HomeController < BaseController
	
  get "/kemal" do
	 render_template("index", "layout_two")
  end

end
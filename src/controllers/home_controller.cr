class HomeController < BaseController
	
  get "/" do
    result = DB.exec({String}, "select data from test").to_hash

    render_template("index", "layout_two")
  end

end
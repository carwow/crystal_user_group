class HomeController < BaseController
	
  get "/" do
    result = DB.exec({String}, "select data from test_2").to_hash

    render_template("index", "layout")
  end

end
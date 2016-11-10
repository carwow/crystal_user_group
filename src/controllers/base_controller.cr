class BaseController

  macro render_template(template_name, layout = "layout")
    {{view_dir = @type.stringify.downcase.gsub(/controller/, "")}}

    render "src/views/#{{{view_dir}}}/#{{{template_name}}}.ecr", "src/views/layouts/#{{{layout}}}.ecr"
  end

end

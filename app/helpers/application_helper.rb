module ApplicationHelper

  # Sets the body id in views and puts it in the layout
  def body_id(id = nil)
    if id.present?
      @body_id = id
    else
      @body_id ? " id=\"#{@body_id}\"".html_safe : nil
    end
  end

end

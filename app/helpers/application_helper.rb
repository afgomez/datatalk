require 'digest/md5'

module ApplicationHelper
  
  # outputs the gravatar <img> for the specified user
  def gravatar_for user
    
    hash = Digest::MD5.hexdigest(user.email.downcase)
    src  = "http://www.gravatar.com/avatar/#{hash}?s=36&d=mm"
    
    image_tag src, :class => 'avatar'
  end
  
  
  # Sets the body id in views and puts it in the layout
  def body_id(id = nil)
    if id.present?
      @body_id = id
    else
      @body_id ? " id=\"#{@body_id}\"".html_safe : nil
    end
  end

  def create_or_edit_user_registration_path
    if user_signed_in?
      return link_to('Editar registro', edit_member_path(current_user))
    else
      return link_to('Registrarse', new_member_path)
    end
  end

  def login_or_logout_path
    if user_signed_in?
      return link_to('Salir', destroy_user_session_path)
    else
      return link_to('Login', new_user_session_path)
    end
  end
  
  
  
  
end

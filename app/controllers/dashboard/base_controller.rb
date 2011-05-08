class Dashboard::BaseController < ApplicationController
  before_filter :login_required

  protected

  def login_required
    if current_user.nil?
      redirect_to root_path
    end
  end
end
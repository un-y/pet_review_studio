class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new], unless: :admin_controller?

  private
 
  def configure_authentication¥
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user!
    end
  end

  def admin_controller?
    controller_path.include?("admin")
  end

  def action_is_public?
    controller_name == 'homes' && action_name == 'top'
  end

end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :hide_menu, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.rails_admin_url, alert: exception.message
  end

  private

  def hide_menu
    @hide_menu = true
  end
end

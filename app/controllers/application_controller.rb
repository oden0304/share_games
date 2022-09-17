class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  before_action :authenticate_admin_user!, except: [:top, :terms]

  # before_action :hoge
  # def hoge
  #   binding.pry
  #   sign_in 

  # end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      # pp "ログイン出来たよ"
      admin_root_path
    when User
      public_user_path(current_user)
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :agreement])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:name, :email])
  end
  
  def authenticate_admin_user!
    # binding.pry
    if !admin_signed_in? && !user_signed_in? && !devise_controller?
      redirect_to root_path
    end
  end
end

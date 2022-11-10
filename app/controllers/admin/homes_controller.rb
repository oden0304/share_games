class Admin::HomesController < ApplicationController
  def top
    if admin_signed_in?
      @users = User.all
    else
      redirect_to new_admin_session_path
    end
  end
end

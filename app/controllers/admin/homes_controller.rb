class Admin::HomesController < ApplicationController
  def top
    unless admin_signed_in?
      redirect_to new_admin_session_path
    else
      @users = User.all
    end
  end
end

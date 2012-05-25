class SessionsController < ApplicationController
  def create
    sign_in_user params[:session][:email]
    redirect_to todos_path
  end

  def destroy
    sign_out_user
    redirect_to root_path
  end
end

class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Successfully Logged In'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Loged Out"
  end
end

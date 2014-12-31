class UsersController < ApplicationController

  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(nickname: params[:username])
    @notes = @user.notes
    @five_star_notes = Note.where(user_id: @user.id, overall: 5).count
  end

  def list
    @user = User.find_by(nickname: params[:username])
    @note = Note.find_by(id: params[:note_id])
  end
end

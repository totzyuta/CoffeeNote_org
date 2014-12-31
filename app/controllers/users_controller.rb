class UsersController < ApplicationController
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

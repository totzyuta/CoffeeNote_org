class NotesController < ApplicationController
  def index
    @current_user = User.find_by(id: session[:user_id])
    # @user = User.find_by(nickname: params[:username])
    # @users = User.all
    # @notes = @users.notes
    @notes = Note.all
  end

  def show
    # Fetch a certain note
    @note = Note.find_by(id: params[:id])
    @user = User.find_by(id: @note.user_id)
  end

  def new
    @current_user = User.find_by(id: session[:user_id])
  end

  def create
    @current_user = User.find_by(id: session[:user_id])
    @note = Note.new
    @note.uid = session[:user_id]
    @note.blendName = params[:note][:blendName]
    @note.origin = params[:note][:blendName]
    @note.place = params[:note][:blendName]
    @note.roast = params[:note][:roast]
    @note.body = params[:note][:body]
    @note.flavor = params[:note][:flavor]
    @note.acidity = params[:note][:acidity]
    @note.sweetness = params[:note][:sweetness]
    @note.cleancup = params[:note][:cleancup]
    @note.aftertaste = params[:note][:aftertaste]
    @note.overall = params[:note][:overall]
    @note.comment = params[:note][:comment]
    @note.user_id = @current_user.id
    @note.save
    redirect_to "/users/show/#{@current_user.nickname}/#{@note.id}"
  end

  private

  def note_params
    params.require(:note).permit(
      :blendName, :overall
    )
  end

end

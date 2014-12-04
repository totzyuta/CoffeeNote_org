class NotesController < ApplicationController
  def index
    # @notes = Note.all

    @user = User.find(2)
    @notes = @user.notes
  end

  def show
  end

  def new
  end

  def create
    @note = Note.new
    @note.uid = session[:user_id]
    @note.blendName = params[:note][:blendName]
    @note.overall = params[:note][:overall]
    @note.save
    redirect_to '/notes/index'
  end

  private

  def note_params
    params.require(:note).permit(
      :blendName, :overall
    )
  end

end

class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
  end

  def new
  end

  def create
    @note = Note.new
    @note.blendName = params[:note][:blendName]
    @note.uid = params[:note][:uid]
    @note.save
    redirect_to '/notes/index'
  end
end

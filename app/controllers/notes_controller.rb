class NotesController < ApplicationController

  before_action :set_current_user
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def index
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
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = @current_user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note }
      else
        format.html { render action: 'new' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @current_user = User.find_by(id: session[:user_id])
    @note = Note.find_by(id: params[:id])
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        # format.json { render action: 'edit', status: :created, location: @note }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to "/users/#{@current_user.nickname}", notice: 'Note was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def note_params
    params.require(:note).permit(
      :blendName, :origin, :place, :date, :roast, :dark, :body, :flavor, :acidity, :sweetness, :cleancup, :aftertaste, :overall, :comment
    )
  end

  def set_note
    @note = Note.find(params[:id])
  end

end

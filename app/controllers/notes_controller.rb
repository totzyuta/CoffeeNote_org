require 'kconv'
class NotesController < ApplicationController

  before_action :set_current_user
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def index
    @notes = Note.all
    @users = User.all
  end

  def show
    # Fetch a certain note
    @note = Note.find(params[:id])
    @user = User.find(@note.user_id)
    @roast = ''
    case @note.roast
    when 1
        @roast =  "Light"
    when 2
        @roast = "Medium"
    when 3
        @roast = "Dark"
    end
    @dark = ''
    case @note.dark
    when 1
        @dark =  "Light"
    when 2
        @dark = "Medium"
    when 3
        @dark = "Dark"
    end
    @body = ''
    case @note.body
    when 1
        @body =  "Light"
    when 2
        @body = "Medium"
    when 3
        @body = "Heavy"
    end
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
    @note = Note.find(params[:id])
    gon.overall = @note.overall
  end

  def update
    if note_params[:coffee_image1]
      respond_to do |format|
        if @note.update(note_params)
          format.html { redirect_to @note, notice: "note was successfully updated with image file" }
          # format.json { render action: 'edit', status: :created, location: @note }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if Note.where("id = #{@note.id}").update_except_for_image_path(note_params)
          format.html { redirect_to @note, notice: "#{params[:blendName]}note was successfully updated except for image file." }
          # format.json { render action: 'edit', status: :created, location: @note }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
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
      :blendName, :origin, :place, :date, :roast, :dark, :body, :flavor, :acidity, :sweetness, :cleancup, :aftertaste, :overall, :comment, :coffee_image1
    )
  end

  def set_note
    @note = Note.find(params[:id])
  end

end

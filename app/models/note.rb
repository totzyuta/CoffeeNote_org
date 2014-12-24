class Note < ActiveRecord::Base
  belongs_to :user
  mount_uploader :coffee_image1, ImageUploader

  def self.update_except_for_image_path(note_params)
    Note.where(@note).update_all(blendName: note_params[:blendName], origin: note_params[:origin], place: note_params[:place], date: note_params[:date], roast: note_params[:roast], dark: note_params[:dark], body: note_params[:body], flavor: note_params[:flavor], acidity: note_params[:acidity], sweetness: note_params[:sweetness], cleancup: note_params[:cleancup], aftertaste: note_params[:aftertaste], overall: note_params[:overall])
  end
end

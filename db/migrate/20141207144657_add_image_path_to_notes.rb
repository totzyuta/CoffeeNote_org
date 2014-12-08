class AddImagePathToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :coffee_image1, :varchar, after: :comment
  end
end

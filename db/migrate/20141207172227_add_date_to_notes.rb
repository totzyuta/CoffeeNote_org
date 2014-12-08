class AddDateToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :data, :datetime, :after => :place
  end
end

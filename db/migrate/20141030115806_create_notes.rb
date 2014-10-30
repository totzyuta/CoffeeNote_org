class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :uid
      t.string :blendName

      t.timestamps
    end
  end
end

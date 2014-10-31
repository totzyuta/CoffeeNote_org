class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :uid
      t.string :blendName
      t.string :origin
      t.string :place
      t.integer :roast
      t.integer :dark
      t.integer :body
      t.integer :flavor
      t.integer :acidity
      t.integer :sweetness
      t.integer :cleancup
      t.integer :aftertaste
      t.integer :overall
      t.text :comment
      t.integer :public

      t.timestamps
    end
  end
end

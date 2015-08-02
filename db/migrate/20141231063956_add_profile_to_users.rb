class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string, :after => :image_url
  end
end

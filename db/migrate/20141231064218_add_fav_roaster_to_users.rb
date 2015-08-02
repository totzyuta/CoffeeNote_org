class AddFavRoasterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fav_roaster, :string, :after => :profile
  end
end

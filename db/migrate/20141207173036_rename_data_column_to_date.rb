class RenameDataColumnToDate < ActiveRecord::Migration
  def change
    rename_column :notes, :data, :date
  end
end

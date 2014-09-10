class RemovingFavoriteFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :favorite
  end

  def down
    add_column :books, :favorite
  end
end

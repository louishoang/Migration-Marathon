class AddFavoriteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :favorite, :boolean, defaut: false
  end
end

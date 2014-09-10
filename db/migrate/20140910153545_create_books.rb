class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |book|
      book.string :title, null: false
      book.string :author, null:false
      book.integer :year, null: false
      book.text :description, null:false

      book.timestamps
    end
  end
end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamp
    end
    add_index :categories, :name, unique: true

    create_table :categorizations do |t|
      t.integer :book_id, null: false
      t.integer :category_id, null: false

      t.timestamp
    end
    add_index :categorizations, [:book_id, :category_id], unique: true
  end
end

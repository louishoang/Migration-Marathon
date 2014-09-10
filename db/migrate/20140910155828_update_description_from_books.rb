class UpdateDescriptionFromBooks < ActiveRecord::Migration
  def up
    change_column :books, :description, :text, null: true
  end

  def down
    Book.all.find_each do |book|
      book.update!(description: 'something') unless book.description
    end

    change_column :books, :description, :text, null: false
  end

end

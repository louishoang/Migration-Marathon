class CreateReader < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :full_name, null: false
      t.string :email, null: true
      t.string :phone_number, null: false

      t.timestamp
    end
  end
end

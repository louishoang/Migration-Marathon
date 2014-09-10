require 'pry'

class AddFirstNameLastNameToReader < ActiveRecord::Migration
  class Reader < ActiveRecord::Base; end;

  def up
    add_column :readers, :first_name, :string
    add_column :readers, :last_name, :string

    Reader.find_each do |reader|
      reader.first_name = reader.full_name.split(' ')[0]
      reader.last_name = reader.full_name.split(' ')[1..-1].join(' ')
      reader.save!
    end

    change_column :readers, :first_name, :string, null: false
    change_column :readers, :last_name, :string, null: false
    remove_column :readers, :full_name
  end

  def down
    add_column :readers, :full_name, :string

    Reader.find_each do |reader|
      reader.full_name = [reader.first_name, reader.last_name].join(' ')
      reader.save!
    end

    change_column :readers, :full_name, :string, null: false
    remove_column :readers, :first_name
    remove_column :readers, :last_name
  end
end

class NormalizeCheckout < ActiveRecord::Migration
  def up
    add_column :checkouts, :reader_id, :integer

    # iterate through all existing CHeckouts
    # for each checkout

    reader = Reader.create!(full_name: 'Louis', email: 'louis@aol.com', phone_number: '12038872222')

    Checkout.all.find_each do |checkout|
      # assign newly created/found Reader with the checkout
      checkout.reader = reader
      # save checkout

      checkout.save!
    end

    change_column :checkouts, :reader_id, :integer, null: false
  end

  def down
    remove_column :checkouts, :reader_id
  end
end

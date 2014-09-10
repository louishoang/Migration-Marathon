class Book < ActiveRecord::Base
  validates :rating, inclusion: { in: 0..100 }
end

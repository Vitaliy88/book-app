class BookCategory < ApplicationRecord
  belongs_to :book
  belongs_to :categories
end

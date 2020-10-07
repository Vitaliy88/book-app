class Category < ApplicationRecord
  has_and_belongs_to_many :books

  def self.create_category(category_name)
    where(name: category_name).first_or_create(
      name: category_name
    )
  end
end

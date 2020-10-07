class Publisher < ApplicationRecord
  has_many :books

  def self.create_publisher(publisher_name)
    where(name: publisher_name).first_or_create(
      name: publisher_name
    )
  end
end

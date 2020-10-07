class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :categories

  def as_json(options = {})
    super(
      :include => {
        :categories => {only: [:id, :name]},
        :publisher => {only: [:name]}
      }
    )
  end

  def self.get_books_list
    all
  end

  def self.return_specific_book(book_id)
    find(book_id)
  end

  def self.create_book_with_publisher(params)
    categories = []
    params[:categories]&.each do |category_name|
      categories << Category.find_or_create_by(name: category_name)
    end

    publisher = Publisher.find_or_create_by!(params[:publisher])

    create!(
      params[:book].merge(
        publisher_id: publisher.id,
        category_ids: categories.collect(&:id)
      )
    )
  end

  def self.update_book(book_id, book_params)
    update(book_id, book_params)
  end

  def self.delete_book(book_id)
    find_by_id(book_id).destroy
  end

  def self.book_search(query)
    url = URI.parse("https://www.googleapis.com/books/v1/volumes?q=#{query}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    res.body
  end
end

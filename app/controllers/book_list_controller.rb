class BookListController < ApplicationController
  def books_list
    @props = { url: "http://localhost:3000/api/v1/books" }
  end
end

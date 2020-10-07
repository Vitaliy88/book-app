require 'rails_helper'

RSpec.describe "BookLists", type: :request do

  describe "GET /books_list" do
    it "returns http success" do
      get "/book_list/books_list"
      expect(response).to have_http_status(:success)
    end
  end

end

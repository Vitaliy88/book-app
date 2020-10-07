require "rails_helper"

RSpec.describe "Create book", type: :request do

  describe 'POST /books' do
    let(:books_params) do
      {
        book: {
          title: 'Clean Code',
          description: 'Book desc',
          page_count: '100'
        },
        publisher: {
          name: 'Pearson'
        },
        categories: 'Programming',
      }
    end

    it "creates a book" do
      expect do
        post '/books', params: :books_params
      end.to change { Book.count }.by(1)
    end
  end
  # describe 'get /books' do
  #   if Book.count == 0
  #
  #   end
  #   it "creates a book" do
  #     expect do
  #       post '/quests', params: :books_params
  #     end.to change { Book.count }.by(1)
  #   end
  # end
end
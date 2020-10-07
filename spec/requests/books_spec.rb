require "rails_helper"

RSpec.describe "Create book", type: :request do

  describe 'POST /books' do
    let(:books_params) do
      {
        title: 'Clean Code',
        description: 'Book desc',
        page_count: '100',
        publisher: 'Pearson',
        categories: 'Programming'
      }
    end

    it 'Creates a book' do
      expect do
        post '/api/v1/books', params: books_params
      end.to change { Book.count }.by(1)
    end

    it 'Gets a book' do
      expect do
        get '/api/v1/books'
        expect(response.status).to_eq(201)
      end
    end

    it 'Gets a book by id' do
      expect do
        get '/api/v1/books/1'
        expect(response.status).to_eq(201)
      end
    end

    it 'Delete a book' do
      expect do
        delete '/api/v1/books/1'
      end.to change { Book.count }.by(0)
    end
  end
end
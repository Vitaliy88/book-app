require 'net/http'

module V1
  class Books < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api
    resource :books do
      desc 'Returns list of books'
      get do
        Book.get_books_list
      end

      desc 'Returns a specific book'
      route_param :id do
        get do
          present Book.return_specific_book(params[:id])
        end
      end

      desc 'Creates a book'
      params do
        requires :book, type: Hash, desc: 'Your book' do
          requires :title, type: String, desc: 'Title.'
          requires :description, type: String, desc: 'Description.'
          requires :page_count, type: Integer, desc: 'Page count.'
        end
        requires :publisher, type: Hash, desc: 'Your publisher' do
          optional :name, type: String, desc: 'Publisher name'
        end
        optional :category, type: Array, desc: 'List of categories'
      end
      post do
        Book.create_book_with_publisher(params)
      end

      desc 'Updates a book'
      params do
        requires :book, type: Hash, desc: 'Your book' do
          optional :title, type: String, desc: 'Title.'
          optional :description, type: String, desc: 'Description.'
          optional :page_count, type: Integer, desc: 'Page count.'
        end
      end
      route_param :id do
        put do
          Book.update_book(params[:id], params[:book])
        end
      end

      desc 'Deletes a book'
      params do
        requires :id, type: Integer, desc: 'Book id.'
      end
      route_param :id do
        delete do
          Book.delete_book(params[:id])
        end
      end

      resource '/search' do
        desc 'Return a book using www.googleapis.com'
        route_param :q do
          get do
            Book.book_search(params[:q])
          end
        end
      end

    end
  end
end
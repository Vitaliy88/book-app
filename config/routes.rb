Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'books-list', to: 'book_list#books_list'
  # get 'books_list', to: 'hello_world#books_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # mount BookApp::Base => '/'
  mount API => '/'
end

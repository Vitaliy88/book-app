class CreateBookCategories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :categories, table_name: "books_categories" do |t|
      t.index [:book_id, :category_id]
    end
  end
end
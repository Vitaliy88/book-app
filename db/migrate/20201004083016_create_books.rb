class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.integer :page_count
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end

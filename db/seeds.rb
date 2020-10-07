# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
#   Publisher.create!(
#       name: Faker::Book.publisher
#   )
# end
#
# 5.times do
#   Category.create!(
#       categories_array: Faker::Books::Lovecraft.words(number: 4, spaces_allowed: true)
#   )
#   puts Category
# end
#
# category_ids = Category.ids
#
# 15.times do
#   puts Publisher.all.sample.book.create(
#     category_id: category_ids.sample,
#     title: Faker::Book.title,
#     description: Faker::Books::Lovecraft.sentence(word_count: 2),
#     page_count: Faker::Number.between(100, 500),
#   )
# end

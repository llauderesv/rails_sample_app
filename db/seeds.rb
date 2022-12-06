# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..10).each do |x|
  User.create(
    first_name: Faker::TvShows::GameOfThrones.character, 
    last_name: Faker::TvShows::GameOfThrones.character, 
    age: 25, 
    address: Faker::TvShows::GameOfThrones.character)
end
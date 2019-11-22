# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all

# i = 1
# 10.times do
#   Cocktail.create(name: Faker::Games::Pokemon.name, description: 'Lorem ipsum', imgurl: "https://source.unsplash.com/collection/962396/1200x500/?sig=#{i}")
#   i+=1
# end

puts "created #{Cocktail.all.length}"

Ingredient.destroy_all

data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
list = JSON.parse(data)
list["drinks"].each do |e|
  Ingredient.create(name: e['strIngredient1'])
end

puts "created #{Ingredient.all.length}"


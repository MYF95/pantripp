User.create!(email: 'ponsan@bork.com', password: 'chicken', password_confirmation: 'chicken')
User.create!(email: 'mikota@bork.com', password: 'chicken', password_confirmation: 'chicken')

List.create!(name: 'Ponsan List', capacity: 150, location: 'Las Palmas')

30.times do |n|
  product_name = Faker::Food.dish
  info = Faker::OnePiece.quote
  ingredients = Faker::Food.ingredient
  brand = Faker::WorldOfWarcraft.hero
  shelf = Faker::Number.between(1,100)
  Product.create!(name: product_name, brand: brand, ingredients: ingredients, info: info, shelf: shelf)
end

15.times do |n|
  list_name = Faker::Kpop.girl_groups
  capacity = Faker::Number.between(50, 1000)
  location = Faker::LordOfTheRings.location
  List.create!(name: list_name, capacity: capacity, location: location)
end
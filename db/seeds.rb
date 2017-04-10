require 'faker'

5.times do
  Escape.create!(
    name: Faker::GameOfThrones.house,
  	description: Faker::GameOfThrones.dragon,
    price: Faker::Number.decimal(2),
  	city: Faker::GameOfThrones.city,
  	image: Faker::Avatar.image
    )
end

puts "Seed finished"
puts "#{Escape.count} categories created"

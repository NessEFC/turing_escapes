require 'faker'

titles = []
2.times do
  titles << Faker::GameOfThrones.house
end

titles.each do |title|
  category = Category.create(title: title)
  escape = Escape.create(name: Faker::GameOfThrones.house,
                description: Faker::GameOfThrones.dragon,
                price: Faker::Number.decimal(2),
                city: Faker::GameOfThrones.city,
                image: Faker::Avatar.image
               )

  EscapeCategory.create(escape_id: escape.id, category_id: category.id)
end


puts "Seed finished"
puts "#{Escape.count} categories created"

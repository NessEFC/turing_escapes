Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", city: "Denver", price: 200.00, photo: File.new(Rails.root + "app/assets/images/gentle_dawn.jpg"))

Escape.create(name: "Basement Dweller", description: "Enjoy the fluorescent lighting!", city: "Denver", price: 1.00, photo: File.new(Rails.root + "app/assets/images/basement_dweller.jpg"))

Escape.create(name: "The Old Folks Home", description: "Why not visit grandpa?", city: "Tampa Bay", price: 599.99, photo: File.new(Rails.root + "app/assets/images/grandpa.jpg"), active: false)

Escape.create(name: "A week in Hospital", description: "Comfortable bed and three meals a day", city: "Miami", price: 1099.99, photo: File.new(Rails.root + "app/assets/images/hospital.jpg"))

Escape.create(name: "Spend Intermission in a Movie Theater", description: "Get one ticket and stay in a movie theater for the whole week", city: "St. Louis", price: 12.99, photo: File.new(Rails.root + "app/assets/images/theater.jpg"))

Category.create(title: "Outdoors")
Category.create(title: "Indoors")

EscapeCategory.create(category_id: 1, escape_id: 1)
EscapeCategory.create(category_id: 2, escape_id: 2)
EscapeCategory.create(category_id: 2, escape_id: 3)
EscapeCategory.create(category_id: 2, escape_id: 4)
EscapeCategory.create(category_id: 2, escape_id: 5)

User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1, full_name: "Admin Smith", address: "321 Broadway Ave, Denver CO 90210", image: "iadmin.jpg")
User.create(username: "booradley", password: "pass", password_confirmation: "pass", full_name: "Booseph Radley III", address: "111 Mockingbird Lane, Phoenix AZ 90000")

User.last.orders.create(status: "paid", total: 200.00)
User.last.orders.create(status: "completed", total: 225.98)

User.last.orders.first.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)
User.last.orders.last.order_escapes.create(escape_id: Escape.last.id, quantity: 2, total: 25.98)
User.last.orders.last.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)

puts "Seeds Updated! Nice work team..."

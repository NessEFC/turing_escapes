Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", city: "Denver", price: 200.00, photo_file_name: "gentle_dawn.jpg")

Escape.create(name: "Basement Dweller", description: "Enjoy the fluorescent lighting!", city: "Denver", price: 1.00, photo_file_name: "basement_dweller.jpg")

Escape.create(name: "The Old Folks Home", description: "Why not visit grandpa?", city: "Tampa Bay", price: 599.99, photo_file_name: "grandpa.jpg", active: false)

Category.create(title: "Outdoors")
Category.create(title: "Indoors")

EscapeCategory.create(category_id: 1, escape_id: 1)
EscapeCategory.create(category_id: 2, escape_id: 2)
EscapeCategory.create(category_id: 2, escape_id: 3)

User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1, full_name: "Admin Smith", address: "321 Broadway Ave, Denver CO 90210")
User.create(username: "booradley", password: "pass", password_confirmation: "pass", full_name: "Booseph Radley III", address: "111 Mockingbird Lane, Phoenix AZ 90000")

User.last.orders.create(status: "paid", total: 200.00)
User.last.orders.create(status: "completed", total: 1399.98)

User.last.orders.first.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)
User.last.orders.last.order_escapes.create(escape_id: Escape.last.id, quantity: 2, total: 1199.98)
User.last.orders.last.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)

puts "Seeds Updated! Nice work team..."

Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", city: "Denver", price: 200.00, image: "gentle_dawn.jpg")

Escape.create(name: "Basement Dweller", description: "Enjoy the fluorescent lighting!", city: "Denver", price: 1.00, image: "basement_dweller.jpg")

Category.create(title: "Outdoors")
Category.create(title: "Indoors")

EscapeCategory.create(category_id: 1, escape_id: 1)
EscapeCategory.create(category_id: 2, escape_id: 2)

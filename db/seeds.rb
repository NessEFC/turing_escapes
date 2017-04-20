Escape.create(name: "Gentle Dawn", description: "Enjoy the gentlest of dawns on this sunrise adventure in the mountains. A picnic breakfast is included after a 45 minutes yoga routine.", city: "Denver", price: 200.00, photo: File.new(Rails.root + "app/assets/images/gentle_dawn.jpg"))

Escape.create(name: "Basement Dweller", description: "Can't get enough of the Turing basement? Enjoy the fluorescent lighting for another week! Free Coffee; food not included.", city: "Denver", price: 1.00, photo: File.new(Rails.root + "app/assets/images/basement_dweller.jpg"))

Escape.create(name: "The Old Folks Home", description: "Grandpa isn't getting any younger, so why not visit during intermission week? Stay includes unlimited board games and jello.", city: "Tampa Bay", price: 599.99, photo: File.new(Rails.root + "app/assets/images/grandpa.jpg"), active: false)

Escape.create(name: "Hospital Stay", description: "Comfortable bed, three meals a day and a pair of pajamas. Roommate may be inlcuded. ", city: "Miami", price: 1099.99, photo: File.new(Rails.root + "app/assets/images/hospital.jpg"))

Escape.create(name: "Movie Theater", description: "Get one ticket and stay in a movie theater for the whole week. Watch unlimted movies for seven days straight. Concessions not inluded.", city: "St. Louis", price: 12.99, photo: File.new(Rails.root + "app/assets/images/theater.jpg"))

Escape.create(name: "Tropical Getaway", description: "Spend 5 days/4 nights on the beautiful beaches of Tulum drinking margaritas! All-inclusive means unlimted food and drinks!", city: "Tulum", price: 999.99, photo: File.new(Rails.root + "app/assets/images/beach.jpg"))

Escape.create(name: "Sky Diving", description: "Live life on the edge by jumping out of a plane with nothing but a parachute stopping you from plummeting to your death. Soft landing not guaranteed.", city: "Phoenix", price: 100.98, photo: File.new(Rails.root + "app/assets/images/skydive.jpg"))

Escape.create(name: "Disney World", description: "Re-live your childhood while visiting Mickey and Minnie. Long lines, obnoxious children and space mountain included.", city: "Orlando", price: 600.00, photo: File.new(Rails.root + "app/assets/images/disney.jpg"))

Escape.create(name: "Rock Climbing", description: "Hang on to some rocks and hope you don't fall. May induce scrapes and bruises.", city: "Denver", price: 60.00, photo: File.new(Rails.root + "app/assets/images/rock.jpg"))

Escape.create(name: "Canada eh?", description: "Want a week with really nice people? Spend 7 days in our neighbor to the north getting free healthcare and smiles everywhere you go.", city: "Winnipeg", price: 800.00, photo: File.new(Rails.root + "app/assets/images/canada.png"))

Escape.create(name: "The Upside Down", description: "Come spend a week looking for Barb.", city: "Hawkins", price: 200.00, photo: File.new(Rails.root + "app/assets/images/strange.jpg"))


Category.create(title: "Outdoors")
Category.create(title: "Indoors")
Category.create(title: "Family")
Category.create(title: "Individual")
Category.create(title: "Adventure")
Category.create(title: "Relaxing")

EscapeCategory.create(category_id: 1, escape_id: 1)
EscapeCategory.create(category_id: 4, escape_id: 1)
EscapeCategory.create(category_id: 6, escape_id: 1)

EscapeCategory.create(category_id: 2, escape_id: 2)

EscapeCategory.create(category_id: 2, escape_id: 3)
EscapeCategory.create(category_id: 3, escape_id: 3)

EscapeCategory.create(category_id: 2, escape_id: 4)

EscapeCategory.create(category_id: 2, escape_id: 5)

EscapeCategory.create(category_id: 1, escape_id: 6)
EscapeCategory.create(category_id: 6, escape_id: 6)

EscapeCategory.create(category_id: 5, escape_id: 7)
EscapeCategory.create(category_id: 4, escape_id: 7)

EscapeCategory.create(category_id: 3, escape_id: 8)

EscapeCategory.create(category_id: 1, escape_id: 9)
EscapeCategory.create(category_id: 5, escape_id: 9)

EscapeCategory.create(category_id: 1, escape_id: 10)

EscapeCategory.create(category_id: 1, escape_id: 11)
EscapeCategory.create(category_id: 5, escape_id: 11)



User.create(username: "iadmin", password: "ipass", password_confirmation: "ipass", role: 1, full_name: "Admin Smith", address: "321 Broadway Ave, Denver CO 90210", image: "iadmin.jpg")
User.create(username: "booradley", password: "pass", password_confirmation: "pass", full_name: "Booseph Radley III", address: "111 Mockingbird Lane, Phoenix AZ 90000")
User.create(username: "turing", password: "pass1", password_confirmation: "pass1", full_name: "Turing School", address: "1331 17th Street, Denver, CO 80202")

User.find(2).orders.create(status: "paid", total: 200.00)
User.find(2).orders.create(status: "completed", total: 600.00)
User.last.orders.create(total: 999.99)
User.last.orders.create(status: "paid", total: 1800.00)

User.find(2).orders.first.order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)
User.find(2).orders.find(2).order_escapes.create(escape_id: Escape.last.id, quantity: 2, total: 400.00)
User.find(2).orders.find(2).order_escapes.create(escape_id: Escape.first.id, quantity: 1, total: 200.00)

User.last.orders.find(3).order_escapes.create(escape_id: 6, quantity: 1, total: 999.99)
User.last.orders.last.order_escapes.create(escape_id: 11, quantity: 1, total: 200.00)
User.last.orders.last.order_escapes.create(escape_id: 10, quantity: 2, total: 1600.00)


puts "Seeds Updated! Nice work team..."

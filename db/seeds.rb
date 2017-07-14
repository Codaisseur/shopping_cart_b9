# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!([
  { name: "Laptop", price: 800, stock: 4 },
  { name: "Backpack", price: 90, stock: 3 },
  { name: "Keyboard", price: 106, stock: 2 },
  { name: "Headphones", price: 180, stock: 5 }
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create(title: "mr.", name: "steve", password: "111111", phone: "0923111111", email: "example@gmail.com", role: "admin", favorite_store: [1, 2])
#   Character.create(name: 'Luke', movie: movies.first)

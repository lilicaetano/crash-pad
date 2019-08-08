# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts 'start seeding'

counter = 0

10.times do
  newUser = User.create!(name: Faker::Name.name, email: "user#{counter}@bob.com", password: 'secret')
  Flat.create!(name: Faker::Name.name_with_middle + ' house', address: Faker::Address.full_address, user: newUser, description: 'potatofaceboy', price: rand(50...350))
  counter += 1
end

puts 'finished'

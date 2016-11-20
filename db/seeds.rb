# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Venue.destroy_all
Event.destroy_all

10.times do
  Venue.create(address: Faker::University.name, venue_name: Faker::University.name, city: Faker::University.name, state: Faker::University.name, zipcode: Faker::University.name)
end

10.times do
  Event.create(artist: Faker::Name.name, date: Faker::Date.forward(23), price: Faker::Number.between(from = 40.00, to = 100.00), url: Faker::Hipster.sentence(1), venue_id: Faker::Number.between(1,10))
end

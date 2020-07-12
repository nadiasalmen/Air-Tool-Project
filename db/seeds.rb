# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "clearing database..."
Reservation.destroy_all
Tool.destroy_all
User.destroy_all

puts "creating new users"

10.times do
  user = User.new(
    email = Faker::Internet.email,
    encrypted_password = Faker::Internet.password(min_length: 8),
    name = Faker::Name.name,
    location = Faker::Address.street_address
  )
  user.save!
end

puts "creating new tools"

10.times do
  tool = Tool.new(
    name = Faker::Construction.heavy_equipment,
    category = Faker::Construction.subcontract_category,
    status = Faker::Boolean.boolean,
    price = Faker::Number.number(digits: 3),
    rating = Faker::Number.between(from: 1, to: 5)
  )
  tool.save!
end

puts "creating new reservation"

10.times do
  reservation = Reservation.new(
    status = Faker::Boolean.boolean,
    start_date = Faker::Date.foward(days: 20),
    end_start = Faker::Date.foward(days: 10)
  )
  reservation.save!
end

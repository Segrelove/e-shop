require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Reservation.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('reservations')
Property.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('properties')

10.times do 
  p = Property.new(title: Faker::Address.street_address, 
  price: rand(600..5000), 
  surface: rand(10..120), 
  description: Faker::Address.full_address,
  image_url: 'https://edito.seloger.com/sites/default/files/styles/manual_crop_640x412/public/guide/images/check-list-lumiosite-appartement.jpg?itok=C6yrQhs4',
  agent_id: rand(1..5))
  p.save
  puts "Property n° #{p.id} created"
end

30.times do 
  u = User.new(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  is_admin: false,
  email: Faker::Internet.email,
  password: "TEST123")
  u.save
end

10.times do 
  r = Reservation.new(status: "Pending", property_id: rand(1..10), tenant_id: rand(1..30))
  r.save
  puts "Reservation n° #{r.id} created"
end


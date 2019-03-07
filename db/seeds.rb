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
Cart.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
Image.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('images')
Property.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('properties')
Reservation.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('reservations')

20.times do
  u = User.new(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  is_admin: false,
  email: Faker::Internet.email,
  password: "TEST123")
  u.save
end

# personae pour tests mailing
a = User.create!(first_name: "Monsieur l'agent",
last_name: "Immobilier",
is_admin: false,
email: "agentdingdong@yopmail.com",
password: "TEST123")


10.times do
  p = Property.new(title: Faker::Address.street_address,
  price: rand(600..5000),
  surface: rand(10..120),
  description: Faker::Address.full_address,
  agent: a)
  i = Image.new(property_id: p.id, description: 'Super appart', url: 'https://s-ec.bstatic.com/images/hotel/max1024x768/716/71622578.jpg')
  i.save
  p.save
  puts "Property n° #{p.id} created"
end

# personae pour tests mailing

t = User.create!(first_name: "Monsieur le locataire",
last_name: "Immobilier",
is_admin: false,
email: "tenantdingdong@yopmail.com",
password: "TEST123")
p=Property.create!(title: Faker::Address.street_address,
price: rand(600..5000),
surface: rand(10..120),
description: Faker::Address.full_address,
agent: a)
o=Order.create!(tenant:t)
j=JoinTableOrderProperty.create!(order: o, property: p)

# 5.times do
#   c = Cart.new(status: "Pending")
#   c.save
# end

# 5.times do
#   r = Reservation.new(property_id: rand(1..10), tenant_id: rand(1..5), cart_id: rand(1..2))
#   r.save
#   puts "Reservation n° #{r.id} created"
# end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Booking.destroy_all
Pool.destroy_all
User.destroy_all

# Create 100 Users
100.times do
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  })
  user.save
end

# Create 3 pools
  owner1 = User.all.sample(1).first
  pool1 = Pool.new
  pool1.title = "Nice pool"
  pool1.content = "This is an awesome pool"
  pool1.address = "4 villa Belliard, Paris"
  pool1.price = rand(1..50)
  pool1.capacity = rand(1..20)
  pool1.availability = true
  pool1.user = owner1
  pool1.save

  owner2 = User.all.sample(1).first
  pool2 = Pool.new
  pool2.title = "Great pool by the lake"
  pool2.content = "This is an awesome pool"
  pool2.address = "47 boulevard Richard Lenoir, Paris"
  pool2.price = rand(1..50)
  pool2.capacity = rand(1..20)
  pool2.availability = true
  pool2.user = owner2
  pool2.save

  owner3 = User.all.sample(1).first
  pool3 = Pool.new
  pool3.title = "Awesome Poooool"
  pool3.content = "This is an awesome pool"
  pool3.address = "25 rue du petit musc, Paris"
  pool3.price = rand(1..50)
  pool3.capacity = rand(1..20)
  pool3.availability = true
  pool3.user = owner3
  pool3.save


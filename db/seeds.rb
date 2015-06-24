# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Pool.destroy_all
Booking.destroy_all

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

# Create 45 pools
cities = %w(Cannes Nice Palavas Valence Avignon Santa-Barbara Miami Monaco Yakutsk)
cities.each do |town|
  owners = User.all.sample(5)
  owners.each  do |owner|
    pool = Pool.new
    pool.title = "Another lovelely seeded pool"
    pool.content = "This is an awesome pool"
    pool.address = Faker::Address.street_address
    pool.city = town
    pool.price = rand(1..50)
    pool.capacity = rand(1..20)
    pool.availability = true
    pool.user = owner
    pool.save
  end
end

# Create 20 bookings
  # Sample 20 pools
  # 8 first confirmed
  # 9 next pending
  # 3 last refused
booked_pools = Pool.all.sample(20)

booked_pools[0..7].each do |pool|
  booking = Booking.new
  booking.user = User.all.sample(1).first
  booking.pool = pool
  booking.checkin_on = Faker::Date.forward(60)
  booking.length = ['Morning', 'Afternoon', 'All Day', 'All night long'][rand(0..3)]
  booking.status = "Confirmed"
  booking.save
end

booked_pools[8..16].each do |pool|
  booking = Booking.new
  booking.user = User.all.sample(1).first
  booking.pool = pool
  booking.checkin_on = Faker::Date.forward(60)
  booking.length = ['Morning', 'Afternoon', 'All Day', 'All night long'][rand(0..3)]
  booking.status = "Pending"
  booking.save
end

booked_pools[17..19].each do |pool|
  booking = Booking.new
  booking.user = User.all.sample(1).first
  booking.pool = pool
  booking.checkin_on = Faker::Date.forward(60)
  booking.length = ['Morning', 'Afternoon', 'All Day', 'All night long'][rand(0..3)]
  booking.status = "Refused"
  booking.save
end

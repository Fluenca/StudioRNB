# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying old studios"
Studio.destroy_all


puts "Creating studios"
30.times do
  studio = Studio.new(
    name: Faker::Name.name,
    size: Faker::Number.decimal_part(digits: 2),
    equipment: Faker::Appliance.equipment,
    address: Faker::Nation.capital_city,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    price: Faker::Number.decimal(l_digits: 2)
  )
  studio.user = User.last
  studio.save!
end

puts "Creating reservations"
30.times do
  reservation = Reservation.new(
    start_on: Faker::Date.in_date_period,
    end_on: Faker::Date.in_date_period,
    approved: true
  )
  reservation.studio = Studio.last
  reservation.user = User.last
  reservation.save!
end

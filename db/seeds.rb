# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Batman", email: "batman@email.com",
            password:"foobar", password_confirmation: "foobar")

30.times do
  Person.create(first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                user_id: 1)
end

30.times do |n|
  PhoneNumber.create(number: Faker::Number.number(10),
                     person_id: n )
end

30.times do |n|
  PhoneNumber.create(number: Faker::Number.number(10),
                     person_id: n )
  n += 1
end

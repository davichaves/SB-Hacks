# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  FIRST_LETTER = 'a'
  END_LETTER = 'z'

#Users

11.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@dcmm.org"
  password = "password"
  points = rand(500) + 1
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password,
              points: points
            )
end

#Signs


(FIRST_LETTER .. END_LETTER).each do |i|
  		Sign.create(symbol: i, image: "letter-#{i}.jpg")
  	end
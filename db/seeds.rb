User.create!(name:  "Khan Saab",
             email: "khansaab@restaurants.com",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.first_name
  email = "restaurant-#{n+1}@restaurants.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

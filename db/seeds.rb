User.create!(name:  "Ashwin Patel",
             email: "ashwin@mailer.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@restaurants.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

Restaurant.create!(name:  "Khan Saab",
             location: "Gachibowly")

Restaurant.create!(name:  "The Lal Streets",
             location: "Kondapur")

users = User.order(:created_at).take(6)
restaurants = Restaurant.order(:created_at).take(6)
1.times do
  rating = 3
  review = Faker::Lorem.sentence(word_count: 30)
  users.each { |user| restaurants.each{|restaurant| RatingNReview.create!(user_id: user.id, rating: rating, review: review, restaurant_id: restaurant.id) }}
end

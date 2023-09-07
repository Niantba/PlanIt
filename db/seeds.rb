# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Expense.destroy_all
Document.destroy_all
Comment.destroy_all
User.destroy_all
Trip.destroy_all
Activity.destroy_all

marcela = User.new(first_name: "Marcela", last_name: "Langarica", email: "marcela@email.com", password: "123456")
marcela.save!
grace = User.new(first_name: "Grace", last_name: "Pan", email: "grace@email.com", password: "123456")
grace.save!
sergio = User.new(first_name: "Sergio", last_name: "Santana", email: "sergio@email.com", password: "123456")
sergio.save!
audrey = User.new(first_name: "Audrey", last_name: "Baniant", email: "audrey@email.com", password: "123456")
audrey.save!
fred = User.new(first_name: "Fred", last_name: "Charest", email: "freddy@email.com", password: "123456")
fred.save!

file = URI.open("https://avatars.githubusercontent.com/u/138630319?v=4")
marcela.image.attach(io: file, filename: "profile_picture", content_type: "image/png")

file = URI.open("https://avatars.githubusercontent.com/u/138805405?v=4")
grace.image.attach(io: file, filename: "profile_picture", content_type: "image/png")

file = URI.open("https://avatars.githubusercontent.com/u/119386023?v=4")
sergio.image.attach(io: file, filename: "profile_picture", content_type: "image/png")

file = URI.open("https://avatars.githubusercontent.com/u/57893221?v=4")
audrey.image.attach(io: file, filename: "profile_picture", content_type: "image/png")

file = URI.open("https://ca.slack-edge.com/T02NE0241-UF9AUHN5V-80e5be1350a1-1920")
fred.image.attach(io: file, filename: "profile_picture", content_type: "image/png")

trip1 = Trip.create(
  start_date: Date.new(2023, 9, 15),
  end_date: Date.new(2023, 9, 18),
  destination: "Tokyo"
)
activity1 = Activity.create(
  name: "Tokyo Skytree",
  trip: trip1,
  location: "1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan",
  start_date: "2023-09-15"
)
activity2 = Activity.create(
  name: "Yoyogi Park",
  trip: trip1,
  location: "2-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-0052, Japan",
  start_date: "2023-09-16"
)
activity3 = Activity.create(
  name: "Ghibli Museum",
  trip: trip1,
  location: "1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013, Japan",
  start_date: "2023-09-17"
)
activity4 = Activity.create(
  name: "Akihabara Electric Town",
  trip: trip1,
  location: "Akihabara",
  start_date: "2023-09-18"
)
activity5 = Activity.create(
  name: "Kozue",
  trip: trip1,
  location: "Park Hyatt Tokyo, 40階, 3-chōme-7-1-2 Nishishinjuku, Shinjuku City, Tokyo 160-0023, Japan",
  start_date: "2023-09-15"
)
activity6 = Activity.create(
  name: "Bar Benfiddich",
  trip: trip1,
  location: "Japan, 〒160-0023 Tōkyō-to, Shinjuku-ku, Nishishinjuku, 1 Chome 13, 西新宿1ｰ13ｰ7",
  start_date: "2023-09-16"
)
activity7 = Activity.create(
  name: "Tamawarai",
  trip: trip1,
  location: "神宮前5-23-3, Tokyo, Tōkyō 150-0001, Japan",
  start_date: "2023-09-17"
)
activity8 = Activity.create(
  name: "Onigiri Manma",
  trip: trip1,
  location: "Japan, 〒160-0022 Tokyo, Shinjuku City, Shinjuku, 3-chōme 14 231F",
  start_date: "2023-09-18"
)
comment1 = Comment.create(
  user: fred,
  activity: activity1,
  content: "The cafe on the tembo deck is wonderful!"
)

trip2 = Trip.new(
  start_date: Date.new(2023, 10, 3),
  end_date: Date.new(2023, 10, 8),
  destination: "Barcelona"
)
trip2.save!

trip3 = Trip.new(
  start_date: Date.new(2023, 11, 23),
  end_date: Date.new(2023, 11, 25),
  destination: "Paris"
)
trip3.save!

trip4 = Trip.new(
  start_date: Date.new(2023, 12, 10),
  end_date: Date.new(2023, 12, 14),
  destination: "Vancouver"
)
trip4.save!

trip5 = Trip.new(
  destination: "Dubai",
  start_date: Date.new(2023, 9, 15),
  end_date: Date.new(2023, 9, 19)
)
trip5.save!

trip6 = Trip.new(
  destination: "Boston",
  start_date: Date.new(2023, 9, 15),
  end_date: Date.new(2023, 9, 25)
)
trip6.save!

trip7 = Trip.new(
  destination: "Cape Town",
  start_date: Date.new(2023, 11, 23),
  end_date: Date.new(2023, 11, 25)
)
trip7.save!

trip8 = Trip.new(
  destination: "Seoul",
  start_date: Date.new(2023, 12, 13),
  end_date: Date.new(2023, 12, 18)
)
trip8.save!

trip9 = Trip.new(
  destination: "New York City",
  start_date: Date.new(2023, 11, 23),
  end_date: Date.new(2023, 11, 25)
)
trip9.save!

trip10 = Trip.new(
  destination: "Los Angeles",
  start_date: Date.new(2023, 12, 4),
  end_date: Date.new(2023, 12, 8)
)
trip10.save!

# 5.times do
#   trip = Trip.new(
#     start_date: Date.new(2023, 8, 31),
#     end_date: Date.new(2023, 9, 10),
#     destination: Faker::WorldCup.city,
#     private: Faker::Boolean.boolean
#   )
#   trip.save!
#   5.times do
#     activities = Activity.new(
#       name: Faker::WorldCup.city,
#       location: Faker::WorldCup.city,
#       start_date: Faker::Date.between(from: '2023-08-31', to: '2023-09-05'),
#       end_date: Faker::Date.between(from: '2023-09-05', to: '2023-09-10'),
#       category: Faker::Commerce.department,
#       price: rand(150)
#     )
#     activities.trip = trip
#     activities.save!
#   end
# end

puts "Seeds created"

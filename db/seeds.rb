# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Expense.destroy_all
Document.destroy_all
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

trip1 = Trip.new(
  start_date: Date.new(2023, 9, 15),
  end_date: Date.new(2023, 9, 25),
  destination: "Tokyo"
)
trip1.save!
activities = Activity.new(
  name: "Tokyo Tower",
  location: "Chome-2-8 Shibakoen, Minato City, Tokyo 105-0011, Japan",
  start_date: Date.new(2023, 9, 16)
)
activities.trip = trip1
activities.save!

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
  end_date: Date.new(2023, 12, 25),
  destination: "Vancouver"
)
trip4.save!

trip5 = Trip.new(
  destination: "Dubai",
  start_date: Date.new(2023, 9, 15),
  end_date: Date.new(2023, 9, 25)
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
  start_date: Date.new(2023, 12, 10),
  end_date: Date.new(2023, 12, 25)
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
  start_date: Date.new(2023, 12, 10),
  end_date: Date.new(2023, 12, 25)
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

# 5.times do
#   expense = Expense.new(
#     activity
#     amount
#     category
#     paid by
#     paid for
#     )
# expense.save!

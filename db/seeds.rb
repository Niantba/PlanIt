# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

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

5.times do
  trip = Trip.new(
    start_date: Date.new(2023, 8, 31),
    end_date: Date.new(2023, 9, 10),
    destination: Faker::WorldCup.city,
    private: Faker::Boolean.boolean
  )
  trip.save!
  5.times do
    activities = Activity.new(
      name: Faker::WorldCup.city,
      location: Faker::WorldCup.city,
      start_date: Faker::Date.between(from: '2023-08-31', to: '2023-09-05'),
      end_date: Faker::Date.between(from: '2023-09-05', to: '2023-09-10'),
      category: Faker::Commerce.department,
      price: rand(150)
    )
    activities.trip = trip
    activities.save!
  end
end

put "Seeds created"

# 5.times do
#   expense = Expense.new(
#     activity
#     amount
#     category
#     paid by
#     paid for
#     )
# expense.save!

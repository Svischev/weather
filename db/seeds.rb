# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

# create admin

User.create!(
  email: 'admin@mail.ru',
  password: 'admin@mail.ru',
  password_confirmation: 'admin@mail.ru',
  admin: true
)

# create users

(1..3).each do |i|
  email = "user#{i}@mail.ru"

  User.create!(
    email: email,
    password: email,
    password_confirmation: email
    )
end
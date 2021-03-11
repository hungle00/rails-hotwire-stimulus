# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "hungle@email.com", name: "hungle")
User.create!(email: "steve@email.com", name: "steve")
User.create!(email: "bill@email.com", name: "bill")

# Create post
40.times do
  user = Post.create!(title: Faker::Restaurant.name, body: Faker::Restaurant.review, user_id: rand(1...4))
end

# Create todos
Todo.create!(title: "Check email", completed: false)
Todo.create!(title: "Learn Elixir", completed: true)
Todo.create!(title: "Listen Chinese", completed: true)

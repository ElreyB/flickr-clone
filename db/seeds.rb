# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Tag.destroy_all

admin = User.create!(username: "Admin", email: "Admin@admin.com", password: "password", password_confirmation: "password", admin: true )

5.times do
  tags = Tag.create!(name: Faker::Lorem.word)
end

p "Create #{User.count} users"
p "Create #{Tag.count} tags"

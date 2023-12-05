# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'
Vote.destroy_all
AppCategory.destroy_all
Comment.destroy_all
App.destroy_all
Category.destroy_all
Connection.destroy_all
User.destroy_all

User.create!([{
  email: "semih@hotmail.com",
  username: "semih-54",
  password: "123456",
},
{
  email: "pierre@hotmail.com",
  username: "pierre",
  password: "123456",
},
{
  email: "nicho@hotmail.com",
  username: "nicho",
  password: "123456",
}])
p "Created #{User.count} Users"

Connection.create!([
  {
    asker: User.third,
    receiver: User.first,
    confirmed: true
  },
  {
    asker: User.third,
    receiver: User.second,
    confirmed: true
  }
])

Category.create!([
  { name: "Sales Tools" },
  { name: "Marketing" },
  { name: "Commerce" },
  { name: "Video Design" },
  { name: "IT Management" },
  { name: "Security" }
])

p "Created #{Category.count} Categories"

# Open csv and loop through each record
# For each record, create an app

filepath = File.join(__dir__, 'tools.csv')
p filepath

CSV.foreach(filepath, headers: :first_row) do |row|
  p row
  app = App.create!(
    name: row['title'],
    description: row['description'],
    logo_url: row['image']
  )
  category = Category.find_by(name: row['category'])
  AppCategory.create!(app: app, category: category)
end
# for the app created, create an app_category by setting its app_id and category_id

p "Created #{App.count} Apps"


AppCategory.create!([{
  app: App.first,
  category: Category.first
},
{
  app: App.second,
  category: Category.first,
},
{
  app: App.third,
  category: Category.first,
},
{
  app: App.fourth,
  category: Category.second,
}])

p "Created #{AppCategory.count} AppCategories"

Vote.create!(
  user: User.first,
  app: App.first,
  vote: 1
)
Vote.create!(
  user: User.second,
  app: App.first,
  vote: 1
)
Vote.create!(
  user: User.first,
  app: App.second,
  vote: -1
)
Vote.create!(
  user: User.second,
  app: App.second,
  vote: 1
)

p "Created #{Vote.count} Votes"

Comment.create!(
  user: User.first,
  app: App.first,
  comment: "My favourite app for project management. I simply use it every day for both professional and personal apps."
)
Comment.create!(
  user: User.second,
  app: App.first,
  comment: "I recently changed from Notion to Trello, i prefer the UX and the functionalities of Trello."
)
Comment.create!(
  user: User.first,
  app: App.second,
  comment: "Ive been disapointed by Notion, recently changed to Trello, i prefer the UX and the functionalities of Trello."
)
Comment.create!(
  user: User.second,
  app: App.second,
  comment: "Similar to Trello, i actually use both."
)

p "Created #{Comment.count} comments"

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

App.create!([{
  name: "Trello",
  description: "Spreadsheets, emails, and never-ending notifications are major teamwork blockers that affect today’s business teams—no matter their size. Project assignments, tasks, and daily to-do’s get lost, transparency gets trumped, and people lose productivity in the shuffle.  Not only do teams need to manage this constant overflow, but they also need to build projects, track progress, and achieve major business goals. What’s needed is a clear view of the entire process to keep everyone on the same page.

    Introducing Trello: A visual collaboration tool that creates a shared perspective for your team on any project in a fun, flexible, and rewarding way.

    *Trello is for Everyone*
    From sales and marketing to HR and operations, teams can design and customize Trello to fit their unique needs and work styles. And with over 100+ integrations with other key tools like Google Drive, Slack, Jira and more, Trello is a living, breathing project hub of cross-team collaboration no matter where your work needs to happen.

    *Intuitively Simple*
    Go from idea to action in seconds: Trello’s core features are as relatable is organizing sticky notes on a wall. There’s no cumbersome onboarding process to get started, so getting group participation is easy. Log in, join a team and see progress across all the team’s projects right away.

    *Take the Work Out of Work*
    Trello brings joy to teamwork by making it transparent and easily shareable across boards and teams. Users are empowered to make Trello their own (and have fun while doing it!) with features like board backgrounds, emoji reactions, and stickers.

    Trusted by millions, Trello powers teams all around the world. Explore which option is right for you:

    *Free*
    For individuals and teams looking to be more productive.

    *Standard*
    For teams that need to manage more work and scale collaboration.

    *Premium*
    For teams that need to track multiple projects and visualize work in a variety of ways. Best for teams up to 100.

    *Enterprise*
    For companies that need to connect work across teams and enhance org-wide controls, security, and support. Ideal for orgs with 100+ members.",
},
{
  name: "Notion",
  description: "Notion is a connected workspace where your team can create docs, take notes, manage tasks, and organize your work – all in one place. And now, with Notion AI, you can augment your capabilities in new and unexpected ways. Leverage the power of AI right inside Notion, across all your notes and docs, without the need to jump between your work and a separate AI-powered tool.",
},
{
 name: "HubSpot Marketing Hub",
  description: "The job is tough for modern marketers. Either you’re juggling various point solutions, or you’re stuck with tools that are powerful yet impossible to use. This means scattered customer data, lackluster marketing, and too much time spent fussing with software. But it doesn’t have to be that way.

  With Marketing Hub, all your marketing tools and data are on one easy-to-use, powerful platform. You’ll save valuable time and get all the context you need to provide a personalized experience that attracts and converts the right customers at scale. Plus, marketers can keep data at the center of everything they do because Marketing Hub is built as part of the HubSpot CRM platform. When using the full CRM platform, marketers can achieve unparalleled alignment with sales to prove ROI and validate investments.

  Whether it’s strategies, services, or software — HubSpot allows you to scale your company, not complexity. HubSpot has everything you need to grow better.",
},
{
 name: "Insider",
  description: "Insider—a single platform for building individualized, cross-channel experiences—enables enterprise marketers to connect customer data across channels and systems, predict their future behavior with an AI intent engine, and build individualized customer experiences. Marketers use Insider’s platform to deliver consistent and engaging experiences across Web, App, Web Push, Email, SMS, WhatsApp Commerce, and more.

  Having recently unlocked unicorn status, Insider was also congratulated by NASDAQ for becoming one of the only woman-founded, women-led B2B SaaS unicorns in the world. Insider was named a leader in the Gartner Magic Quadrant for Personalization Engines 2023, The Forrester Wave for Cross-Channel Campaign Management 2021, IDC MarketScape WorldWide Omni-Channel Marketing Platforms for B2C Enterprises 2023 Assessment, and IDC MarketScape: Worldwide Customer Data Platforms Focused on Front-Office Users 2021-22 Vendor Assessment. The company has been named the #6 Best Software Company in the world, according to G2’s Spring’23 reports. Insider is also the #1 G2 Leader in 6+ categories, including Customer Data Platforms (CDP), Personalization Engines, Personalization Software, Mobile Marketing, Customer Journey Analytics, and E-commerce Personalization. CrunchBase recently ranked Insider’s co-founder and CEO Hande Cilingir as one of the top women CEOs outside the US.

  One-third of Fortune 500 companies and top brands across retail, automotive, and travel choose Insider to deliver AI-led personalized experiences that exceed customer expectations. Insider is trusted by over 1,200 global businesses, including Singapore Airlines, Estée Lauder, Virgin, Toyota, New Balance, IKEA, GAP, L’Oreal, Samsung, Vodafone, Allianz, Santander, BBVA, Pizza Hut, Newsweek, MediaMarkt, Nissan, AVIS, MAC, Marks & Spencer, Madeira Madeira, Avon, and CNN.",
}])

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

require 'faker'

# Create Users
5.times do
  user = User.new(
    username:     Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Wikis
50.times do
  wiki = Wiki.new(
    user_id:   users.sample.id,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraphs(3).join(" ")
  )
  wiki.save!
end
wikis = Wiki.all

# Create admin user
admin = User.new(
  username:     'Admin User',
  email:        'admin@example.com',
  password:     'helloworld',
  role:         'premium'
)
admin.skip_confirmation!
admin.save!

# Create member user
member = User.new(
  username:     'Member User',
  email:        'member@example.com',
  password:     'helloworld',
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"

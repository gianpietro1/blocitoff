require 'faker'

 # Create Users with lists
10.times do
  user = User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
  list = List.new(title: Faker::Lorem.sentence, user: user)
  list.save!
end
users = User.all
lists = List.all

# Keep a known user for testing purposes
#user = User.first
#user.skip_reconfirmation!
#user.update_attributes!(
#email: 'gianpietro1@gmail.com',
#password: '16111980'
#) 

# Create Items
user = users.sample
50.times do
Item.create!(
name: Faker::Lorem.sentence, user: users.sample, list: user.list)
end


puts "Seed finished"
puts "#{User.count} users created."
puts "#{List.count} lists created." 
puts "#{Item.count} items created." 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  require 'factory_girl_rails'
  Dir[Rails.root.join("spec/support/*_factory.rb")].each {|f| require f}

  puts "Create user user@example.com with password: password"
  user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')

  puts "Add 5 articles that belongs to the user"
  5.times { FactoryGirl.create(:article, user: user) }

  puts "Add 20 articles and users"
  20.times { FactoryGirl.create(:article) }

  puts "Done!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Malcolm Reynolds', username: 'mal', email: 'mal@serenity.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Inara Serra', username: 'inara', email: 'inara@serenity.com', password: 'password', password_confirmation: 'password')
User.create(name: 'River Tam', username: 'river', email: 'river@serenity.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Simon Tam', username: 'simon', email: 'simon@serenity.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Zoe Washburne', username: 'zoe', email: 'zoe@serenity.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Hoban Washburne', username: 'wash', email: 'wash@serenity.com', password: 'password', password_confirmation: 'password').delete
User.create(name: 'Shepherd Book', username: 'book', email: 'book@serenity.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Kaylie Frye', username: 'kaylie', email: 'kaylie@serenity.com', password: 'password', password_confirmation: 'password')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a = Author.create(name: "Briam", bio: "Yes, I am Briam.", password: "password", email: "biprats@gmail.com", admin: true)
a.thoughts.create(text: "New phone who dis?")
a.thoughts.create(text: "Eggplant says I am in control.")
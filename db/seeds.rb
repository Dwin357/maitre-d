user = User.create!(first_name: "Tom Morvolo", last_name: "Riddle", email: "dark.lord@hewhomustnotbenamed.com", username: "iamlordvoldemort", password: "password")
event = Event.create!(name: "Death Eaters Convention", zip_code: "60654", state: "IL", address_line_one: "351 W. Hubbard St.", begins_at: (DateTime.current + 1.month), ends_at: (DateTime.current + 1.month + 3.hours), host: user)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(first_name: "Tom Morvolo", last_name: "Riddle", email: "dark.lord@hewhomustnotbenamed.com", username: "iamlordvoldemort", password: "password")
event = Event.create!(name: "Death Eaters Convention", zip_code: "60654", state: "IL", address_line_one: "351 W. Hubbard St.", begins_at: (DateTime.current + 1.month), ends_at: (DateTime.current + 1.month + 3.hours), host: user)

30.times do
	Guest.create!(first_name: Faker::Name.first_name,
								last_name:  Faker::Name.last_name,
								event: Event.last)
end
User.create!(name: "Jeb", email: "jeb@test.com", password: "foobar", password_confirmation: "foobar", admin: true)
User.create!(name: "bob", email: "bob@test.com", password: "foobar", password_confirmation: "foobar")

18.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@test.com"
	password = "password"
	User.create!(name: name, email: email, password: password, password_confirmation: password)
end
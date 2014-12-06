User.create!(name: "Jeb", email: "jeb@test.com", password: "foobar", password_confirmation: "foobar", admin: true, activated: true, activated_at: Time.zone.now)
User.create!(name: "Bob", email: "bob@test.com", password: "foobar", password_confirmation: "foobar", activated: true, activated_at: Time.zone.now)

18.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@test.com"
	password = "password"
	User.create!(name: name, email: email, password: password, password_confirmation: password , activated: true, activated_at: Time.zone.now)
end
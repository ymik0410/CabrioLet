require "faker"

User.destroy_all

#santa = User.create
juli = User.create(first_name:"Juliana", last_name:"Schlup", email:"jukobe@gmail.com")
#yulia = User.create

100.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
# smart = Car.create(user columm user varible)
end


puts "created #{User.count} users."

# final comment

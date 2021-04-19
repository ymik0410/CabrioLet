require "faker"

User.destroy_all

100.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    encrypted_password: Faker::Compass.half_wind
  )
  user.save
end

User.all

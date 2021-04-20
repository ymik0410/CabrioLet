require "faker"
require 'open-uri'
require 'nokogiri'

puts "cleaning DB"
Car.destroy_all
User.destroy_all

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
    2.times do
      cars = Car.create!(
      title: Faker::TvShows::Friends.character,
      model: Faker::Book.title,
      year: rand(1998..2021),
      city:["Zug", "Zurich", "Paris", "Luzern"].sample,
      price: rand(100..500),
      photo: "https://media.autoexpress.co.uk/image/private/s--l9NxPLCP--/v1586268650/autoexpress/2020/04/Porsche%20911%20Turbo%20S%20Cabriolet.jpg",
      description: Faker::TvShows::FinalSpace.vehicle,
      user: user
    )
    end

end

puts "created #{User.count} users."


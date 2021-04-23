require "faker"
require 'open-uri'
require 'nokogiri'

puts "cleaning DB"
Car.destroy_all
User.destroy_all

1.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )

    Car.create!([{title:'Delivers quality, comfort and excitment', model: 'BMW 2-Series', description: 'Lively driving dynamics, superb powertrains, upscale exterior styling.', year: rand(1998..2021), photo: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-bmw-2-series-mmp-1-1579124677.jpg?crop=0.503xw:0.447xh;0.247xw,0.338xh&resize=768:*', city: "Zug", price: rand(100..400), user: user },
      {title:' Italian style and signature hatchback convertible', model: 'Fiat 500', description: 'This classic compact convertible is perfect for weekend city cruising or daily highway commuting.', year: rand(1998..2021), photo: 'https://images.ctfassets.net/qeontfmijmzv/DEBA2982A02D2B670A4A38EA66B5FF30EF9B95C5/f5923bcc709eedf1a627ff9fdbf67422/05-2018-mini-convertible-cooper_evox.jpg?fm=webp', city:["Zug", "Zurich", "Lausanne", "Luzern", "Geneva", "Bern", "St.Gallen"].sample, price: rand(100..400), user: user },
      {title:'Romantic but furious', model: 'Fiat 124 Spider', description: 'Roadster that was launched in 2017 featuring cozy seating for two, razor-sharp steering', year: 2017, photo: 'https://images.ctfassets.net/qeontfmijmzv/46C5BFA9B9FA181A210D4469D63135FD2C8A96B2/760e2456d5608a620dbd90d7846071e1/09-2018-fiat-124-spider-classica_evox.jpg?fm=webp', city: "Zurich", price: rand(100..400), user: user },
      {title:'Luxury sports car', model: 'BMW Z4', description: 'This two-seat convertible makes for a comfortable daily driver, and it is exhilarating to drive around bends with the top down.', year: rand(1998..2021), photo: 'https://images.ctfassets.net/qeontfmijmzv/008DD2C85BDB8C975172A29A34BD94046282DFAE/5e72205d1fce46e653db898ef3db560e/08-2020-bmw-z4-roadster_evox.jpg?fm=webp', city:"Lausanne", price: rand(100..400), user: user },
      {title:'Perfect for holidays', model: 'Mini Cooper', description: 'The MINI Cooper S is a sporty convertible that is hard to beat.', year: 2019, photo: 'https://i.ytimg.com/vi/Vp4ORa3ckVI/maxresdefault.jpg', city:["Zug", "Zurich", "Lausanne", "Luzern", "Geneva", "Bern", "St.Gallen"].sample, price: rand(100..400), user: user },
      {title:'Down the vintage road', model: 'Volkswagen Bettle', description: 'Refurbished black interior and is powered by a 1,500cc flat-four paired with a four-speed manual transaxle.', year: 1967, photo: 'https://bringatrailer.com/wp-content/uploads/2019/07/1967_volkswagen_beetle_1566249406ebd2b9a60dec12a100_2526.jpg?fit=940%2C675', city: "Luzern", price: rand(100..400), user: user },
      {title:'Off-road 4×4 adventure', model: 'Jeep Wrangler', description: 'While not traditionally the type of vehicle that comes to mind when people think of “convertibles,” the Jeep Wangler absolutely qualifies as one', year: rand(1998..2021), photo: 'https://soajeep.com/wp-content/themes/yootheme/cache/jeep-rental-white-2door_LI-00e429fa.jpeg', city: "Geneva", price: rand(100..400), user: user },
      {title:'You have found the one', model: 'Mazda MX-5 Miata', description: 'The premium tech features, sporty two-seat configuration, and sedan-like comfort', year: rand(1998..2021), photo: 'https://media.ed.edmunds-media.com/mazda/mx-5-miata/2018/oem/2018_mazda_mx-5-miata_convertible_club_fq_oem_3_1600.jpg', city: "Bern", price: rand(100..400), user: user },
      {title:'Sleek and easily identifiable', model: 'Chevrolet Camaro', description: 'Sports car sought after by anyone who craves classic curves and adrenaline-pumping speed.', year: rand(1998..2021), photo: 'https://www.augsburger-allgemeine.de/img/auto/crop51048901/7219561419-cv16_9-w940/IMG-2172.jpg', city: "St.Gallen", price: rand(100..400), user: user },
      {title:'Classic muscle car', model: 'Ford Mustang', description: 'Whether you are cruising to work or want a weekend head turner to haul around friends and family, this car will do the trick.', year: rand(1998..2021), photo: 'https://i.pinimg.com/originals/f2/81/a4/f281a423ea32ce69a5181ab01ab462f5.jpg', city: "Lugano", price: rand(100..400), user: user },
      {title:'Simply the best', model: 'Porsche 718 Boxster', description: "This car's mid-engine design and sport-tuned chassis help it to deliver perfectly balanced driving dynamics", year: 2021, photo: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-porsche-718-cayman-mmp-1-1593003156.jpg?crop=0.833xw:0.703xh;0.0801xw,0.235xh&resize=1200:*', city: "Locarno", price: rand(100..400), user: user },
      {title:'Perfect blend of sport and luxury', model: 'Mercedes-Benz C-Class', description: 'In its standard C300 form, it combines a quiet and comfortable ride with just the right amount of handling acuity', year: rand(1998..2021), photo: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2019-mercedes-benz-c300-cabriolet-1613836951.jpg?crop=0.408xw:0.301xh;0.253xw,0.521xh&resize=980:*', city: "Gossau", price: rand(100..400), user: user },
      {title:'Edgy prformance', model: 'Mercedes-AMG E-Class', description: 'A unique grille and exclusive exterior details', year: rand(1998..2021), photo: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-mercedes-amg-e-53-cabriolet-46-1200x800-1613836632.jpg?crop=0.507xw:0.380xh;0.202xw,0.378xh&resize=980:*', city: "Basel", price: rand(100..400), user: user },
      {title:'Discreetly luxurious ride', model: 'Audi A5', description: 'A punchy turbocharged four-cylinder provides plenty of pep and the chassis is dialed in for solid cornering grip.', year: rand(1998..2021), photo: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-audi-a5-mmp-1-1589229769.jpg?crop=0.740xw:0.555xh;0.121xw,0.223xh&resize=980:*', city: "Zermatt", price: rand(100..400), user: user },
      {title:'Enjoy the sound of my engine', model: 'Porsche 911', description: 'This 911 prides itself on everyday Swiss Army knife user-friendliness and the is ready for all of that, while giving you a suntan.', year: rand(1998..2021), photo: 'https://www.topgear.com/sites/default/files/styles/fit_1960x1102/public/cars-car/carousel/2019/03/s19_1132_fine.jpg?itok=LdMsLTbG', city: "Winterthur", price: rand(100..400), user: user }])

end


puts "created #{User.count} users."


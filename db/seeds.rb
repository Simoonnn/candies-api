10.times do |n|
  Item.create(
          name: Faker::Name.first_name,
          description: Faker::Lorem.sentence(10),
          price: Faker::Number.between(1, 9999)
  )
end

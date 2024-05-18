# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!({
    email: "alimercad@gmail.com",
    password: "123456",
})

# Collect all image files from the db/images directory
image_files = Dir.glob("db/images/*")

# Ensure there are enough images to avoid index errors
if image_files.size < 2
  puts "Not enough images to seed properties."
  exit
end

20.times do |i|
    property = Property.create!({
        name: Faker::Address.community,
        description: Faker::Lorem.paragraph(sentence_count: 3),
        headline: Faker::Address.community,
        adress_1: Faker::Address.street_address,
        adress_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        country: Faker::Address.country,
        price: Money.from_amount((50..100).to_a.sample, 'USD'),
    })

    property.images.attach(io: File.open(image_files[i % image_files.size]), filename: File.basename(image_files[i % image_files.size]))
    property.images.attach(io: File.open(image_files[(i + 1) % image_files.size]), filename: File.basename(image_files[(i + 1) % image_files.size]))

    ((50..100).to_a.sample).times do
      Review.create!({
        content: Faker::Lorem.paragraph(sentence_count: 10),
        cleanliness_rating: (1..5).to_a.sample,
        accuracy_rating: (1..5).to_a.sample,
        checkin_rating: (1..5).to_a.sample,
        communication_rating: (1..5).to_a.sample,
        value_rating: (1..5).to_a.sample,
        location_rating: (1..5).to_a.sample,
        final_rating: (1..5).to_a.sample,
        property: property,
        user: user,
      })
    end
end

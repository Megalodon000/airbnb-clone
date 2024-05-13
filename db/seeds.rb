# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
20.times do
    Property.create!({
        name: Faker::Address.community,
        description: Faker::Lorem.paragraph(sentence_count: 3),
        headline: Faker::Address.community,
        adress_1: Faker::Address.street_address,
        adress_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        country: Faker::Address.country,
    })
end

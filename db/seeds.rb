# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.transaction do
  500.times do |i|
    user= User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    date_of_birth: (Date.today + rand(1...30).days) - rand(24...36).years,
    username: "#{Faker::Name.first_name.downcase}_#{i+10}",
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    zipcode: Faker::Address.postcode,
    street_address: Faker::Address.street_address,
    profile_title:User::PROFILE_TITLE.sample,
    about:"
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
     ",
    contact: Faker::PhoneNumber.phone_number_with_country_code,
    password: "password",
    )
    puts "User #{i + 1} is created successfully"
  end
end
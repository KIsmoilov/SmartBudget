include Devise::Controllers::Helpers
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


first_user = User.new({ name: 'David', email: 'david@gmail.com', password: '1234567', password_confirmation: '1234567' })
second_user = User.new({ name: 'John', email: 'john@gmail.com', password: '1234567', password_confirmation: '1234567' })

# Generate the confirmation token and set the confirmed at timestamp first user
confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
first_user.confirmation_token = confirmation_token[0]
first_user.confirmed_at = Time.now.utc

# Save the user to the database
if first_user.save!
    puts 'First user created successfully...'
end

# Generate the confirmation token and set the confirmed at timestamp first user
confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
second_user.confirmation_token = confirmation_token[0]
second_user.confirmed_at = Time.now.utc

# Save the user to the database
if second_user.save!
    puts 'Second user created successfully...'
end

first_category = Group.create({name: 'Mortgage', icon: 'https://www.smashbros.com/wiiu-3ds/images/character/toon_link/main.png', user_id: 1})
second_category = Group.create({name: 'Sport', icon: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Approve_icon.svg', user_id: 1})

Operation.create([
    {name: 'Rent', amount: 250, user_id: 1, groups: [first_category]},
    {name: 'Maintenance', amount: 75, user_id: 1, groups: [first_category]},
    {name: 'Bag', amount: 150, user_id: 1, groups: [second_category]},
    {name: 'Mask', amount: 55, user_id: 1, groups: [second_category]}
])
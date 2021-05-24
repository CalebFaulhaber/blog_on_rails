# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Post.destroy_all
User.destroy_all
PASSWORD = 'supersecret'

@super_user = User.create(
  name: :caleb,
  :email => 'caleb@faul.com',
  password_digest: BCrypt::Password.create(PASSWORD),
  # is_admin: true
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  User.create(
    name: name,
    email: "#{first_name}@#{last_name}.com",
    password: PASSWORD
  )
end

50.times do
    created_at = Faker::Date.backward(days:365 * 5)

    Post.create(
        title: Faker::TvShows::Community.characters,
        body: Faker::TvShows::Community.quotes,
        created_at: created_at,
        updated_at: created_at
    )

end





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Veterans
def create_veterans
  veterans = []
  rng = Random.new(934857239324211115710)

  10.times do |i|
    veteran = Veteran.create(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      email: "veteran#{i}@gmail.com",
      password: 'password',
      password_confirmation: 'password',
      roles: Array(0..5).sample(rng.rand(6) + 1)
    )
    veterans << veteran
  end

  veterans.each do |veteran|
    rng.rand(5).times do |i|
      friendship = Friendship.new(
        veteran_id: veteran.id,
        friend_id: rng.rand(10) + 1
      )
      unless friendship.veteran_id == friendship.friend_id
        friendship.save
      end
    end
  end

end

create_veterans 

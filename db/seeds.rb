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
  num_roles = Veteran::ROLE_KEYS.count

  # Create 10 Veterans with random names and some random roles
  10.times do |i|
    veteran = Veteran.create(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      email: "veteran#{i}@gmail.com",
      password: 'password',
      password_confirmation: 'password',
      roles: Array(0...num_roles).sample(rng.rand(num_roles) + 1)
    )
    veterans << veteran
  end

  # Create 0-5 friendships for each veteran
  veterans.each do |veteran|
    rng.rand(6).times do |i|
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


# Create Partering Orgs
def create_partering_orgs
  rng = Random.new(934857239324211115710)
  10.times do |i|
    po = PartneringOrganization.create(
      name: FFaker::Company.name,
      email: "po#{i}@gmail.com",
      password: 'password',
      password_confirmation: 'password',
      phone_number: FFaker::PhoneNumber.short_phone_number,
      website: FFaker::Product.product.gsub(/\s+/, "").downcase + '.com',
      address: FFaker::AddressUS.street_address + ', ' +
               FFaker::AddressUS.city + ', ' +
               FFaker::AddressUS.state_abbr + ' ' +
               FFaker::AddressUS.zip_code,
      latitude: FFaker::Geolocation.lat,
      longitude: FFaker::Geolocation.lng,
      role: rng.rand(PartneringOrganization.roles.count),
      demographic: rng.rand(PartneringOrganization.demographics.count),
    )
  end
end


create_veterans
create_partering_orgs

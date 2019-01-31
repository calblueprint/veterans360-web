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
      uid: "veteran#{i}@gmail.com",
      password: 'password',
      password_confirmation: 'password',
      roles: Array(0...num_roles).sample(rng.rand(num_roles) + 1),
      lat: FFaker::Geolocation.lat,
      lng: FFaker::Geolocation.lng,
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

  # Create 5 resources for each veteran
  veterans.each do |veteran|
    Resource.create(
      file_name: FFaker::Product.product_name, 
      description: FFaker::AWS.product_description
    )
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
      lat: FFaker::Geolocation.lat,
      lng: FFaker::Geolocation.lng,
      # role: rng.rand(PartneringOrganization.roles.count),
      # demographic: rng.rand(PartneringOrganization.demographics.count),
    )
  end
end

create_veterans
create_partering_orgs

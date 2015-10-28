require 'ffaker'
# Apartments table (with the follow attributes):
# +    - id
# +    - address
# +    - monthly_rent
# +    - sqft
# +    - num_beds
# +    - num_baths
def make_apartments(num_of_apartments, apartments)
  id = 0
  num_of_apartments.times do
    id += 1
    address = FFaker::AddressUS.street_address
    monthly_rent = (rand(29) + 1) * 100
    sqft = (rand(19) + 5) * 100
    num_beds = rand(4) + 1
    num_baths = rand(4) + 1
    apartments << {id: id, address: address, monthly_rent: monthly_rent, sqft: sqft, num_beds: num_beds, num_baths: num_baths}
  end
end
# Tenants table (with the follow attributes):
# +    - id
# +    - name
# +    - age
# +    - gender
# +    - apartment_id
def make_tenants(tenants, apartments)
  id = 0
  apartments.each do |apt|
    next if rand(100) < 10
    (rand(apt[:num_beds] * 2) + 1).times do
      id += 1
      name = FFaker::Name.name.gsub("'", "")
      age = rand(100) + 1
      gender = ["Male", "Female"].sample
      apartment_id = apt[:id]
      tenants << {id: id, name: name, age: age, gender: gender, apartment_id: apartment_id}
    end
  end
end

apartments = []
tenants = []

make_apartments(20, apartments)
make_tenants(tenants, apartments)

File.open("apartment_seeds.sql","w") do |file|
  file.puts("TRUNCATE TABLE apartments CASCADE;")
  file.puts("TRUNCATE TABLE tenants CASCADE;")
  apartments.each do |a|
    file.puts("INSERT INTO apartments (id, address, monthly_rent, sqft, num_beds, num_baths) VALUES (#{a[:id]}, #{a[:address]}, #{a[:monthly_rent]}, #{a[:sqft]}, #{a[:num_beds]}, #{a[:num_baths]});")
  end
  tenants.each do |t|
    file.puts("INSERT INTO tenants (id, name, age, gender, apartment_id) VALUES (#{t[:id]}, '#{t[:name]}', #{t[:age]}, '#{t[:gender]}', #{t[:apartment_id]});")
  end
end

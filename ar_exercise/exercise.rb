### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end

binding.pry

puts "end of application"

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
tenant1 = Tenant.find_by(id:1)

# get all tenants older than 65
older65 = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
greater2300 = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
Damien_apt = Apartment.where(address: "6005 Damien Corners").take

# get all tenants in that apartment
Damien_apt.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |renter|
puts "#{renter.id} #{renter.name}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |unit|
puts "#{unit.address} #{unit.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_each do |unit|
puts "Address: #{unit.address}"
renter = unit.tenants
renter.find_each do |renter|
puts "    - #{renter.name}"
end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartmentnew1 = Apartment.create(address: "4827 Rossmoor Place", monthly_rent: 500, sqft: 800, num_beds: 2, num_baths: 2)

Apartmentnew2 = Apartment.create(address: "1734 Summit St", monthly_rent: 400, sqft: 400, num_beds: 1, num_baths: 1)

Apartmentnew3 = Apartment.create(address: "3422 Partridge Place", monthly_rent: 600, sqft: 900, num_beds: 1, num_baths: 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
newtenant1 = Tenant.create(name:"Deion Sanders",age:43,gender:"Male",apartment_id:5)
Tenant.create(name:"Jerome Bettis",age:39,gender:"Male",apartment_id:7)
Tenant.create(name:"Serena Williams",age:29,gender:"Female",apartment_id:2)
Tenant.create(name:"Halle Berry",age:49,gender:"Female",apartment_id:8)
Tenant.create(name:"Jerry Rice",age:49,gender:"Male",apartment_id:1)
Tenant.create(name:"Pastor Troy",age:36,gender:"Male",apartment_id:2)
Tenant.create(name:"Marshawn Lynch",age:30,gender:"Male",apartment_id:5)
Tenant.create(name:"Steve Smith",age:39,gender:"Male",apartment_id:9)
Tenant.create(name:"Angela Bassett",age:55,gender:"Female",apartment_id:4)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
findKristin = Tenant.find_by(name:"Kristin Wisoky")
findKristin.update(age:24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Verna=Apartment.find_by(address:"62897 Verna Walk")
Verna.update(num_beds:3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Verna.update(monthly_rent:2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
goodbye30 = Tenant.where("age < 30")
goodbye30.destroy_all

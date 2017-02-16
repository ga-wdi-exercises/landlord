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
first_tenant = Tenant.find(1)
# get all tenants older than 65
tenant_over_65 = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
apartments_over_2300 = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damien_corners_apt = Apartment.where("address = '6005 Damien Corners'")
# get all tenants in that apartment
apt_six_tenants = Tenant.where("apartment_id = 6")

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.each do |renter|
  puts "#{renter.name}: ID # #{renter.apartment_id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.each do |unit|
  puts "#{unit.address}: $#{unit.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.each do |unit|
  puts "#{unit.address}"
  Tenant.each do |renter|
    if renter.apartment_id == unit.id
      puts "#{renter.name}"
    end
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create([{address: "1 Yemen Rd", monthly_rent: 500, sqft: 1000, num_beds: 2, num_baths: 1},
  {address: "10 Qatar Rd", monthly_rent: 600, sqft: 1200, num_beds: 2, num_baths: 2},
  {address: "15 Emirates Rd", monthly_rent: 3500, sqft: 600, num_beds: 1, num_baths: 1}])
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Apartment.all[0].tenants.create([
  {name: 'Tom', age: 46, gender: "m"},
  {name: 'Dick', age: 41, gender: "m"},
  {name: 'Harry', age: 48, gender: "m"}
  ])
Apartment.all[1].tenants.create([
  {name: 'Chandler', age: 41, gender: "m"},
  {name: 'Monica', age: 39, gender: "f"}
  ])
Apartment.all[2].tenants.create([
  {name: 'Marshall', age: 40, gender: "m"},
  {name: 'Lily', age: 39, gender: "f"},
  {name: 'Ted', age: 41, gender: "m"},
  {name: 'Tracy', age: 38, gender: "f"}
  ])
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kw_bd = Tenant.where("name = 'Kristin Wisoky'").update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.where("address = '62897 Verna Walk'").update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_rent = Apartment.where("address = '62897 Verna Walk'").update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials_suck = Tenant.where("age < 30").destroy_all

binding.pry

puts "EOF"

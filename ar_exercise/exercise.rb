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
all_apartments = Apartment.all
# get the first tenant in the DB
first_tenant = Tenant.first
# get all tenants older than 65
old_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
high_price = Tenant.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
that_apt = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
residents = that_apt.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "#{tenant[:name]}, #{tenant[:id]}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments.each do |apartment|
  puts "#{apartment[:address], apartment[:monthly_rent]}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apartment|
  puts "#{apartment.address}"
  puts "#{apartments.tenants.map {|tenant| tenant.name}.join(", ")}"
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "657 Irving St", monthly_rent: 3200, sqft: 2000, num_beds: 4, num_baths: 2)
Apartment.create(address: "658 Irving St", monthly_rent: 3100, sqft: 1900, num_beds: 3, num_baths: 2)
Apartment.create(address: "659 Irving St", monthly_rent: 3000, sqft: 1800, num_beds: 3, num_baths: 1)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name:"Sam C" , age: 26, gender:"Male", apartment_id:21)
Tenant.create(name:"Sam A" , age: 27, gender:"Female", apartment_id:22)
Tenant.create(name:"Sam B" , age: 28, gender:"Male", apartment_id:23)
Tenant.create(name:"Sam D" , age: 29, gender: "Female", apartment_id:24)
Tenant.create(name:"Sam E" , age: 30, gender: "Male", apartment_id:25)
Tenant.create(name:"Sam F" , age: 31, gender: "Female", apartment_id:25)
Tenant.create(name:"Sam G" , age: 32, gender: "Male", apartment_id:26)
Tenant.create(name:"Sam H" , age: 33, gender: "Female", apartment_id:27)
Tenant.create(name:"Sam I" , age: 34, gender: "Male", apartment_id:27)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
Kristin = Tenant.find_by(name: "Kristin Wisoky")
Kristin.age += 1
Kristin.save
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
apartment = Apartment.find_by(address: "62897 Verna Walk")
apartment.num_beds += 1
apartment.save
# Make sure to save the results to your database

# Rent Adjustment!
apartment.monthly_rent += 400
apartment.save
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
millenials = Tenant.where("age < 30")
millenials.destroy_all
# Delete their records from the DB

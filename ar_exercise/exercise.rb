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
old_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.where(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_tenants = Tenant.where(apartment_id: Apartment.where(address: "6005 Damien Corners")[0].id)


# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "Id: #{tenant.id}, Name: #{tenant.name}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "Address: #{apartment.address}, Rent: $#{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "#{apartment.address}"
  Tenant.all.each do |tenant|
    if apartment.id == tenant.apartment_id
      puts "    #{tenant.name}"
    end
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Apartment.create(address: "919 Quincy St NW", monthly_rent: 2100, sqft: 2000, num_beds: 3, num_baths: 2)
# Apartment.create(address: "1430 A St SE", monthly_rent: 1275, sqft: 700, num_beds: 1, num_baths: 1)
# Apartment.create(address: "515 9th St NE", monthly_rent: 2100, sqft: 2000, num_beds: 1, num_baths: 1)
# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Tenant.create(name: "Elcid Barrett", age: 61, gender: "Male", apartment_id: 20)
# Tenant.create(name: "Kyle", age: 31, gender: "Male", apartment_id: 22)
# Tenant.create(name: "Becky", age: 30, gender: "Female", apartment_id: 22)
# Tenant.create(name: "Matt Twombly", age: 30, gender: "Male", apartment_id: 20)
# Tenant.create(name: "Paul Davis", age: 32, gender: "Male", apartment_id: 20)
# Tenant.create(name: "David", age: 29, gender: "Male", apartment_id: 20)
# Tenant.create(name: "Brittany", age: 31, gender: "Female", apartment_id: 20)
# Tenant.create(name: "Darren", age: 30, gender: "Male", apartment_id: 21)
# Tenant.create(name: "Andrew", age: 30, gender: "Male", apartment_id: 21)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristen = Tenant.find_by(name: "Kristin Wisoky")
# kristen.update(age: kristen.age + 1)
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
verna = Apartment.find_by(address: "62897 Verna Walk")
# verna.update(num_beds: verna.num_beds + 1)
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# verna.update(monthly_rent: verna.monthly_rent + 400)

# Millenial Eviction!
# Find all tenants who are under 30 years old
millenials = Tenant.where("age < 30")
# Delete their records from the DB
# millenials.destroy

binding.pry
puts "done"

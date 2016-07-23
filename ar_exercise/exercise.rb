### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################
#
#
# ################################################
# # FINDING / SELECTING
# ################################################
#
# # Hint, the following methods will help: `where`, `all`, `find`, `find_by`
#
# # Use Active record to do the following, and store the results **in a variable**
# # example: get every tenant in the DB
# # all_tenants = Tenant.all
#
# # get the first tenant in the DB
tenant_one = Tenant.find(1)
#
# # get all tenants older than 65
older_than_65 = Tenant.where("age  > ?", 65)
#
# # get all apartments whose price is greater than $2300
greater_than_2300 = Apartment.where("monthly_rent  > ?", 2500)
#
# # get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
#
# # get all tenants in that apartment
damien_corners.tenants
#
# # Use `each` and `puts` to:
# # Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "#{tenant.name}: #{tenant.id}"
end

# # Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address} : #{apartment.monthly_rent} "
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "#{apartment.address} : "

  apartment.tenants.each do |tenant|
    puts "#{tenant.name}"
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB

Apartment.create(address: "90210 Beverly Hills", monthly_rent: 3100, sqft: 1000, num_beds: 5, num_baths: 3)
Apartment.create(address: "845 Rotonda Road", monthly_rent: 1700, sqft: 800, num_beds: 2, num_baths: 2)
Apartment.create(address: "76 Matera Street", monthly_rent: 900, sqft: 600, num_beds: 2, num_baths: 2)

# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Brandon", age: 19, gender: "male", apartment_id: 5)
Tenant.create(name: "Jacob", age: 29, gender: "male", apartment_id: 5)
Tenant.create(name: "Kyrie", age: 25, gender: "male", apartment_id: 3)
Tenant.create(name: "Irving", age: 36, gender: "male", apartment_id: 8)
Tenant.create(name: "Jessica", age: 21, gender: "female", apartment_id: 8)
Tenant.create(name: "Emma", age: 26, gender: "female", apartment_id: 8)
Tenant.create(name: "Danny", age: 38, gender: "male", apartment_id: 2)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.age += 1

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

apartment = Apartment.find_by(address: "62897 Verna Walk")
aparment.num_beds += 1

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

apartment.monthly_rent += 400

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

less_than_30 = Tenant.where("age  < ?", 30)

less_than_30.each |tenant|
  tenant.destroy
end


binding.pry

puts "end of application"

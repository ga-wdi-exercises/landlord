### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging


################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
# all_tenants = Tenant.all
#
# # get the first tenant in the DB
# first_tenant = Tenant.first
#
# # get all tenants older than 65
# old_tenants = Tenant.select {|tenant| tenant[:age] > 65}
#
# # get all apartments whose price is greater than $2300
# high_rent = Apartment.select {|apartment| apartment[:monthly_rent] > 2300}
#
#
# # get the apartment with the address "6005 Damien Corners"
# find_apartment = Apartment.select {|apartment| apartment[:address] == "6005 Damien Corners"}
#
# # get all tenants in that apartment
# find_apt = Apartment.select {|apartment| apartment[:address] == "6005 Damien Corners"}
# find_tenants = Tenant.select {|tenant| tenant[:apartment_id] == find_apartment[0][:id]}

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# all_tenants.each do |tenant|
#   puts tenant[:name]
#   puts tenant[:id]
# end
# # Iterate over each apartment, for each apartment, display it's address and rent price
# all_apartments = Apartment.all
# # all_apartments.each do |apartment|
# #   puts  apartment[:address]
# #   puts apartment[:monthly_rent]
# # end
# # Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# all_apartments.each do |apartment|
#   puts apartment[:address]
#   find_people = Tenant.select {|tenant|
#     tenant[:apartment_id] == apartment[:id]
#   }
#   find_people.each do |tenant|
#     puts tenant[:name]
#   end
#   puts "------------------"
# end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
# apartment_one = Apartment.create(id: 97,address: "black" ,monthly_rent: 999,sqft: 1 ,num_beds: 10,num_baths: 10)
# apartment_two = Apartment.create(id: 98,address: "black" ,monthly_rent: 999,sqft: 1 ,num_beds: 10,num_baths: 10)
# apartment_three = Apartment.create(id: 99,address:"black" ,monthly_rent: 999,sqft: 1 ,num_beds: 10,num_baths: 10)
#
# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# # Note: you'll use this little bit of code as a `seeds.rb` file later on.
# tenant_one = Tenant.create(id: 100, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_two = Tenant.create(id: 101, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_three = Tenant.create(id: 102, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_four = Tenant.create(id: 103, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_five = Tenant.create(id: 104, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_six = Tenant.create(id: 105, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_seven = Tenant.create(id: 106, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_eight = Tenant.create(id: 107, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
# tenant_nine = Tenant.create(id: 108, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.select {|tenant| tenant[:name] == "Kristin Wisoky"}
# kristin[0][:age] += 1
# puts kristin[0][:age]

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# find_apt_one = Apartment.select {|apartment| apartment[:address] == "62897 Verna Walk"}
# update_find_apt_one[0][:num_beds] =+ 1
# puts find_apt_one[0][:num_beds]

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# find_apt_one[0][:monthly_rent] += 400
# puts find_apt_one[0][:monthly_rent]

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# young_tenants = Tenant.select {|tenant| tenant[:age] < 30}
# young_tenants.each do |tenant|
#   tenant.destroy
# end

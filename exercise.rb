###  Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection"
require_relative "models/tenant"
require_relative "models/apartment"


################################################
####  DON'T MODIFY ABOVE THIS LINE     ####
################################################

####COMMAND LINE INTERFACE

puts "Hi! Press 1 for apartment data."
puts "Press 2 for tenant data"
puts "Press 3 for a little bit of both"

userInput = gets.chomp.to_i

if userInput == 1
  print Apartment.select([:id, :address, :monthly_rent])
elsif userInput == 2
  print Tenant.select([:name, :age])
elsif userInput == 3

    Apartment.all.each do |apt|
      puts apt.address
      aptID = apt.id
      puts Tenant.where("apartment_id = #{aptID}")
    end

else
  puts "command not recognized, please try again"
end

binding.pry
################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB

# all_tenants = Tenant.all

# get the first tenant in the DB
first_tenant = Tenant.find(1)

# get all tenants older than 65
old_tenant = Tenant.where("age > 65")


# get all apartments whose price is greater than $2300
expensive_apartment = Apartment.where("monthly_rent >2300")

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
#double check that this is working
damien_corners_res = Tenant.find_by(apartment_id:"6")

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

# Tenant.all.each do |tenant|
#   puts "#{tenant.name}, #{tenant.id}"
# end

# Iterate over each apartment, for each apartment, display it's address and rent price

# Apartment.all.each do |apt|
#   puts "#{apt.address}, #{apt.monthly_rent}"
# end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
#Try to double loop instead

  # Apartment.all.each do |apt|
  #   puts apt.address
  #   aptID = apt.id
  #   puts Tenant.where("apartment_id = #{aptID}")
  # end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Apartment.create(address: "123 K Street", monthly_rent: 1200, sqft: 400, num_beds: 2, num_baths: 1)
# Apartment.create(address: "124 K Street", monthly_rent: 2300, sqft: 500, num_beds: 3, num_baths: 2)
# Apartment.create(address: "125 K Street", monthly_rent: 2400, sqft: 600, num_beds: 3, num_baths: 1)
#
# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Tenant.create(name: "Professor Horse", age: 27, gender: "Male", apartment_id: 2)
# Tenant.create(name: "George Bush", age: 90, gender: "Male", apartment_id: 2)
# Tenant.create(name: "Blake Bortles", age: 35, gender: "Male", apartment_id: 2)
# Tenant.create(name: "Clinton", age: 70, gender: "Male", apartment_id: 2)
# Tenant.create(name: "Jerry", age: 28, gender: "Male", apartment_id: 2)
# Tenant.create(name: "Tiffany", age: 29, gender: "Female", apartment_id: 2)
# Tenant.create(name: "Lila", age: 30, gender: "Female", apartment_id: 2)
# Tenant.create(name: "Stephanie", age: 35, gender: "Female", apartment_id: 2)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: 24)
kristin.save
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

vernaWalk = Apartment.find_by(address: "62897 Verna Walk")
vernaWalk.update(num_beds: 3)
vernaWalk.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

vernaWalk.update(monthly_rent: 2800)
vernaWalk.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

milennials = Tenant.where("age < 30")
milennials = milennials.where("age > 18")
milennials.destroy_all

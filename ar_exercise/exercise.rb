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
  # all_tenants = Tenant.all

# get the first tenant in the DB
#   first_tenant = Tenant.first
# # get all tenants older than 65
#   over_65 = Tenant.where("age > 65", :age)
# # get all apartments whose price is greater than $2300
#   over_2300 = Apartment.find_by(monthly_rent: 2300)
# # get the apartment with the address "6005 Damien Corners"
#   damien_corners = Apartment.find_by(address: '6005 Damien Corners')
# # get all tenants in that apartment
#   damien_corners_residents = Apartment.find_by(address: '6005 Damien Corners').tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
  # Tenant.all.each do |tenant|
  #   puts "NAME: #{tenant.name}, ID: #{tenant.id}"
  #   end
# Iterate over each apartment, for each apartment, display it's address and rent price
  # Apartment.all.each do |apartment|
  #   puts "ADDRESS: #{apartment.address}, RENT: #{apartment.monthly_rent}"
  #   end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
  # Apartment.all.each do |apartment|
  #   puts "ADDRESS: #{apartment.address}"
  #   apartment.tenants.each do |tenant|
  #     puts "TENANTS: #{tenant.name}"
  #   end
  # end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

johnson_house = Apartment.create(address: "123 Johnson St", monthly_rent: 2000, sqft: 1000, num_beds: 2, num_baths: 1)
wilson_house = Apartment.create(address: "456 Wilson Ave", monthly_rent: 5000, sqft: 10000, num_beds: 5, num_baths: 4)
franklin_house = Apartment.create(address: "789 Franklin Lane", monthly_rent: 6000, sqft: 8000, num_beds: 4, num_baths: 3)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
#
# johnson_house.tenants.create ([
#   {name: "Olivia Johnson", age: 40, gender: "Female"},
#   {name: "Bob Johnson", age: 45, gender: "Male"}
#   ])
# #
# wilson_house.tenants.create ([
#   {name: "Katherine Wilson", age: 49, gender: "Female"},
#   {name: "Joe Wilson", age: 51, gender: "Male"},
#   {name: "Seth Wilson", age: 21, gender: "Male"},
#   {name: "Grace Wilson", age: 18, gender: "Female"}
#   ])

# franklin_house.tenants.create ([
#   {name: "Lisa Franklin", age: 35, gender: "Female"},
#   {name: "Jeff Franklin", age: 38, gender: "Male"},
#   {name: "Molly Franklin", age: 12, gender: "Female"}
#   ])

#
# # Birthday!
# # It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# # Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.update(age: 24)
# kristin.save
#
# # Rennovation!
# # Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# # Make sure to save the results to your database
# verna_walk = Apartment.find_by(address: "62897 Verna Walk")
# # verna_walk.update(num_beds: 3)
# # verna_walk.save
# #
# # # Rent Adjustment!
# # # Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# # # to reflect the new bedroom
# verna_walk.update(monthly_rent: 2800)
# verna_walk.save
#
#
# # Millenial Eviction!
# # Find all tenants who are under 30 years old
# under_30 = Tenant.where("age < 30", :age)
# #
# # # Delete their records from the DB
# under_30.destroy_all

binding.pry
puts "end of file"

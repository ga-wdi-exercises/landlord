### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

# ok, check check ^^


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

firstkid = Tenant.first

# get all tenants older than 65

oldheads = Tenant.where("age > ?", 65)

# get all apartments whose price is greater than $2300

luxury_apts = Apartment.where("monthly_rent > ?", 2300)

# get the apartment with the address "6005 Damien Corners"

damien_corner= Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment

damien_tenants = Tenant.where(apartment_id: 6)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

# name_id = Tenant.all.each do |tenant|
#   puts tenant.name
#   puts tenant.
# end
#
#
# # Iterate over each apartment, for each apartment, display it's address and rent price
#
# address_rentprice = Apartment.all.each do |apartment|
#   puts apartment.address
#   puts apartment.monthly_rent
# end
#
# # Iterate over each apartment, for each apartment, display it's address and all of it's tenants
#
# apartment_tenants = Apartment.all.each |apartment|
#   puts apartment.address
#   puts apartment.tenants
# end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`



# Create 3 new apartments, and save them to the DB

santa_place = Apartment.create(address: "12345 North Pole", monthly_rent: 1000, sqft: 10000, num_beds: 50, num_baths: 25)
coolcat_place = Apartment.create(address: "54321 Feline Paradise", monthly_rent: 500, sqft: 700, num_beds: 1, num_baths: 1)
willow_place = Apartment.create(address: "87654 Whipper Snapper", monthly_rent: 1200, sqft: 1000, num_beds: 1, num_baths: 1)



# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

santa = Tenant.create(name: "santa", age: 65, gender: "male", apartment_id: 28)
coolcat = Tenant.create(name: "coolcat", age: 28, gender: "female", apartment_id: 29)
willow = Tenant.create(name: "Willow", age: 14, gender: "female", apartment_id: 30)
sam = Tenant.create(name: "Sam", age: 37, gender: "male", apartment_id: 5)
lamb = Tenant.create(name: "Lambchop", age: 40, gender: "female", apartment_id: 7)
ram = Tenant.create(name: "Ram", age: 36, gender: "female", apartment_id: 7)
pam = Tenant.create(name: "Pilar", age: 26, gender: "female", apartment_id: 2)
ham = Tenant.create(name: "Ham-ham", age: 55, gender: "male", apartment_id: 3)
cam = Tenant.create(name: "Camron", age: 32, gender: "male", apartment_id: 1)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin = Tenant.all.find_by(name: "Kristin Wisoky")
kristin.update(age: 24)


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_beds: 3)
verna_walk.save
#************I've been saving all of my results.  I hope that's okay :-/*************

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

verna_walk.update(monthly_rent: 2800)


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

youngyens = Tenant.where("age < ?", 30)
youngyens.destroy_all
 # :'( my babies are gone.


binding.pry

puts "do stuff"

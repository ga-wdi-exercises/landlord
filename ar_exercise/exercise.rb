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

# # Use Active record to do the following, and store the results **in a variable**
# # example: get every tenant in the DB
# all_tenants = Tenant.all
#
# # get the first tenant in the DB
# first_tenant = Tenant.first
#
# # get all tenants older than 65
# older_tenants = Tenant.where("age > ?", 65)
#
# # get all apartments whose price is greater than $2300
# expensive_apartments = Apartment.where("monthly_rent > ?", 2300)
#
# # get the apartment with the address "6005 Damien Corners"
# damien_apartment = Apartment.find_by(address: "6005 Damien Corners")
#
# # get all tenants in that apartment
# damien_tenants = damien_apartment.tenants
#
# # Use `each` and `puts` to:
# # Display the name and ID # of every tenant
# # all_tenants.each {|tenant| puts tenant.id.to_s + ' ' + tenant.name}
#
# # Iterate over each apartment, for each apartment, display its address and rent price
# all_apartments = Apartment.all
# # all_apartments.each {|apartment| puts apartment.address + ' - ' + apartment.monthly_rent.to_s}
#
# # Iterate over each apartment, for each apartment, display its address and all of it's tenants
# all_apartments.each do |apartment|
#   puts apartment.address
#   apartment.tenants.each{|tenant| puts "  #{tenant.name}   Age: #{tenant.age}   Gender: #{tenant.gender}"}
# end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# apt1 = Apartment.new(address: "123 Lollipop Lane", monthly_rent: 3000, sqft: 800, num_beds: 2, num_baths: 2)
# apt1.save
# apt2 = Apartment.new(address: "4900 Elm Street", monthly_rent: 2100, sqft: 400, num_beds: 1, num_baths: 1)
# apt2.save
# apt3 = Apartment.new(address: "5 Backwoods Place", monthly_rent: 2000, sqft: 5000, num_beds: 22, num_baths: 4)
# apt3.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# tenant1 = Tenant.create(name: "Pookins Magoo", age: 45, gender: "Female", apartment_id: 2)
# tenant2 = Tenant.create(name: "Carrot", age: 2, gender: "Female", apartment_id: 25)
# tenant3 = Tenant.create(name: "Roderick Lakowski III", age: 67, gender: "Male", apartment_id: 22)
# tenant4 = Tenant.create(name: "Taco Truck", age: 91, gender: "Female", apartment_id: 21)
# tenant5 = Tenant.create(name: "Derek Langton", age: 22, gender: "Male", apartment_id: 23)
# tenant6 = Tenant.create(name: "Falcon Spoonies", age: 58, gender: "Female", apartment_id: 25)
# tenant7 = Tenant.create(name: "Bart Ulie", age: 12, gender: "Male", apartment_id: 20)
# tenant8 = Tenant.create(name: "Panko Crumm", age: 27, gender: "Female", apartment_id: 5)
# tenant9 = Tenant.create(name: "Bleep Bloop", age: 150, gender: "Bleep bloop", apartment_id: 8)
# tenant10 = Tenant.create(name: "Pinon Errata", age: 74, gender: "Female", apartment_id: 11)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# puts kristin.name, kristin.age
# kristin.age = kristin.age + 1
# puts kristin.name, kristin.age

# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# apt = Apartment.find_by(address: "62897 Verna Walk")
# apt.num_beds = apt.num_beds + 1

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# apt.monthly_rent = apt.monthly_rent + 400

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# puts Tenant.all.length
# youngun_tenants = Tenant.where("age < ?", 30)
# youngun_tenants.each {|youngun| youngun.destroy; puts "noooo"}
# puts Tenant.all.length

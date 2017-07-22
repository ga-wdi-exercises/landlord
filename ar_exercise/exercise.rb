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
g = all_tenants.first
# get all tenants older than 65
h = all_tenants.where("age > ?", 65)
# get all apartments whose price is greater than $2300
j = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
y = Apartment.where(address: "6005 Damien Corners")
# get all tenants in that apartment
d = Tenant.where(apartment_id: 6)
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# Tenant.find_each do |x|
#   puts "name: #{x.name}, id: #{x.id}"
# end
# Iterate over each apartment, for each apartment, display it's address and rent price
# Apartment.find_each do |apart|
#   puts "address: #{apart.address}, price: #{apart.monthly_rent}"
# end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# Apartment.find_each do |a|
#   puts "address: #{a.address}"
#   a.tenants.each do |tenants|
#     puts tenants.name
#   end
# end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Apartment.create([
#   {address:"123 barber st", monthly_rent: 900, sqft: 3000, num_beds: 3, num_baths: 2},
#   {address:"2020 16th st", monthly_rent: 500, sqft: 1500, num_beds: 2, num_baths: 4},
#   {address:"1152 J ST NW", monthly_rent: 800, sqft: 2200, num_beds: 4, num_baths: 3}
# ])
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
# Tenant.create([
#   {name:"Jacob Greenwald", age: 28, gender: 'Male', apartment_id: 4},
#   {name:"Eric Lastname", age: 32, gender: 'Undecided', apartment_id: 9},
#   {name: "Randal Calrissian", age: 72, gender: "Male", apartment_id: 6},
#   {name: "Laura Erickson", age: 27, gender: "Female", apartment_id: 9},
#   {name: "Brandal Lothrifson", age: 22, gender: "Male", apartment_id: 4},
#   {name: "Mickey Mouserson", age: 29, gender: "Mouse", apartment_id: 18},
#   {name: "Goofy", age: 26, gender: "Dog", apartment_id: 11},
#   {name: "Cher", age: 45, gender: "Female", apartment_id: 18},
#   {name: "John Smith", age: 18, gender: "Male", apartment_id: 10}
# ])
# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.age += 1
# kristin.save
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# rennovation = Apartment.find_by(address: "62897 Verna Walk")
# rennovation.num_beds += 1
# rennovation.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# rennovation.monthly_rent += 400
# rennovation.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# mil = Tenant.where('age < ?', 30)
# mil.destroy_all

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"

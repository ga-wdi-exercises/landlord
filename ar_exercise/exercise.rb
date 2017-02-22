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
first_tenant = Tenant.find_by(id:"1")
# get all tenants older than 65
over_65 = Tenant.where("age>65")
# get all apartments whose price is greater than $2300
high_rent = Apartment.where("monthly_rent>2300")
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address:"6005 Damien Corners")
# get all tenants in that apartment
damien.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

Tenant.all.each do |tenant|
  puts "#{tenant.name} and #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display its address and rent price

Apartment.all.each do |apartment|
  puts "#{apartment.address} and #{apartment.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display its address and all of its tenants

Apartment.all.each do |apartment|
  puts "#{apartment.address} and #{apartment.tenants.inspect}"
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

new_apt1 = Apartment.create(address:"601 Calhoun Street", monthly_rent:675, sqft:525, num_beds:1, num_baths:1)
new_apt2 = Apartment.create(address:"1117 Clement Street", monthly_rent:3000, sqft:1100, num_beds:3, num_baths:2)
new_apt3 = Apartment.create(address:"167854 Street Avenue", monthly_rent:1500, sqft:969, num_beds:1, num_baths:2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

new_tenant1 = Tenant.create(name:"Michael Tunt, PhD", age:32, gender:"male", apartment_id:20)
new_tenant2 = Tenant.create(name:"Buster Bluth", age:33, gender:"male", apartment_id:21)
new_tenant3 = Tenant.create(name:"Andrew Lich, Esq.", age:31, gender:"male", apartment_id:9)
new_tenant4 = Tenant.create(name:"Susan Markus", age:54, gender:"female", apartment_id:22)
new_tenant5 = Tenant.create(name:"Bobby Craft", age:27, gender:"male", apartment_id:17)
new_tenant6 = Tenant.create(name:"Lisa Frank", age:59, gender:"female", apartment_id:13)
new_tenant7 = Tenant.create(name:"Kisma Patel, JD", age:38, gender:"female", apartment_id:15)
new_tenant8 = Tenant.create(name:"Ed Harrison", age:19, gender:"male", apartment_id:21)
new_tenant9 = Tenant.create(name:"Brian Bird", age:23, gender:"male", apartment_id:21)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older

bday_girl = Tenant.find_by(name:"Kristin Wisoky")
bday_girl.update(age:24)

# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom

verna = Apartment.find_by(address:"62897 Verna Walk")
verna.update(num_beds:3)

# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase its rent by $400
# to reflect the new bedroom

verna.update(monthly_rent:2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

eviction = Tenant.where("age<30")
eviction.destroy_all

binding.pry

puts "so pry works"

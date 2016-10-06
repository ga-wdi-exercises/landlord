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
# require_relative "db/tenant"
# require_relative "db/apartment"

################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
Tenant.find(1)
# get all tenants older than 65
Tenant.where('age > 65')
# get all apartments whose price is greater than $2300
Apartment.where('monthly_rent > 2300')
# get the apartment with the address "6005 Damien Corners"
Apartment.where("address = ?", "6005 Damien Corners")
# get all tenants in that apartment
Tenant.find_by('apartment_id = 6')

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |tenant|
  puts tenant.name
  puts tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |apt|
  puts apt.address
  puts apt.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apt|
  puts apt.address
  puts apt.tenants
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address:"123 Grand Street", monthly_rent: 3000, sqft:1000, num_beds: 2, num_baths: 2)
apt2 = Apartment.create(address:"88 Park Ave", monthly_rent:1500, sqft: 800, num_beds:2,num_baths:1)
apt3=Apartment.create(address:"456 Madison Ave", monthly_rent: 2000, sqft: 1200, num_beds:1, num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
tenant1 = Tenant.create(name:"Jane Jones", age: 40, gender:"Female", apartment_id: 20)
tenant2 = Tenant.create(name:"Sam Samuel", age: 25, gender:"Male", apartment_id: 5)
tenant3 = Tenant.create(name:"Kim Kardan", age: 31, gender:"Female", apartment_id: 8)
tenant4 = Tenant.create(name:"Lucas Chaplin", age:18, gender:"Male", apartment_id: 15)
tenant5 = Tenant.create(name:"Brad Cormier", age: 45, gender:"Male", apartment_id: 3)
tenant6 = Tenant.create(name:"Melinda King", age: 31, gender:"Female", apartment_id: 2)
tenant7 = Tenant.create(name:"Jesse King", age: 10, gender:"Male", apartment_id: 2)
tenant8 = Tenant.create(name:"Ryan Kartz", age: 67, gender:"Male", apartment_id: 17)
tenant9 = Tenant.create(name:"Raymond Kim", age: 35, gender:"Male", apartment_id: 21)
tenant10 = Tenant.create(name:"Susie Kim", age: 34, gender:"Female", apartment_id: 21)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin=Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age:24)
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
vernawalk = Apartment.find_by(address: "62897 Verna Walk")
vernawalk.update(num_beds:3)
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
vernawalk.update(monthly_rent:2800)
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
underage = Tenant.where('age<30')
# Delete their records from the DB
underage.destroy_all
binding.pry
puts "end"

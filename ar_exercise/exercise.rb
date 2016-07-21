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
first_tenant = Tenant.first
# get all tenants older than 65
older_65 = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
greater_2300 = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_tenants = Tenant.where(apartment_id: 6)
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
name_id = Tenant.all.each do |tenant|
  puts tenant.name
  puts tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
address_rent = Apartment.all.each do |apartment|
  puts apartment.address
  puts apartment.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
address_tenants = Apartment.all.each do |apartment|
  puts apartment.address
  puts apartment.tenants

end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`
Apartment.destroy_all
Tenant.destroy_all

# Create 3 new apartments, and save them to the DB
apartment1 = Apartment.create(address: "123 This Way", monthly_rent: 1500, sqft: 1100, num_beds: 2, num_baths: 1)
apartment2 = Apartment.create(address: "33 Ocean Avenue", monthly_rent: 2300, sqft: 1300, num_beds: 3, num_baths: 2)
apartment3 = Apartment.create(address: "1200 Connecticut Ave", monthly_rent: 1200, sqft: 900, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
sarah = Tenant.create(name: "Sarah Smith", age: 24, gender: "female", apartment_id: 5)
bob = Tenant.create(name: "Bobby Jacobs", age: 56, gender: "male", apartment_id: 9)
hillary = Tenant.create(name: "Hillary Hyatt", age: 30, gender: "female", apartment_id: 4)
harold = Tenant.create(name: "Harold Crick", age: 50, gender: "male", apartment_id: 7)
samson = Tenant.create(name: "Samson Specktor", age: 18, gender: "male", apartment_id: 8)
rupert = Tenant.create(name: "Rupert the Bear", age: 32, gender: "male", apartment_id: 9)
sally = Tenant.create(name: "Sally Face", age: 28, gender: "female", apartment_id: 5)
holly = Tenant.create(name: "Holly Flowers", age: 44, gender: "female", apartment_id: 4)
jill = Tenant.create(name: "Jill Hill", age: 62, gender: "female", apartment_id: 3)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: "Kristin Wisoky")
kristen.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.all.find_by(address: "62897 Verna Walk")
verna.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
younger_30 = Tenant.where("age < ?", 30)

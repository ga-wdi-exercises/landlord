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

  older_than_65=Tenant.where("age >?", 65)

# get all apartments whose price is greater than $2300
  greater_than_2300 = Apartment.where("monthly_rent  > ?", 2500)

# get the apartment with the address "6005 Damien Corners"
  dam_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
  tenants_dam_corners=dam_corners.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
  Tenant.all.each do |tenant|
    puts "Tenant name: #{tenant.name}, \tTenant ID: #{tenant.id}"
  end
# Iterate over each apartment, for each apartment, display it's address and rent price
  Apartment.all.each do |apartment|
    puts "Address: #{apartment.address}, \tRent Price: #{apartment.monthly_rent}"
  end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "111 Huey Way", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
apt2 = Apartment.create(address: "222 Duey St", monthly_rent: 2000, sqft: 2000, num_beds: 2, num_baths: 3)
apt3 = Apartment.create(address: "333 Luey Ter", monthly_rent: 3000, sqft: 3000, num_beds: 3000, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
ten1 =Tenant.create(name: "Mike Brady", age: 40 , gender: "Male", apartment_id: 21)
ten2 =Tenant.create(name: "Carol Brady", age: 40 , gender: "Female", apartment_id: 21)
ten3 =Tenant.create(name: "Marcia Brady", age:  16, gender: "Female", apartment_id: 22)
ten4 =Tenant.create(name: "Jan Brady", age:  14, gender: "Female", apartment_id: 22)
ten5 =Tenant.create(name: "Cindy Brady", age:  9, gender: "Female", apartment_id: 22)
ten6 =Tenant.create(name: "Greg Brady", age:  17, gender: "Male", apartment_id: 22)
ten7 =Tenant.create(name: "Peter Brady", age:  15, gender: "Male", apartment_id: 22)
ten8 =Tenant.create(name: "Bobby Brady", age:  10, gender: "Male", apartment_id: 22)
ten9 =Tenant.create(name: "Alice Brady", age:  40, gender: "Female", apartment_id: 23)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

binding.pry

puts "end"

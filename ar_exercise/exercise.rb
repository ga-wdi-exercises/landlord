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
first_tenants = Tenant.find(1);
# get all tenants older than 65
over_65 = Tenant.where("age > 65", :age);
# get all apartments whose price is greater than $2300
over_2300 = Apartments.where("monthly_rent > 2300", :over_2300);
# get the apartment with the address "6005 Damien Corners"
address_6005 = Apartment.where(address == "6005 Damien Corners");
# get all tenants in that apartment
damien_tenants = damien.tenats

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts tenant.name, tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartments.all.each do |apartments|
  puts apartment.address, apartment.monthy_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartments.all.each do |apartments|
  puts apartment.address, apartment.tenants
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "123 Fear Street", monthly_rent: 1000, sqft: 700, num_beds: 3, num_baths: 2)
Apartment.create(address: "1833 Dawsons Creek", monthly_rent: 1000, sqft: 700, num_beds: 3, num_baths: 2)
Apartment.create(address: "", monthly_rent: 1000, sqft: 700, num_beds: 3, num_baths: 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Spartacus", age: 21, gender: "Male", apartment_id: 21)
Tenant.create(name: "Crixus", age: 22, gender: "Male", apartment_id: 21)
Tenant.create(name: "Gannicus", age: 21, gender: "Male", apartment_id: 21)
Tenant.create(name: "Ragner", age: 22, gender: "Male", apartment_id: 22)
Tenant.create(name: "Bjorn", age: 24, gender: "Male", apartment_id: 22)
Tenant.create(name: "Hagertha", age: 26, gender: "Female", apartment_id: 22)
Tenant.create(name: "Aslaug", age: 29, gender: "Female", apartment_id: 22)
Tenant.create(name: "Onomaeus", age: 22, gender: "Male", apartment_id: 21)
Tenant.create(name: "Fiona", age: 21, gender: "Female", apartment_id: 23)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update("age" => 24)
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
apt_62897 = Apartment.find_by(address: "62897 Verna Walk")
apt_62897.update("num_beds" => 3)
apt_62897.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
apt_62897 = Apartment.find_by(address: "62897 Verna Walk")
apt_62897.update("monthly_rent" => 2800)
apt_62897.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
tenants_under_30 = []
  tenant_30 = Tenants.find_by("age" > 30)
  tenants_under_30 << tenants_30
end
tenants_under_30.destroy

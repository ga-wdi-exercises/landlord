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
  has_many :tenants,  dependent: :destroy
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
older_than_65 = Tenant.where(:age > 65)
# get all apartments whose price is greater than $2300
apartments_greater_than_2300 = Apartment.where(:price > 2300)
# get the apartment with the address "6005 Damien Corners"
damien_address = Apartment.where(:address ="6005 Damien Corners" )
# get all tenants in that apartment
tenants_damien = Apartment.Tenants.where(:address ="6005 Damien Corners")
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.each do |tenant|
  puts tenant.name + " " +tenant.id.to_s
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.each do |apartment|
  puts apartment.address +  " " + apartment.price
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.each do |apartment|
  puts apartment.address
  apartment.tenants.each do |tenantx|
    puts tenantx
  end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

x1 = Apartment.create(address: '123 moon st ', monthly_rent: 800, sqft: 1900,num_beds: 3,num_baths: 3)
x1 = Apartment.create(address: '456 mars st ', monthly_rent: 700, sqft: 1900,num_beds: 2,num_baths: 2)
x1 = Apartment.create(address: '789 pluto st ', monthly_rent: 600, sqft: 1900,num_beds: 1,num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

t1 = Tenant.create(name: guy1, age: 20, gender: "female", apartment_id: 10)
t2 = Tenant.create(name: guy2, age: 20, gender: "female", apartment_id: 10)
t3 = Tenant.create(name: guy3, age: 20, gender: "female", apartment_id: 10)
t4 = Tenant.create(name: guy4, age: 20, gender: "female", apartment_id: 10)
t5 = Tenant.create(name: guy5, age: 20, gender: "female", apartment_id: 10)
t6 = Tenant.create(name: guy6, age: 20, gender: "female", apartment_id: 10)
t7 = Tenant.create(name: guy7, age: 20, gender: "female", apartment_id: 10)
t8 = Tenant.create(name: guy8, age: 20, gender: "female", apartment_id: 10)
t9 = Tenant.create(name: guy9, age: 20, gender: "female", apartment_id: 10)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristing =  Tenant.where(:name = "Kristin Wisoky's")
kristing.update(:age =1)
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
apartment_62897 = Apartment.where(:address = "62897 Verna Walk")
apartment_62897.update(:num_beds apartment_62897.num_beds+1 )
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
apartment_62897.update(:rent apartment_62897.rent+400 )

# Millenial Eviction!
# Find all tenants who are under 30 years old
under_30  = Tenant.all.where(:age <30)
# Delete their records from the DB
under_30.destroy

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
older_tenants = Tenant.where('age > 65')
# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where('monthly_rent > 2300')
# get the apartment with the address "6005 Damien Corners"
damien_apartment = Apartment.find_by(address: '6005 Damien Corners')
# get all tenants in that apartment
damien_tenants = Tenant.where(apartment_id: '6')
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
address_rent = Apartment.all.each do |apartment|
  tenant_list = []
   Tenant.all.each do |tenant|
    if tenant.apartment_id == apartment.id
    tenant_list << tenant.name
    end
  end
  puts apartment.address
  puts tenant_list
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`
# Create 3 new apartments, and save them to the DB
Apartment.create(address: '1401 S Street', monthly_rent: 4000, sqft: 1500, num_beds: 2, num_baths: 2)
Apartment.create(address: '867 Main Street', monthly_rent: 1000, sqft: 500, num_beds: 1, num_baths: 1)
Apartment.create(address: '42 Wallaby Way', monthly_rent: 1500, sqft: 950, num_beds: 2, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: 'P Sherman', age: '30', gender: 'Male', apartment_id: 24)
Tenant.create(name: 'Nemo', age: '10', gender: 'Male', apartment_id: 24)
Tenant.create(name: 'John Smith', age: '42', gender: 'Male', apartment_id: 23)
Tenant.create(name: 'Whitney Cargill', age: '32', gender: 'Female', apartment_id: 22)
Tenant.create(name: 'Cindy Lou', age: '12', gender: 'Female', apartment_id: 10)
Tenant.create(name: 'Brie Jones', age: '32', gender: 'Female', apartment_id: 4)
Tenant.create(name: 'Mark Appleby', age: '35', gender: 'Male', apartment_id: 6)
Tenant.create(name: 'James Johnson', age: '40', gender: 'Male', apartment_id: 9)
Tenant.create(name: 'Wendy Bite', age: '80', gender: 'Female', apartment_id: 17)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Tenant.find_by(name: 'Kristin Wisoky').update(age: 24)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Apartment.find_by(address: '62897 Verna Walk').update(num_beds: 3)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Apartment.find_by(address: '62897 Verna Walk').update(monthly_rent: 2800)
# Millenial Eviction!
# Find all tenants who are under 30 years old
millenials = Tenant.where('age < 30')
# Delete their records from the DB
millenials.each { |millenial| millenial.destroy}
binding.pry

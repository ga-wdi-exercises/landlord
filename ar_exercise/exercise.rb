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
first = Tenant.first
# get all tenants older than 65
old_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
big_flats = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
six_DC = Apartment.find_by("address = '6005 Damien Corners'")
# get all tenants in that apartment
six_DC_Tens = Apartment.find_by("address = '6005 Damien Corners'").tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
ten_list = Tenant.all.each do |ten|
  puts ten.name
  puts ten.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
apt_list = Apartment.all.each do |apt|
  puts apt.address
  puts apt.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apt_tens = Apartment.all.each do |apt|
  puts apt.address
  apt.tenants.each do |ten|
    puts ten.name
  end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
bash = Apartment.create(address: "1515 Bashful Beaver Blvd", monthly_rent: 1100, sqft: 700, num_beds: 2, num_baths: 2)
creep = Apartment.create(address: "72 Creeping Clover Ct", monthly_rent: 950, sqft: 600, num_beds: 2, num_baths: 1)
prance = Apartment.create(address: "336 Prancing Pony Pkwy", monthly_rent: 2100, sqft: 1700, num_beds: 4, num_baths: 3)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
perry = Tenant.create(name: "Perrywinkle", age: 81, gender: "male", apartment: bash)
po = Tenant.create(name: "Po", age: 10, gender: "male", apartment: bash)
merry = Tenant.create(name: "Merry", age: 32, gender: "male", apartment: bash)
chuck = Tenant.create(name: "Chuck", age: 26, gender: "male", apartment: creep)
polly = Tenant.create(name: "Polly", age: 27, gender: "female", apartment: creep)
spolly = Tenant.create(name: "Spolly", age: 30, gender: "female", apartment: prance)
bridge = Tenant.create(name: "Bridge", age: 12, gender: "female", apartment: prance)
misha = Tenant.create(name: "Misha", age: 48, gender: "female", apartment: prance)
kesha = Tenant.create(name: "Kesha", age: 33, gender: "female", apartment: prance)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kW = Tenant.find_by("name = 'Kristin Wisoky'")
kW.age += 1
kW.save
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by("address = '62897 Verna Walk'")
verna.num_beds +=
verna.save
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.monthly_rent += 400
verna.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
mil = Tenant.where("age < 30")
mil.destroy_all

### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "bundler/setup"
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
first_tenant = Tenant.find(1)
# get all tenants older than 65
older_than_65 = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
rent_greater_2300 = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
apartment = Apartment.where(address: "6005 Damien Corners")
# get all tenants in that apartment
apartment_tenant = Tenant.where(apartment_id: 6)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.select(:name, :id)
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.select(:id, :address, :monthly_rent)
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment_one = Apartment.create(address: "123 Koopaland Dr.", monthly_rent: 7000, sqft: 290, num_beds: 3, num_baths: 2)
apartment_two = Apartment.create(address: "345 Peachland St.", monthly_rent: 800, sqft: 500, num_beds: 1, num_baths: 1)
apartment_three = Apartment.create(address: "678 Toadland Ct.", monthly_rent: 1200, sqft: 850, num_beds: 4, num_baths: 4)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create([
  {name: "John Rogers", age: 35, gender: "Male", apartment_id: 20},
  {name: "Helen Hershey", age: 48, gender: "Female", apartment_id: 20},
  {name: "Greg Hershey", age: 8, gender: "Male", apartment_id: 20},
  {name: "Josehp Lee", age: 18, gender: "Male", apartment_id: 21},
  {name: "Matt Ng", age: 26, gender: "Male", apartment_id: 21},
  {name: "Jenny Vo", age: 25, gender: "Female", apartment_id: 21},
  {name: "Andrew Rodriguez", age: 5, gender: "Male", apartment_id: 22},
  {name: "Joese Rodriguez", age: 65, gender: "Male", apartment_id: 22},
  {name: "Maria Rodriguez", age: 45, gender: "Female", apartment_id: 22}
  ])
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
rennovate = Apartment.find_by(address: "62897 Verna Walk")
rennovate.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
rennovate.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
tenantsunder30 = Tenant.where("age > ?", 30)
tenantsunder30.destroy

binding.pry

puts "end of application"

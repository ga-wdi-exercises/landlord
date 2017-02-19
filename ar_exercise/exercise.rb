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
# get all tenants older than 65
# get all apartments whose price is greater than $2300
# get the apartment with the address "6005 Damien Corners"
# get all tenants in that apartment

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# Iterate over each apartment, for each apartment, display it's address and rent price
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
new_apartment1 = Apartment.create (address:1000, monthly_rent:$3000, sqft: 1000, num_beds:27, num_baths:2 )
new_apartment2 = Apartment.create (address:1800, monthly_rent:$2000, sqft: 1000, num_beds:27, num_baths:2 )
new_apartment3 = Apartment.create (address:1500, monthly_rent:$1000, sqft: 600, num_beds:1, num_baths:0 )
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Joe = Tenant.create (name:"Joe", age: 12, gender:"Male", apartment_id:324)
Tom = Tenant.create (name:"Joe", age: 19, gender:"Male", apartment_id:326)
Dick = Tenant.create (name:"Joe", age: 19, gender:"Male", apartment_id:328)
Harry = Tenant.create (name:"Joe", age: 22, gender:"Male", apartment_id:724)
Suzy = Tenant.create (name:"Joe", age: 23, gender:"Female", apartment_id:524)
Clyde = Tenant.create (name:"Joe", age: 25, gender:"Male", apartment_id:924)
Beatrice = Tenant.create (name:"Joe", age: 27, gender:"Female", apartment_id:320)
Claudette = Tenant.create (name:"Joe", age: 40, gender:"Female", apartment_id:424)
Carmen = Tenant.create (name:"Joe", age: 30, gender:"Female", apartment_id:824)
Naomi = Tenant.create (name:"Joe", age: 55, gender:"Female", apartment_id:800)
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

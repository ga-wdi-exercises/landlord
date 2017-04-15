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
# Note to self: run these from $ ruby ar_exercise/exercise.rb
# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
over_65 = Tenant.where("age > '65'")

# get all apartments whose price is greater than $2300
over_2300 = Apartment.where("monthly_rent > '2300'")

# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address: '6005 Damien Corners')

# get all tenants in that apartment
damien.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
#?

# Iterate over each apartment, for each apartment, display it's address and rent price
#?

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
#?

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: '123 Maple Lane', monthly_rent: 700, sqft: 900, num_beds: 1, num_baths: 1)
Apartment.create(address: '456 Cedar Lane', monthly_rent: 1200, sqft: 1500, num_beds: 2, num_baths: 2)
Apartment.create(address: '789 Oak Rd', monthly_rent: 2000, sqft:2000, num_beds: 3, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: 'Carolyn Chan', age: 22, gender: 'Female', apartment_id: 20)
Tenant.create(name: 'Paige Blundt', age: 29, gender: 'Female', apartment_id: 21)
Tenant.create(name: 'Mark Jaboar', age: 23, gender: 'Male', apartment_id: 21)
Tenant.create(name: 'Natalia Jaboar', age: 23, gender: 'Female', apartment_id: 21)
Tenant.create(name: 'Arthur Weasley', age: 55, gender: 'Male', apartment_id: 22)
Tenant.create(name: 'Molly Weasley', age: 53, gender: 'Female', apartment_id: 22)
Tenant.create(name: 'Fred Weasley', age: 20, gender: 'Male', apartment_id: 22)
Tenant.create(name: 'George Weasley', age: 20, gender: 'Male', apartment_id: 22)
Tenant.create(name: 'Ron Weasley', age: 15, gender: 'Male', apartment_id: 22)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: 'Kristin Wisoky')
kristen.update(age: 24)


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.update(num_beds: 3)


# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: 2800)


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where("age < '30'")
millenials.destroy_all

binding.pry
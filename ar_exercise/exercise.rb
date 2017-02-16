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
#   first_tenant = tenant.find(1)
# get all tenants older than 65
#   seniors = tenant.find_by (age: "> 65")
# get all apartments whose price is greater than $2300
#   twok_apartment = apartment.find_by (monthly_rent: ">2300")
# get the apartment with the address "6005 Damien Corners"
    # damien_corners= apartment.find_by (address: "6005 Damien Corners")
# get all tenants in that apartment
# dcorners= Apartments.find_by (address: "6005 Damien Corners").tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
#   tenant.each do |name, id|
#     puts name
#     puts id
#   end
# Iterate over each apartment, for each apartment, display it's address and rent price
#   apartment.each do |address, monthly_rent|
#     puts address
#     puts monthly_rent
#    end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
#     Apartment.joins(:tenants).name
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by (name: "Kristin Wisoky")
# kristin.update(age: kristin.age + 1)
# end
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# verna_walk = apartment.find_by (address: "62897 Verna Walk")
# verna_walk.update(num_beds: verna_walk.num_beds +1)
# end
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# verna_walk.update(monthly_rent: verna_walk + 400)
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# under_thirty = tenant.find_by(age: >30 ).destroy

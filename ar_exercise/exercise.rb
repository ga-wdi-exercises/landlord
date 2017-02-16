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
older_than_65 = Tenant.where("age > 65", :age)
# get all apartments whose price is greater than $2300
over_2300 = Apartment.where("monthly_rent > 2300", :monthly_rent)
# get the apartment with the address "6005 Damien Corners"
find_address = Apartment.where("6005 Damien Corners", :address)
# get all tenants in that apartment
tenants_of_that_apartment = Tenant.where(find_address, :apartment_id)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_names_and_ids = puts Tenant.each(name, id)
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = puts Apartment.each(address, monthly_rent)
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments_address_and_tenants = puts Apartment.each(address, Tenant.each(apartment_id))

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
northwest =Apartment.create("1133 15th Street NW", 6000, 1, 3)
raleigh = Apartment.create("4306 Raleigh Ave", 1400, 2, 3)
hamway = Apartment.create("2223 Hamway Dr", 1100, 2, 3)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create('Frodo', 50, 'Male', hamway.id);
Tenant.create('Sam', 33, 'Male', hamway.id);
Tenant.create('Gandalf', 3234, 'Male', northwest.id);
Tenant.create('Aragorn', 62, 'Male', raleigh.id);
Tenant.create('Legolas', 339, 'Male', raleigh.id);
Tenant.create('Gimly', 174, 'Male', raleigh.id);
Tenant.create('Merry', 30, 'Male', hamway.id);
Tenant.create('Pipin', 25, 'Male', hamway.id);
Tenant.create('Boromir', 34, 'Male', raleigh.id);

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

Tenant.find(name: "Kristin Wisoky").update(age: +1)

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

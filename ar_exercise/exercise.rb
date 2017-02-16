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
old = Tenant.where "age>65"
# get all apartments whose price is greater than $2300
apart1 = Apartment.where "monthly_rent>2300"
# get the apartment with the address "6005 Damien Corners"
apart2 = Apartment.find_by(address:'6005 Damien Corners')
# get all tenants in that apartment
ten_apart2 = Apartment.find_by(address:'6005 Damien Corners').tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each{|tenant| puts "name = #{tenant.name} id = #{tenant.id}."}
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each{|apartment| puts "#{apartment.address} is #{apartment.monthly_rent}"}
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Apartment.create({ :address => "111", :monthly_rent => 1000, :sqft => 10, :num_beds => 1, :num_baths => 1})
Apartment.create({ :address => "112", :monthly_rent => 5000, :sqft => 50, :num_beds => 5, :num_baths => 5})
Apartment.create({ :address => "113", :monthly_rent => 10000, :sqft => 100, :num_beds => 10, :num_baths => 10})

Tenant.create({ :name => "001", :age => 18, :gender => "Male", apartment_id => 20})
Tenant.create({ :name => "002", :age => 18, :gender => "Female", apartment_id => 20})
Tenant.create({ :name => "003", :age => 18, :gender => "Male", apartment_id => 20})
Tenant.create({ :name => "004", :age => 18, :gender => "Female", apartment_id => 21})
Tenant.create({ :name => "005", :age => 18, :gender => "Male", apartment_id => 21})
Tenant.create({ :name => "006", :age => 18, :gender => "Female", apartment_id => 21})
Tenant.create({ :name => "James Bond", :age => 37, :gender => "Male", apartment_id => 21})
Tenant.create({ :name => "008", :age => 18, :gender => "Female", apartment_id => 21})
Tenant.create({ :name => "009", :age => 18, :gender => "Female", apartment_id => 20})
Tenant.create({ :name => "010", :age => 18, :gender => "Female", apartment_id => 20})


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: kristin.age + 1)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.update(num_beds: verna.num_beds + 1)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: verna.monthly_rent + 400)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
milenial = Tenant.where "age < 30"
milenial.destroy_all

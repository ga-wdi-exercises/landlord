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
first_tenants = Tenant.first
# get all tenants older than 65
retired = Tenant.where('age>65')
# get all apartments whose price is greater than $2300
expensive = Apartment.where('monthly_rent>2300')
# get the apartment with the address "6005 Damien Corners"
apartment_6005 = Apartment.find_by(address: '6005 Damien Corners')
# get all tenants in that apartment
all_tenants_6005 = Apartment.find_by(address: '6005 Damien Corners').tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts tenant.name, tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts apartment.address, apartment.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts apartment.address, apartment.tenants
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
one = Apartment.create(:address => '4620 Arlington Blvd', :monthly_rent => 3400, :sqft => 2700, :num_beds => 4, :num_baths =>4)
two = Apartment.create(:address => '320 Bradford Falls Trce', :monthly_rent => 2900, :sqft => 2100, :num_beds => 4, :num_baths => 3)
three = Apartment.create(:address => '4 Fritter Ln', :monthly_rent => 1300, :sqft => 1250, :num_beds => 3, :num_baths => 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
t_one = Tenant.create(:name => "Billy Keating", :age => 28, :gender => "Male", :apartment_id => 5)
t_two = Tenant.create(:name => "Katie Hubbell", :age => 26, :gender => "Female", :apartment_id => 7)
t_three = Tenant.create(:name => "Grant Jones", :age => 29, :gender => "Male", :apartment_id => 11)
t_four = Tenant.create(:name => "Hillary Robertson", :age => 27, :gender => "Female", :apartment_id => 21)
t_five = Tenant.create(:name => "Caroline Horn", :age => 32, :gender => "Female", :apartment_id => 30)
t_six = Tenant.create(:name => "Lee Von Shrader", :age => 63, :gender => "Male", :apartment_id => 18)
t_seven = Tenant.create(:name => "Jon Grammick", :age => 55, :gender => "Male", :apartment_id => 13)
t_eight = Tenant.create(:name => "Zach Regan", :age => 34, :gender => "Male", :apartment_id => 25)
t_nine = Tenant.create(:name => "Rae Owens", :age => 24, :gender => "Female", :apartment_id => 6)


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

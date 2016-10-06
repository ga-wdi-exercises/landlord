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
tenant_one = Tenant.first
# get all tenants older than 65
old_tenants = Tenant.where("age >= 65")
# get all apartments whose price is greater than $2300
ballers = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by address: '6005 Damien Corners'

# get all tenants in that apartment
damien.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |tent|
  puts "name: #{tent.name} and ID: #{tent.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |apt|
  puts "address #{apt.address} and price: #{apt.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_each do |apt|
  puts "address: #{apt.address}"
Tenants.find_each do |tent|
  puts "tenants: #{tent.address}"
  end
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
one = Apartment.create(:address => '1234 River Street', :monthly_rent => 1200, :sqft => 2300, :num_beds => 4, :num_baths =>1)
two = Apartment.create(:address => '892 Happy Feet Street', :monthly_rent => 1700, :sqft => 2100, :num_beds => 5, :num_baths => 2)
three = Apartment.create(:address => '900 Elizabeth Ave', :monthly_rent => 9000, :sqft => 4100, :num_beds => 6, :num_baths => 4)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
t_one = Tenant.create(:name => "Latoya Watson", :age => 21, :gender => "Female", :apartment_id => 20)
t_two = Tenant.create(:name => "Sarah South", :age => 43, :gender => "Female", :apartment_id => 4)
t_three = Tenant.create(:name => "North West", :age => 61, :gender => "Female", :apartment_id => 20)
t_four = Tenant.create(:name => "Beckey Yuah", :age => 45, :gender => "Female", :apartment_id => 22)
t_five = Tenant.create(:name => "Lauren Burrell", :age => 32, :gender => "Female", :apartment_id => 9)
t_six = Tenant.create(:name => "Mary Watson", :age => 63, :gender => "Male", :apartment_id => 20)
t_seven = Tenant.create(:name => "Jamie Smith", :age => 55, :gender => "Male", :apartment_id => 21)
t_eight = Tenant.create(:name => "Rob Smith", :age => 34, :gender => "Male", :apartment_id => 21)
t_nine = Tenant.create(:name => "Kim K", :age => 54, :gender => "Female", :apartment_id => 8)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kw = Tenant.find_by name: "Kristin Wisoky"
kw.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

verna = Apartment.find_by address: "62897 Verna Walk"
verna.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

verna.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

younguns = Tenant.where("age < 30")
younguns.destroy_all

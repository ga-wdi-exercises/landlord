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
Tenant.find(1)

# get all tenants older than 65
Tenant.where "age > 65"

# get all apartments whose price is greater than $2300
Apartment.where "monthly_rent > 2300"

# get the apartment with the address "6005 Damien Corners"
Apartment.find_by_address "6005 Damien Corners"

# get all tenants in that apartment
Tenant.all.where "apartment_id = 6"


# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each {|tenant| puts "#{tenant.name}, #{tenant.id}"}


# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each {|apt| puts "#{apt.address}, $#{apt.monthly_rent}"}


# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

Apartment.create(:address =>"123 crofton Rd", :monthly_rent => 1200, :sqft => 1200, :num_beds => 4, :num_baths => 1)
Apartment.create(:address =>"456 crumpton St", :monthly_rent => 1200, :sqft => 1200, :num_beds => 5, :num_baths => 1)
Apartment.create(:address =>"789 clinton Ave", :monthly_rent => 1200, :sqft => 1200, :num_beds => 3, :num_baths => 1)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(:name =>"Robin Hood", :age => 54, :gender => "male", :apartment_id => 1)
Tenant.create(:name =>"Little John", :age => 65, :gender => "male", :apartment_id => 2)
Tenant.create(:name =>"Ali Baba", :age => 24, :gender => "male", :apartment_id => 6)
Tenant.create(:name =>"Aladin", :age => 31, :gender => "male", :apartment_id => 4)
Tenant.create(:name =>"Lion King", :age => 22, :gender => "male", :apartment_id => 11)
Tenant.create(:name =>"Bruce Lee", :age => 73, :gender => "male", :apartment_id => 3)
Tenant.create(:name =>"Jackie Chain", :age => 65, :gender => "male", :apartment_id => 9)
Tenant.create(:name =>"Chuck Norris", :age => 89, :gender => "male", :apartment_id => 7)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: kristin.age + 1)
kristin.save
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

apt = Apartment.find_by(address: "62897 Verna Walk")
puts apt.address
new_beds = apt.num_beds + 1
apt.update(num_beds: new_beds)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

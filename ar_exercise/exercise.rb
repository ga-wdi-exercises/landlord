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
o
# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
senior_tenants = Tenant.where("age > 65")
# senior_tenants.each {|tenant| puts tenant.name, tenant.age}

# get all apartments whose price is greater than $2300
expensive_apts = Apartment.where("monthly_rent > 2300")
# expensive_apts.each {|apt| puts apt.address, apt.monthly_rent}


# get the apartment with the address "6005 Damien Corners"
damien_apt = Apartment.find_by_address("6005 Damien Corners")
# puts damien_apt.address


# get all tenants in that apartment
damient_tenants = damien_apt.tenants
# puts damient_tenants.each {|tenant| puts tenant.name}

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each {|tenant| puts "#{tenant.name}, #{tenant.id}"}

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each {|apt| puts "#{apt.address}, $#{apt.monthly_rent}"}

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apt|
  puts "--------------------------------------------------------------------------"
  puts apt.address

  apt.tenants.each do |tenant|
    puts tenant.name
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(:address =>"254 Julie Rd", :monthly_rent => 1200, :sqft => 1000, :num_beds => 1, :num_baths => 1)
Apartment.create(:address =>"987 Jefferson St", :monthly_rent => 2100, :sqft => 1800, :num_beds => 3, :num_baths => 3)
Apartment.create(:address =>"369 Pheffercorn Ave", :monthly_rent => 1500, :sqft => 1200, :num_beds => 1, :num_baths => 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(:name =>"Timothy Little", :age => 54, :gender => "male", :apartment_id => 15)
Tenant.create(:name =>"Jim Beam", :age => 65, :gender => "male", :apartment_id => 8)
Tenant.create(:name =>"Howard Stern", :age => 24, :gender => "male", :apartment_id => 6)
Tenant.create(:name =>"Janice Kilborn", :age => 31, :gender => "female", :apartment_id => 4)
Tenant.create(:name =>"Gregory Peck", :age => 62, :gender => "male", :apartment_id => 11)
Tenant.create(:name =>"Mark Young", :age => 73, :gender => "male", :apartment_id => 12)
Tenant.create(:name =>"James Howard", :age => 65, :gender => "male", :apartment_id => 9)
Tenant.create(:name =>"Larry Stewart", :age => 89, :gender => "male", :apartment_id => 8)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: kristen.age + 1)
kristen.save

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
apt.update(monthly_rent: apt.monthly_rent + 400)
apt.save


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where('age < 30')
millenials.destroy


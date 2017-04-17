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
old_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
expensive_apts = Apartment.where('monthly_rent > 2300')
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
dc_tenants = Apartment.find(6).tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
tenant_name_and_id = all_tenants.each { |tenant| puts "#{tenant.name} - #{tenant.id}" }
# Iterate over each apartment, for each apartment, display it's address and rent price
apartments = Apartment.all
apts_address_rent = apartments.each { |apt| puts "#{apt.address} - #{apt.monthly_rent}" }
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
tenant_list = apartments.each do |apt|
  puts apt.address
  all_tenants.each do |tenant|
    if tenant.apartment_id == apt.id
      puts tenant.name
    end
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "2 huntington place", monthly_rent: 500, sqft: 750, num_beds: 12, num_baths: 1)
apt2 = Apartment.create(address: "3434 everclear rd", monthly_rent: 1200, sqft: 50, num_beds: 0, num_baths: 3)
apt3 = Apartment.create(address: "47 boneville", monthly_rent: 800, sqft: 950, num_beds: 4, num_baths: 4)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

biff = Tenant.create(name: "just biff",age: 26,gender: "Female",apartment_id: 1)
al = Tenant.create(name: "al",age: 36,gender: "Male",apartment_id: 5)
big_al = Tenant.create(name: "big Al",age: 8,gender: "Male",apartment_id: 1)
sharon = Tenant.create(name: "sharon",age: 23,gender: "Female",apartment_id: 3)
jo = Tenant.create(name: "jo",age: 45,gender: "female",apartment_id: 9)
perry = Tenant.create(name: "perry winkle",age: 33,gender: "Male",apartment_id: 4)
beth = Tenant.create(name: "Beth",age: 75,gender: "Female",apartment_id: 18)
johnson = Tenant.create(name: "johnson",age: 55,gender: "Male",apartment_id: 15)
bertha = Tenant.create(name: "bertha",age: 26,gender: "Female",apartment_id: 14)


# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: 'Kristin Wisoky')
kristin.age = 22
kristin.save

# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.num_beds += 1
verna.save
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
verna.monthly_rent = 2800
verna.save
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
nomorekids = Tenant.where("age < 30").delete_all
# Delete their records from the DB

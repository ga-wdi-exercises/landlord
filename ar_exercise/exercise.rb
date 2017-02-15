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

binding.pry

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
older_tenants = Tenant.where('age > 65')

# get all apartments whose price is greater than $2300
pricier_apartments = Apartment.where('monthly_rent > 2300')

# get the apartment with the address "6005 Damien Corners"
nice_apartment = Apartment.find_by(address: '6005 Damien Corners')

# get all tenants in that apartment
nice_tenants = nice_apartment.tenants

# Use `each` and `puts` to:

# Display the name and ID # of every tenant
Tenant.all.each{|tenant| puts "#{tenant.id}: #{tenant.name}"}

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address}: $#{apartment.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "Tenants living at #{apartment.address} ..."
  apartment.tenants.each do |tenant|
    puts "  #{tenant.name}"
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "1 Generic Lane, Apt 1",
                 monthly_rent: 2100,
                 sqft: 1300,
                 num_beds: 3,
                 num_baths: 1)

Apartment.create(address: "1 Generic Lane, Apt 2",
                monthly_rent: 2100,
                sqft: 1300,
                num_beds: 3,
                num_baths: 1)

Apartment.create(address: "1 Generic Lane, Apt 3",
                 monthly_rent: 2100,
                 sqft: 1300,
                 num_beds: 3,
                 num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: 'Martin Sampson',
              age: 24,
              gender: 'Male',
              apartment_id: 20)

Tenant.create(name: 'Tina Teller',
              age: 29,
              gender: 'Female',
              apartment_id: 20)

Tenant.create(name: 'Alex Cisco',
              age: 26,
              gender: 'Male',
              apartment_id: 20)

Tenant.create(name: 'Maya Cordou',
              age: 21,
              gender: 'Female',
              apartment_id: 21)

Tenant.create(name: 'Emmet Pajaro',
              age: 22,
              gender: 'Male',
              apartment_id: 21)

Tenant.create(name: 'Angie Finn',
              age: 25,
              gender: 'Female',
              apartment_id: 21)

Tenant.create(name: 'Felix Strong',
              age: 28,
              gender: 'Male',
              apartment_id: 22)

Tenant.create(name: 'Margo Anderson',
              age: 25,
              gender: 'Female',
              apartment_id: 22)

Tenant.create(name: 'Eddy Nako',
              age: 27,
              gender: 'Male',
              apartment_id: 22)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: 'Kristin Wisoky')
kristin.age += 1
kristin.save

# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.num_beds += 1
verna.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.monthly_rent += 400
verna.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where('age < 30')
millenials.each{|millenial| millenial.destroy}

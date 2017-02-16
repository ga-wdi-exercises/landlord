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
@all_tenants = Tenant.all

# get the first tenant in the DB
@first_tenant = Tenant.first

# get all tenants older than 65
@older_than_65 = Tenant.where('age>?', 65)


# get all apartments whose price is greater than $2300
@rent_over_2300 = Apartment.where('monthly_rent>?', 2300)

# get the apartment with the address "6005 Damien Corners"
@damien_corners = Apartment.where(address: '6005 Damien Corners')

# get all tenants in that apartment
 # @damien_tenants = Apartment.where(address: '6005 Damien Corners').tenants
 @damien_tenants = Tenant.where(apartment_id: (Apartment.where(address: '6005 Damien Corners')))

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

Tenant.all.each { |person| puts person.name, person.id }

# Iterate over each apartment, for each apartment, display it's address and rent price

Apartment.all.each { |apartment| puts apartment.address, apartment.monthly_rent }


# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

Apartment.all.each { |apartment| puts apartment.address, Tenant.where(apartment_id: apartment).pluck(:name) }

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "221 B Baker St", monthly_rent: 800, sqft: 1200, num_beds: 2, num_baths: 2)
Apartment.create(address: "12 Grimmauld Place", monthly_rent: 1200, sqft: 3200, num_beds: 5, num_baths: 3)
Apartment.create(address: "8 Nine Way", monthly_rent: 900, sqft: 1500, num_beds: 3, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Bruce Wayne", age: 35, gender: "Male", apartment_id: 21)
Tenant.create(name: "Dick Grayson", age: 29, gender: "Male", apartment_id: 21)
Tenant.create(name: "Barbara Gordan", age: 24, gender: "Female", apartment_id: 22)
Tenant.create(name: "Dinah Lance", age: 25, gender: "Female", apartment_id: 22)
Tenant.create(name: "Helena Bertinelli", age: 26, gender: "Female", apartment_id: 22)
Tenant.create(name: "Tim Drake", age: 25, gender: "Male", apartment_id: 21)
Tenant.create(name: "Kate Kane", age: 32, gender: "Female", apartment_id: 23)
Tenant.create(name: "Cassandra Cain", age: 25, gender: "Female", apartment_id: 23)
Tenant.create(name: "Stephanie Brown", age: 24, gender: "Female", apartment_id: 23)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Tenant.where(name: "Kristin Wisoky").increment!(:age)
#
# Tenant.where(name: "Kristin Wisoky").update(age: Tenant.where(name: "Kristin Wisoky").age+1)
k = Tenant.find_by(name: "Kristin Wisoky")
k.update(age: k.age+1)


# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
v = Apartment.find_by(address: "62897 Verna Walk")
v.update(num_beds: v.num_beds+1)
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Apartment.where(address: "62897 Verna Walk").update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
Tenant.where('age<?', 30).destroy_all
#pretty sure this is a Fair Housing Violation...
# Delete their records from the DB

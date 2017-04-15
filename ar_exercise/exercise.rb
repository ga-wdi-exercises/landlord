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
Tenant.where('age > 65')

# get all apartments whose price is greater than $2300
Apartment.where('monthly_rent > 2300')

# get the apartment with the address "6005 Damien Corners"
Apartment.where(address: "6005 Damien Corners")

# get all tenants in that apartment
Tenant.where(apartment_id: "6")

# Use `each` and `puts` to:

# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts tenant.name
  puts tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price

all_apartments = Apartment.all
all_apartments.each do |apartment|
  puts apartment.address
  puts apartment.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

# all_apartments.each do |apartment|
#   puts apartment.address
#   tenant_id = all_tenants.each do |tenant|
#     (tenant.id = apartment.apartment_id)
#   puts apartment.monthly_rent
# end
#
# .select('apartment.id, apartment.address, tenant.apartment_id')
# .joins (:tenant)
# Person
#   .select('people.id, people.name, companies.name')
#   .joins(:company)
#   .find_by('people.name' => 'John') # this should be the last
# The above should generate:
#
# SELECT people.id, people.name, companies.name
# FROM people
# INNER JOIN companies
#   ON companies.person_id = people.id
# WHERE people.name = 'John'
# LIMIT
#
#
# SELECT apartments.id, apartments.address, tenants.apartment_id
#   FROM apartments
# INNER JOIN tenants
#     ON apartments.id = tenants.apartment_id
#   WHERE apartments.address = ' Emard Row '

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
ann = Apartment.new(address: "5607 Albia Road", monthly_rent: 5000, sqft: 6000, num_beds: 5, num_baths: 4)
meag = Apartment.new(address: "1336 Q Street", monthly_rent: 4500, sqft: 6000, num_beds: 4, num_baths: 3)
courtney = Apartment.new(address: "619 F Street", monthly_rent: 3500, sqft: 4000, num_beds: 4, num_baths: 2)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

ben = Tenant.new(name: "Ben", age: 20, gender: "male", apartment_id: 13)
andrew = Tenant.new(name: "Andrew", age: 21, gender: "male", apartment_id: 13)
mairead = Tenant.new(name: "Mairead", age: 21, gender: "female", apartment_id: 13)
jenna = Tenant.new(name: "Jenna", age: 18, gender: "female", apartment_id: 13)
neil = Tenant.new(name: "Neil", age: 12, gender: "male", apartment_id: 13)
joseph = Tenant.new(name: "Joseph", age: 19, gender: "male", apartment_id: 13)
owen = Tenant.new(name: "Owen", age: 30, gender: "male", apartment_id: 13)
connor = Tenant.new(name: "Connor", age: 25, gender: "male", apartment_id: 13)
ben = Tenant.new(name: "Meghan", age: 29, gender: "female", apartment_id: 13)



# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin_birthday = Tenant.find_by(name:'Maudie Mosciski')
kristin_birthday.update(age: 24)

#kristin_new_age = (kristin_birthday.age + 1)
#kristin_birthday.update("#{kristin_new_age}")

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
update_verna = Apartment.find_by(address: "62897 Verna Walk")
update_verna.update(num_beds: 3)

# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

update_verna.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
Tenant.where('age <30')
# Delete their records from the DB

$ dropdb landlord
$ createdb landlord
$ psql -d landlord < db/schema.sql
$ psql -d landlord < db/seeds.sql

binding.pry

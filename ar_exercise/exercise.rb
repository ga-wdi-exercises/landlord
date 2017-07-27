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
old_tenants = Tenant.where("age > ?" , 65)
# get all apartments whose price is greater than $2300
pricy_apartments = Apartment.where("monthly_rent > ?" > 2300)
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address: '6005 Damien Corners')
# get all tenants in that apartment
d_id = Apartment.find_by(address: '6005 Damien Corners').id
d_tenants = Tenant.where(apartment_id: d_id)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
name_id_tenant = Tenant.all.each do |person|
  puts person.name
  puts person.id
end

# Iterate over each apartment, for each apartment, display it's address and rent price
add_rent_apt = Apartment.all.each do |place|
  puts place.address
  puts place.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

add_ten_apt = Apartment.all.each do |place|
  puts place.address
  Tenant.all.each do |person|
    if person.apartment_id == place.id
      puts person.name
    end
  end
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt = Apartment.new(address: => 'first')
apt2 = Apartment.new(address: => 'second')
apt3 = Apartment.new(address: => 'third')

apt.save
apt2.save
apt3.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

new_t = Tenant.create([
  {name: "John McJohnson", age: 22, gender: 'Male', apartment_id: 17}
  {name: "Bob Roberts", age: 26, gender: 'Male', apartment_id: 12}
  {name: "Sue Susan", age: 29, gender: 'Female', apartment_id: 2}
  {name: "Henry Holiday", age: 32, gender: 'Male', apartment_id: 1}
  {name: "Griff McRiff", age: 42, gender: 'Male', apartment_id: 5}
  {name: "Lisa Lane", age: 28, gender: 'Female', apartment_id: 9}
  {name: "Meg Montana", age: 30, gender: 'Female', apartment_id: 13}
  {name: "Henry Sticks", age: 19, gender: 'Male', apartment_id: 10}
  {name: "Fred Larango", age: 41, gender: 'Male', apartment_id: 16}
  ])


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(:name 'Kristin Wisoky')
kristin.update(:age kristin.age += 1)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(:address '62897 Verna Walk')
verna.update(:num_beds += 1)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

high_rent = verna.update(:monthly_rent += 400)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
mill = Tenant.where('age < ?', 30)
mill.destroy

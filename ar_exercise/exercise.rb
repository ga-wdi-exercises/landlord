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
old_tenants = Tenant.find_by(age: >65)
# get all apartments whose price is greater than $2300
expensive_apartements = apartments.find_by(monthly_rent: >2300)
# get the apartment with the address "6005 Damien Corners"
specfic_apartement = apartments where adress= "6005 Damien Corners"
# get all tenants in that apartment
specfic_apartement=gets.chomb
tenane_in_apartement=Tenant.find_by(apartment_id:specfic_apartement)

# Use `each` and `puts` to:

# Display the name and ID # of every tenant
all_tenants=Tenant.all
name=all_tenants.name
id=all_tenants.id

# Iterate over each apartment, for each apartment, display it's address and rent price
  apartments.each |apartemnt| do
    address=apartemnt.address
    rent=apartemnt.monthly_rent
    puts "The monthly rent for apartemnt found in #{address} is #{rent}"
  end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apartments.each |apartemnt| do
  address=apartemnt.address
  tenants=Tenant.find_by(apartment_id:apartemnt)
  puts "The tenants live in apartemnt found in #{address} are the following: #{tenants}"
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
abc = apartments.new(address: "1234 north", monthly_rent: 800,sqft: 1200,num_beds:2,num_baths:1 )
abc.save
defg = apartments.new(address: "5678 West", monthly_rent: 950,sqft: 900,num_beds:1,num_baths:1 )
defg.save
hij = apartments.new(address: "9101 East", monthly_rent: 1000,sqft: 1300,num_beds:2,num_baths:2 )
hij.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

aaaa = Artist.create(name: "aaaa bbbb", age: 22, gender: "Male", apartment_id: 18)
cccc = Artist.create(name: "cccc dddd", age: 32, gender: "Female", apartment_id: 16)
eeee = Artist.create(name: "eeee ffff", age: 42, gender: "Male", apartment_id: 20)
gggg = Artist.create(name: "gggg hhhh", age: 21, gender: "Male", apartment_id: 8)
iiii = Artist.create(name: "iiii  jjjj" age: 31, gender: "Female", apartment_id: 9)
kkkk = Artist.create(name: "kkkk llll", age: 25, gender: "Male", apartment_id: 11)
mmmm = Artist.create(name: "mmmm nnnn", age: 28, gender: "Male", apartment_id: 15)
oooo = Artist.create(name: "oooo pppp", age: 62, gender: "Female", apartment_id: 16)
qqqq = Artist.create(name: "qqqq rrrr", age: 72, gender: "Male", apartment_id: 19)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Kristin=tenants.find_by(name: "Kristin Wisoky")
Kristin.Update(age: age+1)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
62897=apartments.find_by(address: "62897 Verna Walk")
62897.Update(num_beds: num_beds+1)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
62897.Update(monthly_rent: monthly_rent+400)
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
young_tenants=tenants.find_by(age:<30)
young_tenants.destroy

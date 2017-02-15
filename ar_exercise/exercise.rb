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
first_tenant = Tenant.all[0]
# get all tenants older than 65
old_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
rich_people_cribs = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
apartment = Apartment.find_by address: "6005 Damien Corners"
# get all tenants in that apartment

tenants = Tenant.where("apartment_id = #{apartment.id}")

# Use `each` and `puts` to:



# Display the name and ID # of every tenant
all_tenants.each do |ten|
  puts ten.id.to_s
  puts ten.name
end


# Iterate over each apartment, for each apartment, display it's address and rent price

all_apartments = Apartment.all

all_apartments.each do |apr|
  puts apr.address
  puts apr.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

all_apartments.each do |apr|
  puts apr.address
  all_tenants.each do |ten|
    if ten.apartment_id == apr.id
      puts ten.name
    end
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

Apartment.create(:address => 'new_apartment1')
Apartment.create(:address => 'new_apartment2')
Apartment.create(:address => 'new_apartment3')
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

Tenant.create(:name => 'name1',:apartment_id => 1)
Tenant.create(:name => 'name2',:apartment_id => 1)
Tenant.create(:name => 'name3',:apartment_id => 1)
Tenant.create(:name => 'name4',:apartment_id => 1)
Tenant.create(:name => 'name5',:apartment_id => 1)
Tenant.create(:name => 'name6',:apartment_id => 1)
Tenant.create(:name => 'name7',:apartment_id => 1)
Tenant.create(:name => 'name8',:apartment_id => 1)
Tenant.create(:name => 'name9',:apartment_id => 1)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

all_tenants.each do |ten|
  if ten.name == 'Kristin Wisoky'
    puts ten.age
    ten.age = ten.age + 1
    puts ten.name
    puts ten.age
  end

end

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

all_apartments.each do |apr|
  if apr.address == "62897 Verna Walk"
    puts apr.address
    puts apr.num_beds
    apr.num_beds = apr.num_beds + 1
    puts apr.num_beds
  end
end

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

all_apartments.each do |apr|
  if apr.address == "62897 Verna Walk"
    puts apr.address
    puts apr.monthly_rent
    apr.monthly_rent = apr.monthly_rent + 400
    puts apr.monthly_rent
  end
end

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

all_tenants.each do |ten|
  if ten.age != nil
    if (ten.age < 30)
      puts ten.name
      ten.destroy
    end
  end
end

binding.pry

puts "program resumes here"

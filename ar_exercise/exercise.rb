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
first = Tenant.first
# get all tenants older than 65
seniors = Tenant.select do |x|
  x[:age] >= 65
end

# get all apartments whose price is greater than $2300
gentrification = Apartment.select {|x| x.monthly_rent > 2300}

# get the apartment with the address "6005 Damien Corners"
omen = Apartment.find_by_address("6005 Damien Corners")
# get all tenants in that apartment
coven = Tenant.where(:apartment_id => omen[:id])
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "#{tenant.name} has id #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apt|
  puts "#{apt.address} has a rent of $#{apt.monthly_rent}."
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apt|
  puts "#{apt.address}'s tenants are: "
  all_tenants.each do |tenant|
    if tenant[:apartment_id] == apt[:id]
      puts "#{tenant.name}"
    end
  end
  #{all_tenants.where(:apartment_id => apt.id)}."
end



################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
this = Apartment.create(:address =>"1234 this lane", :monthly_rent => 700, :sqft => 1400, :num_beds => 2, :num_baths => 1)
that = Apartment.create(:address =>"5678 that lane", :monthly_rent =>700, :sqft => 1400, :num_beds => 2, :num_baths => 1)
cool = Apartment.create(:address =>"420 cool st", :monthly_rent =>666, :sqft => 2100, :num_beds => 3, :num_baths =>2)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kris = Tenant.where(name:"Kristin Wisoky").update(:age => 24)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
rennovate = Apartment.where(address: "62897 Verna Walk")
rennovate.update(:num_beds => rennovate[0][:num_beds]+=1)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
rennovate.update(:monthly_rent => rennovate[0][:monthly_rent]+=1)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.select {|x| x.age < 30}
millenials.each do |y|
  Tenant.destroy(y[:id])
end

binding.pry

#lkasjdfj

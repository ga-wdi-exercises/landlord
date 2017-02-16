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
  # all_tenants = Tenant.all

# get the first tenant in the DB
  # first_tenant = Tenant.first;
# get all tenants older than 65
  # tenant_over_65 = Tenant.where("age >65",:age);
# get all apartments whose price is greater than $2300
  #over_2300 = Apartment.where("monthly_rent > 2300", :monthly_rent);
# get the apartment with the address "6005 Damien Corners"
  # addre1 = Apartment.find_by address: "6005 Damien Corners";
# get all tenants in that apartment
  #apt6_tenants = Tenant.where("apartment_id =6", :apartment_id);

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
    # Tenant.all.each do |tenant|
    #     puts tenant.name , tenant.id
    # end

# Iterate over each apartment, for each apartment, display it's address and rent price
    # Apartment.all.each do |apartment|
    #   puts apartment.address, apartment.monthly_rent
    # end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
        #
        # Apartment.all.each do |apartment|
        #         house_tenants = Tenant.select{|tenant| tenant[:apartment_id] == apartment[:id]}
        #         puts apartment.address
        #         puts house_tenants
        #      end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
  # cherokee = Apartment.create(address: "234 Cherokee Way", monthly_rent: 2300, sqft: 190, num_beds: 2, num_baths: 2)
  # glove = Apartment.create(address: "234 Glove Way", monthly_rent: 2200, sqft: 200, num_beds: 2, num_baths: 2)
  # brook = Apartment.create(address: "234 Brook Way", monthly_rent: 2100, sqft: 160, num_beds: 2, num_baths: 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
  # Tenant.create(name: 'Bill Lively', age: 80, gender: 'Female', apartment_id: 1)
  # Tenant.create(name: 'Tyler Jones', age: 90, gender: 'Female', apartment_id: 1)
  # Tenant.create(name: 'Loli Moin', age: 60, gender: 'Female', apartment_id: 2)
  # Tenant.create(name: 'Tyler Parker', age: 30, gender: 'Male', apartment_id: 2)
  # Tenant.create(name: 'Joe Moise', age: 60, gender: 'Male', apartment_id: 2)
  # Tenant.create(name: 'player1', age: 30, gender: 'Female', apartment_id: 2)
  # Tenant.create(name: 'tyler2', age: 40, gender: 'Male', apartment_id: 3)
  # Tenant.create(name: 'brook', age: 70, gender: 'Female', apartment_id: 3)
  # Tenant.create(name: 'Joe Stalin', age: 60, gender: 'Male', apartment_id: 3)
  # 
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
  # kristen= Tenant.find_by name: "Kristin Wisoky";
  # kristen.update age: 24;

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
  # verna = Apartment.find_by address: "62897 Verna Walk";
  # verna.update num_beds: 3;
  # verna.save
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
  # verna.update monthly_rent: 2800;
  # verna.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
  # Tenant.where("age <30", :age).destroy_all

binding.pry

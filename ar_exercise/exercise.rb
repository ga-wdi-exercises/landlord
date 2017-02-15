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
SELECT FIRST(name) FROM tenants;
# get all tenants older than 65
SELECT * FROM tenants WHERE age >= 65;
# get all apartments whose price is greater than $2300
SELECT * FROM apartments WHERE monthly_rent >= 2300;
# get the apartment with the address "6005 Damien Corners"
SELECT * FROM apartments WHERE address = '6005 Damien Corners';
# get all tenants in that apartment
SELECT * FROM tenants WHERE apartment_id = 6;

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

idName = SELECT name, tenant_id FROM tenants;
idName.each do |tenant|
  puts tenant
end

# Iterate over each apartment, for each apartment, display it's address and rent price

aptdeets = SELECT address, monthly_rent FROM apartments;
aptdeets.each do |apts|
  puts apts
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment1= Apartments.new(address: "26 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)

apartment1.save

apartment2= Apartments.new(address: "27 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)
apartment2.save

apartment3= Apartments.new(address: "28 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)
apartment3.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

INSERT INTO tenants (name, age, gender) VALUES ('Joe Schmo', 40, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Joe Jack', 30, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Kieth Love', 41, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Joe NoSchmo', 23, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Jame Schmo', 40, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Jackie something', 23, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Julie Clark', 40, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Cathy Something', 40, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Lady Gaga', 31, 'Female');

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
UPDATE tenants SET age +1 WHERE name = 'Kristin Wisoky'; 
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

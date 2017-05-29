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
all_apartment = Apartment.all

# get the first tenant in the DB
select * from tenants where LIMIT 1;
# get all tenants older than 65
select * from tenants where age > 65;

# get all apartments whose price is greater than $2300
select * from apartments where monthly_rent > 2300;

# get the apartment with the address "6005 Damien Corners"
select * from apartments where address = '6005 Damien Corners';

# get all tenants in that apartment
SELECT * from tenants where apartment_id = (select id from apartments where address = '6005 Damien Corners')
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
#tenant = all_tenants.first;
all_tenants.each do |i|
    puts "#{i[:name]} #{i[:id]}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartment.each do |i|
  puts "#{:address} #{:monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartment.each do |i|
  puts "#{i[:address]} #{:tenants:apartment_id}"
end



################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
INSERT INTO apartments (address, monthly_rent, sqft, num_beds, num_baths) VALUES ('2576 Fairland Rd', 5000, 2387, 5, 4);
INSERT INTO apartments (address, monthly_rent, sqft, num_beds, num_baths) VALUES ('1321 Trump Rd', 2313, 1313, 3, 5);
INSERT INTO apartments (address, monthly_rent, sqft, num_beds, num_baths) VALUES ('876 Obama Rd', 2323, 2323, 3, 5);
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dr. Yakob Alemu', 21, 'Male', 21);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Fitssum Haile', 30, 'Male', 21);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Noel Haile', 66, 'Male', 21);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Mihret Getahun', 26, 'Female', 21);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Samson Getahun', 9, 'Female', 22);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Namrud Berhane Sr.', 6, 'Female', 22);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Kelem Denbu', 69, 'Female', 22);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Wolde Haile', 76, 'Male', 23);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dr. Girum Wolde', 61, 'Female', 23);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Mistre Haile', 9, 'Female', 23);

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
select * from tenants where name = 'Kristin Wisoky';
UPDATE tenants SET age = '24' where name = 'Kristin Wisoky';
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

select * from apartments where address = '62897 Verna Walk';
UPDATE apartments SET num_beds = '3' where address = '62897 Verna Walk';

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
UPDATE apartments SET monthly_rent = '2800' where address = '62897 Verna Walk';

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
DELETE from tenants where age < '30';

require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment" # require the Artist class definition that we defined in the models/artist.rb file
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all

# This will put us into a state of the pry REPL, in which we've established a connection
# with the tunr_db database and have defined the Artist Class as an
# ActiveRecord::Base class.
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
INSERT INTO apartments (address, monthly_rent, sqft, num_beds, num_baths) VALUES ('2576 Fairland Rd', 5000, 2387, 5, 4);
INSERT INTO apartments (address, monthly_rent, sqft, num_beds, num_baths) VALUES ('1321 Trump Rd', 2313, 1313, 3, 5);
INSERT INTO apartments (address, monthly_rent, sqft, num_beds, num_baths) VALUES ('876 Obama Rd', 2323, 2323, 3, 5);

binding.pry

puts "end of application"

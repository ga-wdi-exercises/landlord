require "bundler/setup" #
require "pg"
require "active_record"
require "pry"
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
Tenant.destroy_all
Apartment.destroy_all

binding.pry

puts "end of application"

INSERT INTO tenants (name, age, gender) VALUES ('Joe Schmo', 40, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Joe Jack', 30, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Kieth Love', 41, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Joe NoSchmo', 23, 'Male');
INSERT INTO tenants (name, age, gender) VALUES ('Jame Schmo', 40, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Jackie something', 23, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Julie Clark', 40, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Cathy Something', 40, 'Female');
INSERT INTO tenants (name, age, gender) VALUES ('Lady Gaga', 31, 'Female');


INSERT INTO apartments (address, monthly_rent, sqft, num_beds) VALUES ('26 Victory Lane', 900, 567, 3, 2);

INSERT INTO apartments (address, monthly_rent, sqft, num_beds) VALUES ('26 Victory Lane', 400, 300, 3, 2);

INSERT INTO apartments (address, monthly_rent, sqft, num_beds) VALUES ('26 Victory Lane', 800, 600, 3, 2);

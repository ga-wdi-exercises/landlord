require "pg"
require "active_record"
require "pry"

require_relative "../models/tenant"
require_relative "../models/apartment"

require_relative "connection.rb"


Apartment.destroy_all
Tenant.destroy_all

# destroys existing data in database
-- TRUNCATE TABLE apartments CASCADE;
-- TRUNCATE TABLE tenants CASCADE;
--
-- ALTER SEQUENCE apartments_id_seq RESTART WITH 1;
-- ALTER SEQUENCE tenants_id_seq RESTART WITH 1;


Apartment.create(address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 19, num_beds: 3, num_baths: 2)
Apartment.create(address: "44010 Lemke Crossroad", monthly_rent: 1000, sqft: 130, num_beds: 1, num_baths: 3)
Apartment.create(address: "77841 Jany Lane", monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths: 3)
Apartment.create(address: "4518 Ivy Spur", monthly_rent: 2000, sqft: 1000, num_beds: 1, num_baths: 2)
Apartment.create(address: "95287 Kamille Underpass", monthly_rent: 2800, sqft: 1400, num_beds: 1, num_baths: 3) 
Apartment.create(address: "6005 Damien Corners", monthly_rent: 400, sqft: 230, num_beds:4 , num_baths:1 )
Apartment.create(address: "95599 Koch Stream", monthly_rent: 2400, sqft: 1900, num_beds: 2, num_baths: 4)
Apartment.create(address: "40583 Hal Crossing", monthly_rent: 200, sqft: 800, num_beds: 3, num_baths: 2)
Apartment.create(address: "62897 Verna Walk", monthly_rent: 2400, sqft: 700, num_beds:2 , num_baths:3 )
Apartment.create(address: "351 Dibbert Fields", monthly_rent: 2300, sqft: 1300, num_beds: 2, num_baths: 1)
Apartment.create(address: "3710 Buford Passage", monthly_rent: 500, sqft: 700, num_beds: 1, num_baths: 4)
Apartment.create(address: "64329 Tyree Creek", monthly_rent: 500, sqft: 2000, num_beds: 1, num_baths: 3)
Apartment.create(address: "17297 Runte Bypass", monthly_rent: 2300, sqft: 1700, num_beds: 3, num_baths: 2)
Apartment.create(address: "0889 Marvin Radial", monthly_rent: 1100, sqft: 500, num_beds: 3, num_baths: 2)
Apartment.create(address: "2745 Freddy Vista", monthly_rent: 2800, sqft: 1400, num_beds: 4, num_baths: 4)
Apartment.create(address: "359 Gutmann Pike", monthly_rent: 2700, sqft: 1900, num_beds: 2, num_baths: 1)
Apartment.create(address: "08465 Howell Harbor", monthly_rent: 300, sqft: 1300, num_beds:3 , num_baths:1 )
Apartment.create(address: "8865 Borer Viaduct", monthly_rent: 600, sqft: 600, num_beds: 1, num_baths: 4)
Apartment.create(address: "7357 Emard Row", monthly_rent: , sqft: 2300, num_beds: 3, num_baths: 2)
Apartment.create(address: "175 Benedict Ridges", monthly_rent: 2600, sqft: 2100, num_beds: 3, num_baths: 3)
Apartment.create(address: "45714 Schinner Expressway", monthly_rent: 900, sqft: 2200, num_beds: 6, num_baths: 3)
Apartment.create(address: "60059 Leta Roads", monthly_rent: 1100, sqft: 2500, num_beds: 3, num_baths: 4)

INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Maudie Mosciski', 90, 'Female', 1);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Kristin Wisoky', 23, 'Female', 1);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Demario King', 71, 'Female', 2);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Kaitlin Cormier', 91, 'Male', 3);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Rosalinda Champlin', 39, 'Male', 3);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Valentin Keebler Sr.', 74, 'Male', 5);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Ms. Garland Beatty', 60, 'Female', 6);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Eryn Lynch', 12, 'Male', 6);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Tiara Conn', 3, 'Male', 7);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Tillman Schroeder', 27, 'Male', 7);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Amber Jewess', 57, 'Female', 7);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('America Pollich', 82, 'Female', 7);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Mylene Krajcik', 25, 'Male', 7);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Josh Gottlieb', 8, 'Female', 8);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Sherwood Stiedemann', 72, 'Female', 8);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Katarina Kunde', 6, 'Female', 8);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Mabelle Eichmann', 16, 'Male', 9);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Mason Blanda', 83, 'Female', 9);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Sonny Dibbert I', 30, 'Female', 9);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Gus Herman II', 65, 'Male', 9);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Delia Christiansen MD', 57, 'Female', 9);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Willow Ledner Jr.', 46, 'Male', 9);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Titus Harvey', 19, 'Male', 10);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Ms. Randal Konopelski', 7, 'Female', 10);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Caleb Maggio', 55, 'Male', 11);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Hilbert Effertz', 30, 'Male', 11);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Bartholome Herman', 93, 'Male', 11);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Merritt Durgan', 34, 'Female', 11);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Helmer Grimes', 80, 'Female', 14);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Derrick Farrell', 81, 'Male', 14);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Enola Sauer V', 31, 'Female', 14);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Jimmy Bartell', 22, 'Female', 14);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Christophe Boyle DVM', 55, 'Female', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Miss Wanda Kris', 57, 'Female', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Miss Maeve Goldner', 10, 'Male', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Noemie Daniel', 15, 'Female', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Shanna Jacobson', 38, 'Female', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Javier Boehm', 82, 'Female', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Aurelia Harvey', 35, 'Male', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dangelo Bogisich', 60, 'Female', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Benton Abernathy', 55, 'Female', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Marina Kemmer', 37, 'Female', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dasia Vandervort', 4, 'Female', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Bo Medhurst', 6, 'Male', 17);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Elta Fay', 6, 'Female', 18);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Conner Dare', 92, 'Male', 18);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dr. Lindsey Reichert', 18, 'Male', 18);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Carlee Nolan', 77, 'Female', 18);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Bernie Weimann', 11, 'Male', 18);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Jose Denesik', 26, 'Female', 18);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Guadalupe OHara', 9, 'Female', 20);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Sheridan Jacobson Sr.', 6, 'Female', 20);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Bennett Jakubowski', 69, 'Female', 20);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Annette Stamm', 76, 'Male', 20);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dr. Raquel Carter', 61, 'Female', 20);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Grover Rath', 9, 'Female', 20);


INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Samanta Huels', 32, 'Female', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Raymundo Aufderhar', 42, 'Male', 11);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Marielle Bednar', 7, 'Female', 11);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Jo Gaylord', 61, 'Female', 17);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Hector Sanford', 54, 'Male', 17);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Roscoe Dicki III', 33, 'Male', 15);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Madilyn Ebert', 21, 'Female', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Dudley Rowe', 19, 'Male', 16);
INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Alfonzo Beatty', 41, 'Male', 11);

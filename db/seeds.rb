require 'bundler/setup'
require "pg"
require "active_record"
require "pry"

require_relative "../models/tenant"
require_relative "../models/apartment"

require_relative "../connection"


Apartment.destroy_all
Tenant.destroy_all


# -- TRUNCATE TABLE apartments CASCADE;
# -- TRUNCATE TABLE tenants CASCADE;
# --
# -- ALTER SEQUENCE apartments_id_seq RESTART WITH 1;
# -- ALTER SEQUENCE tenants_id_seq RESTART WITH 1;

#
clemenargaertine = Apartment.create(address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 19, num_beds: 3, num_baths: 2)
lemke = Apartment.create(address: "44010 Lemke Crossroad", monthly_rent: 1000, sqft: 130, num_beds: 1, num_baths: 3)
jany = Apartment.create(address: "77841 Jany Lane", monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths: 3)
ivy = Apartment.create(address: "4518 Ivy Spur", monthly_rent: 2000, sqft: 1000, num_beds: 1, num_baths: 2)
kamille = Apartment.create(address: "95287 Kamille Underpass", monthly_rent: 2800, sqft: 1400, num_beds: 1, num_baths: 3)
damien = Apartment.create(address: "6005 Damien Corners", monthly_rent: 400, sqft: 230, num_beds:4 , num_baths:1 )
koch = Apartment.create(address: "95599 Koch Stream", monthly_rent: 2400, sqft: 1900, num_beds: 2, num_baths: 4)
hal = Apartment.create(address: "40583 Hal Crossing", monthly_rent: 200, sqft: 800, num_beds: 3, num_baths: 2)
verna = Apartment.create(address: "62897 Verna Walk", monthly_rent: 2400, sqft: 700, num_beds:2 , num_baths:3 )
dibbert = Apartment.create(address: "351 Dibbert Fields", monthly_rent: 2300, sqft: 1300, num_beds: 2, num_baths: 1)
buford = Apartment.create(address: "3710 Buford Passage", monthly_rent: 500, sqft: 700, num_beds: 1, num_baths: 4)
tyree = Apartment.create(address: "64329 Tyree Creek", monthly_rent: 500, sqft: 2000, num_beds: 1, num_baths: 3)
runte = Apartment.create(address: "17297 Runte Bypass", monthly_rent: 2300, sqft: 1700, num_beds: 3, num_baths: 2)
marvin = Apartment.create(address: "0889 Marvin Radial", monthly_rent: 1100, sqft: 500, num_beds: 3, num_baths: 2)
freddy = Apartment.create(address: "2745 Freddy Vista", monthly_rent: 2800, sqft: 1400, num_beds: 4, num_baths: 4)
gutmann = Apartment.create(address: "359 Gutmann Pike", monthly_rent: 2700, sqft: 1900, num_beds: 2, num_baths: 1)
howell = Apartment.create(address: "08465 Howell Harbor", monthly_rent: 300, sqft: 1300, num_beds:3 , num_baths:1 )
borer = Apartment.create(address: "8865 Borer Viaduct", monthly_rent: 600, sqft: 600, num_beds: 1, num_baths: 4)
emard = Apartment.create(address: "7357 Emard Row", monthly_rent: , sqft: 2300, num_beds: 3, num_baths: 2)
benedict = Apartment.create(address: "175 Benedict Ridges", monthly_rent: 2600, sqft: 2100, num_beds: 3, num_baths: 3)
schinner = Apartment.create(address: "45714 Schinner Expressway", monthly_rent: 900, sqft: 2200, num_beds: 6, num_baths: 3)
leta = Apartment.create(address: "60059 Leta Roads", monthly_rent: 1100, sqft: 2500, num_beds: 3, num_baths: 4)

leta.tenants.create(name: "Maudie Mosciski", age: 90, gender: "Female")
clemenargaertine.tenants.create(name: "Kristin Wisoky", age: 23, gender: 'Female')
lemke.tenants.create(name: "Demario King", age: 71, gender: 'Male')
jany.tenants.create(name: "Kaitlin Cormier", age: 91, gender: 'Female')
ivy.tenants.create(name: "Rosalinda Champlin", age: 39, gender: 'Female')
kamille.tenants.create(name: "Valentin Keebler", age: 74, gender: 'Male')
damien.tenants.create(name: "Ms. Piggy", age: 24, gender: "Female")
koch.tenants.create(name: "Eryn Lynch", age: 12, gender: 'Female')
hal.tenants.create(name: "Tiara Conn", age: 3, gender: 'Female')
buford.tenants.create(name: "America Pollich", age: 82, gender: 'Female')
tyree.tenants.create(name: "Mylene Krajcik", age: 25, gender: 'Female')
runte.tenants.create(name: "Josh Gottlieb", age: 8, gender: 'Male')
marvin.tenants.create(name: "Sherwood Stiedemann", age: 72, gender: 'Female')
leta.tenants.create(name: "Katarina Kunde", age: 6, gender: 'Female')


# for all instances of the Tenant class and stores it in a variable of your choice
residents = Tenant.all


# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
letaResidents = leta.tenants.all

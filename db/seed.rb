require "bundler/setup"

require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all


# Creates at least 3 instances of the apartment class
sacd = Apartment.create(address: "221B Baker Street", monthly_rent: 2500, sqft: 1800, num_beds: 2, num_baths: 1) #Sir Arthur Conan Doyle - 2 tenants
pgsm = Apartment.create(address: "9000 Serenity Circle", monthly_rent: 4000, sqft: 2000, num_beds: 5, num_baths: 3) #Pretty Guardian Sailor Moon - 5 tenants
mmpr = Apartment.create(address: "241 Angel Grove Way", monthly_rent: 3000, sqft: 3000, num_beds: 6, num_baths: 5) #Mighty Morphin Power Rangers - 6 tenants

# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
sherlock = sacd.tenants.create(name: "Sherlock Holmes" , age: 42, gender: "Male" )
watson = sacd.tenants.create(name: "John Watson", age: 44, gender: "Male" )
usagi = pgsm.tenants.create(name: "Usagi Tsukino" , age: 15 , gender: "Female" )
ami = pgsm.tenants.create(name: "Ami Mizuno", age: 14, gender: "Female" )
rei = pgsm.tenants.create(name: "Rei Hino", age: 15, gender: "Female" )
makoto = pgsm.tenants.create(name: "Makoto Kino", age: 16, gender: "Female" )
minako = pgsm.tenants.create(name: "Minako Aino", age: 16, gender: "Female" )
jason = mmpr.tenants.create(name: "Jason Lee Scott", age: 19, gender: "Male")
trini = mmpr.tenants.create(name: "Trini Kwan", age: 19, gender: "Female")
zack = mmpr.tenants.create(name: "Zack Taylor", age: 18, gender: "Male" )
kimberly = mmpr.tenants.create(name: "Kimberly Ann Hart" , age: 18 , gender: "Female")
billy = mmpr.tenants.create(name: "Billy Cranston" , age: 18, gender: "Male")
tommy = mmpr.tenants.create(name: "Tommy Oliver" , age: 20, gender: "Male")
zordon = mmpr.tenants.create(name: "Zordon", age: 999, gender: "Male")

# queries for all instances of the Tenant class and stores it in a variable of your choice
all_apts = Apartment.all

# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
all_scouts = pgsm.tenants

# Updates attributes using attribute helper methods for one of the objects you've created
billy.age = 19

# Saves an object that you updated using attribute helpers to the Database
billy.save

# Updates an object using the update methods
ami.update(age: 15)

# Deletes one of the objects you've created
zordon.destroy

binding.pry
puts "Yay!"

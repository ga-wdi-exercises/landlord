require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require_relative "../models/tenant"
require_relative "../models/apartment"
require_relative "../db/connection.rb"
Apartment.destroy_all
Tenant.destroy_all

Apartment.create([
  { address: "1977 Tusken Raider Way, Mos Eisley, Tatooine", monthly_rent: 1138, sqft: 589, num_beds: 3, num_baths: 2, },
  { address: "666 Haunted Skull Boulevard, Salem, Transylvania", monthly_rent: 9001, sqft: 5000, num_beds: 12, num_baths: 5, },
  { address: "22064 Northwest Gilded Lily Place, Upper Wealthington Heights, Greater Onepercentia", monthly_rent: 5500750, sqft: 195000, num_beds: 250, num_baths: 160, }
])

Tenant.create([
  { name: "Victoria Vagrant", age: 36, gender: "Female" },
  { name: "Ben Kenobi", age: 62, gender: "Male", apartment_id: 1 },
  { name: "Darth Vader", age: 51, gender: "More Machine Now Than Man, Twisted and Evil", apartment_id: 1 },
  { name: "Frank N. Stein", age: 42, gender: "Monster", apartment_id: 2 },
  { name: "Casper", age: 118, gender: "Ghost", apartment_id: 2 },
  { name: "Count Dracula", age: 275, gender: "Vampire", apartment_id: 2 },
  { name: "Lord William Reginald Archibald Timothy Edward VonPretentious IV, Esq.", age: 55, gender: "Male", apartment_id: 3 },
  { name: "Lady Madison S. Bush-Rockefeller, Duchess of Texas & New York", age: 48, gender: "Female", apartment_id: 3 },
  { name: "Mark Zuckerberg", age: 33, gender: "Male", apartment_id: 3 }
])

list_of_deadbeats = Tenant.all
categorized = Tenant.where.not( apartment_id: nil )

housevagrant = Tenant.where( name: "Victoria Vagrant" )
openspace = Apartment.first
housevagrant.apartment = openspace
housevagrant.save

redemption = Tenant.where( name: "Darth Vader" )
redemption.update( name: "Anakin Skywalker" )

removemask = Tenant.where( name: "Anakin Skywalker")
removemask.destroy

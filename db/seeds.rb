require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apartment1= Apartment.create(address:"International Space Station #1", monthly_rent: 999999, sqft: 400, num_beds: 0, num_baths: 0)
apartment2= Apartment.create(address:"Giza Pyramid", monthly_rent: 99999, sqft: 50000, num_beds: 10, num_baths: 5)
apartment3= Apartment.create(address:"Alexandrian Library", monthly_rent: 99999, sqft: 10000, num_beds: 10, num_baths: 5)

superBestFriends1 = Tenant.create(name:"Jesus" , age:2016 , gender: 'male', apartment_id:1 )
superBestFriends2 = Tenant.create(name:"Muhammad" , age:1616 , gender:'male' , apartment_id:1 )
superBestFriends3 = Tenant.create(name:"Buddha" , age:4000 , gender:'male' , apartment_id:1 )
superBestFriends4 = Tenant.create(name:"Moses" , age:1900 , gender:'male' , apartment_id:2)
superBestFriends5 = Tenant.create(name:"Joseph Smith" , age: 452 , gender:'male' , apartment_id:2 )
superBestFriends6 = Tenant.create(name:"Krishna" , age:6000 , gender:'male' , apartment_id:2)
superBestFriends7 = Tenant.create(name:"Laozi" , age:3500 , gender:'male' , apartment_id:3 )
superBestFriends8 = Tenant.create(name:"Sea Man" , age:1000 , gender:'male' , apartment_id:3 )
superBestFriends9 = Tenant.create(name:"Chuhutlu" , age:1000 , gender:'male' , apartment_id:3 )

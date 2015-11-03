require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

Apartment.destroyall
Tenant.destroyall

Apartment.create(address: "somewhereville", 800,746,1,1)
Apartment.create(address: "somewhereville", 1000,800,2,1)
Apartment.create(address: "somewhereville", 1200,846,5,2)

Tenant.create("Tom",25,"male",2)
Tenant.create("Tim",26,"male",2)
Tenant.create("Tammy",27,"female",2)
Tenant.create("Tamika",25,"female",2)
Tenant.create("Tabetha",29,"female",2)
Tenant.create("Turner",30,"male",4)
Tenant.create("Tron",25,"male",3)
Tenant.create("Tiffany",25,"female",1)
Tenant.create("Test",28,"male",5)

clients = Tenant.all
penthouse = Tenant.where(apartment_id: 2)

penthouse.update(age: 32)
penthouse.save
penthouse.destroy

require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "connection.rb"

Apartment.destroy_all
Tenant.destroy_all

shirlington = Apartment.create(address: "3000 South Randolph Street, Arlington, VA 22206", monthly_rent: 2100, sqft: 1040, num_beds: 2, num_baths: 2)
clarendon  = Apartment.create(address: "3129 8th Street N, Arlington, VA 22201", monthly_rent: 3000, sqft: 1500, num_beds: 4, num_baths: 3)
cameo = Apartment.create(address: "5008 Cameo Terrace, Perry Hall, MD 21128", monthly_rent: 4000, sqft: 3000, num_beds: 4, num_baths: 4)
becky = cameo.tenants.create(name: "Becky Beauchamp", age: 25, gender: "Female")
carol = cameo.tenants.create(name: "Carol Beauchamp", age: 58, gender: "Female")
anna = clarendon.tenants.create(name: "Anna Boeri", age: 25, gender: "Female")
josh = clarendon.tenants.create(name: "Josh More", age: 27, gender: "Male")
emilie = clarendon.tenants.create(name: "Emilie Boeri", age: 25, gender: "Female")
annie = shirlington.tenants.create(name: "Annie Unger", age: 26, gender: "Female")
erin = Tenant.create(name: "Erin Purcell", age: 25, gender: "Female")
bryan = Tenant.create(name: "Bryan Beauchamp", age: 59, gender: "Male")
alice = Tenant.create(name: "Alice Weber", age: 60, gender: "Female")
steve = clarendon.tenants.create(name: "Steve Cooler", age: 30, gender: "Male")

all_tenants = Tenant.all
shirlington= Apartment.find_by(address: "3000 South Randolph Street, Arlington, VA 22206")
all_tenants_of_shirlington= shirlington.tenants
cameo = Apartment.find_by(address: "5008 Cameo Terrace, Perry Hall, MD 21128")
all_tenants_of_cameo = cameo.tenants
all_tenants_of_shirlington = all_tenants_of_cameo
last_apartment = Apartment.last
last_apartment.address = "450"
last_apartment.save
erin.update(name: "Emily Purcell")
last_apartment.destroy

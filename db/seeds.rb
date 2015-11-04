require "bundler/setup"

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"


Apartment.destroy_all
Tenant.destroy_all

Apartment.create(address: "19 rue Italia", monthly_rent: 400, sqft: 900, num_beds: 2, num_baths: 1)

Tenant.create(name: "Tim", age: 22, gender: "male" apartment_id: 12)

all_tenants = Tenant.all

tenants_of_rue_Italia = Apartment.find_by(address: "19 rue Italia").tenants

tenants_of_rue_Italia[0].update(name: "Timotheos of Hypatia")

tenants_of_rue_Italia[0].save

tenants_of_rue_Italia[0].destroy

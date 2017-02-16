require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "db/connection"
require "models/apartment"
require "modesl/tenants"



Tenant.destroy_all
Apartment.destroy_all

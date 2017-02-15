require-relative "db/connection.rb"
require-relative "models/apartment.rb"
require-relative "models/tenant.rb"

Tenant.destroy_all
Apartment.destroy_all

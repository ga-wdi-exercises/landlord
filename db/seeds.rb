require_relative "db/connection"
require_relative "models/apartment.rb"
require_relative "models/tenant.rb"

Tenant.destroy_all
Apartment.destroy_all

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"

Tenant.destroy_all
Apartment.destroy_all

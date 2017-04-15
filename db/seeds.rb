require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "/connection.rb"

Tenant.destroy_all
Apartment.destroy_all

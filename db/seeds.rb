require_relative 'db/connection'
require_relative 'model/apartment'
require_relative 'model/tenant'

Tenant.destroy_all
Apartment.destroy_all

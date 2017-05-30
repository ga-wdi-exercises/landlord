require_relative:db/connection.rb
require_relative:models/Apartment.erb
require_relative:models/Tenant.erb

Tenant.destroy_all
Apartment.destroy_all

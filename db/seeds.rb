require 'active_record'
require_relative 'connection'

require_relative '../models/tenant'
require_relative '../models/apartment'

Tenant.destroy_all
Apartment.destroy_all

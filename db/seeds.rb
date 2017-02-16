require 'active_record'
require_relative 'connection'

# models
require_relative '../models/tenant'
require_relative '../models/aparment'

Tenant.destroy_all
Apartment.destroy_all

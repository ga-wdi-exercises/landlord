require "active_record" # the ORM

require_relative "../models/apartment"
require_relative "../models/tenant"
require_relative "connection"


Tenant.destroy_all
Apartment.destroy_all

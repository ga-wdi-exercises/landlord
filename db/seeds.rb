require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "../models/apartment" # require the Artist class definition that we defined in the models/artist.rb file
require_relative "../models/tenant" # require the Artist class definition that we defined in the models/artist.rb file
require_relative "../db/connection"

Tenant.destroy_all
Apartment.destroy_all

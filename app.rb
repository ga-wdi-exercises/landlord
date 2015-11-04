require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment" # require the Apartments class definition that we defined in the models/apartment.rb file
require_relative "models/tenant" # require the Tenants class definition that we defined in the models/tenants.rb file
# require_relative "db/seeds"
# This will put us into a state of the pry REPL, in which we've established a connection
# with the wdi database and have defined the Apartment Class as an
# ActiveRecord::Base class.
binding.pry

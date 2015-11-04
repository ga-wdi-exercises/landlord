require "bundler/setup"

require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative"../models/tenant"

Apartment.create address ([
  {address: "123 Main Street", monthy_rent: 5000, sqft 500}
  {}
  {}
])
create = save and new

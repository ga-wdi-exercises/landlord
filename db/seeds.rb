require 'active_record'
require 'pry'

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb

Tenant.destroy_all
Apartment.destroy_all

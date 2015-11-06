require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

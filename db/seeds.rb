require 'active_record'
require 'ffaker'
require 'pg'
require_relative 'connection'
require_relative '../models/tenant.rb'
require_relative '../models/apartment.rb'




Tenant.destroy_all
Apartment.destroy_all

Apartment.create(:address => 'new_apartment1')
Apartment.create(:address => 'new_apartment2')
Apartment.create(:address => 'new_apartment3')


Tenant.create(:name => 'name1',:apartment_id => 1)
Tenant.create(:name => 'name2',:apartment_id => 1)
Tenant.create(:name => 'name3',:apartment_id => 1)
Tenant.create(:name => 'name4',:apartment_id => 1)
Tenant.create(:name => 'name5',:apartment_id => 1)
Tenant.create(:name => 'name6',:apartment_id => 1)
Tenant.create(:name => 'name7',:apartment_id => 1)
Tenant.create(:name => 'name8',:apartment_id => 1)
Tenant.create(:name => 'name9',:apartment_id => 1)

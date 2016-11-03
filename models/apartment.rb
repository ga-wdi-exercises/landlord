require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

class Apartment < ActiveRecord::Base
  has_many :tenants
end

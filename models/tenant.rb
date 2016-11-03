require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

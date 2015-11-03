class Tenant < ActiveRecord::Base
    has_many :apartments
  end

class Tenant < ActiveRecord::Base
    belong_to :apartment
  end

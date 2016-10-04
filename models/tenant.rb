class Tenant < ActiveRecord::Base
  has_one :apartment
end

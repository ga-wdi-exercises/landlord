class Tenant < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  belongs_to :apartment
end

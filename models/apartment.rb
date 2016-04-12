class Apartments < ActiveRecord::Base
  has_many :tenants
end

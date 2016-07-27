class Apartment < ActiveRecord::Base
  has_many :tenants, dependent: :destroy
end

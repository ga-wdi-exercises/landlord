class Apartment < ActiveRecord::Base

has_many :tenants
belongs_to :tenants

end

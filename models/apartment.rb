class Apartment < ActiveRecord::Base
  has_many :tenants

  def rent_as_currency
    "$#{monthly_rent}"
  end

  def to_s
    # "default" display of apartment
    "#{address} - #{rent_as_currency}"
  end
end

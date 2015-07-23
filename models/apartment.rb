class Apartment < ActiveRecord::Base
  has_many :tenants

  def image_url(width, height)
    "http://lorempixel.com/#{width}/#{height}/city/#{id}"
  end

  def rent_as_currency
    "$#{monthly_rent}"
  end

  def to_s
    # "default" display of apartment
    "#{address} - #{rent_as_currency}"
  end
end

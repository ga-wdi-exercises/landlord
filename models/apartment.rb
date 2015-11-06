class Apartment < ActiveRecord::Base
  has_many :tenants #, dependent: :destroy

  # attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths
  # attr_reader :renters # my inclination is to not make this settable b/c we have an explicit set function

  # def initialize address, monthly_rent, sqft, num_beds, num_baths, renters
  #   @address = address
  #   @monthly_rent = monthly_rent
  #   @sqft = sqft
  #   @num_beds = num_beds
  #   @num_baths = num_baths
  #   @renters = renters # array
  # end
  #
  # def add_tenant tenant
  #   @renters << tenant if renters.length < num_beds
  #   # should we reference renters and num_beds without @?
  #   # my initial thought is that the @ is only needed for setting directly
  # end

end

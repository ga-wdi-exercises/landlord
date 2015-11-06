class Tenant < ActiveRecord::Base
  belongs_to :apartment
  # attr_accessor :name, :age, :gender
  #
  # def initialize(renter_name, renter_age, renter_gender)
  #   @name = renter_name
  #   @age = renter_age
  #   @gender = renter_gender
  # end
end

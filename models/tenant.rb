class Tenant < ActiveRecord::Base
  # attr_accessor :name, :age, :gender
  # def initialize (name, age, gender)
  #   @name = name
  #   @age = age
  #   @gender = gender
  # end
  belongs_to :apartment
end

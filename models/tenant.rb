class Tenant < ActiveRecord::Base
  belongs_to :apartment
  # attr_accessor :name, :age, :gender
  # def initialize name, age, gender
  #   @name = name
  #   @gender = gender
  #   @age = age
  # end
end

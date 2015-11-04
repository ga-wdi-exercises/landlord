class Tenant < ActiveRecord::Base
belongs_to :apartment
end

# Wednesday HW is below
# class Tenant
#   attr_accessor :name, :age, :gender
#   def initialize (name, age, gender)
#     @name = name
#     @age = age
#     @gender = gender
#   end

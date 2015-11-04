class Tenant < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  belongs_to :apartment
end
#   attr_accessor :name
#   attr_accessor :age
#   attr_accessor :gender
#
#     def initialize (name, age, gender)
#       @name = name
#       @age = age
#       @gender = gender
#     end
# end
#
# homie = Tenant.new('g', 24, 'male')

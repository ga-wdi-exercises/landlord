# require 'pry'
class Tenant < ActiveRecord::Base
    belongs_to :apartment
    # attr_accessor :name, :age, :sex
    # def initialize (name, age, sex)
    #     @name = name
    #     @age = age
    #     @gender = sex
    # end
end

# binding.pry

require 'pry'

class Tenant
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

binding.pry

puts "stfu"

require 'pry'

class Tenant
  attr_accessor :name, :age, :gender
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

binding.pry

puts "tenant record complete"

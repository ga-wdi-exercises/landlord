require 'pry'

class Tenant
  attr_reader :name
  attr_reader :age
  attr_reader :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

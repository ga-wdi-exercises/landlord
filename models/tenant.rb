class Tenant
  attr_reader :name
  attr_accessor :age
  attr_reader :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

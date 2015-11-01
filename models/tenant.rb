class Tenant
  attr_accessor :name
  attr_reader :age
  attr_reader :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

end

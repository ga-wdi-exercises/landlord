class Tenant
  attr_accessor :name, :age, :gender
  def initialize name, age, gender
    @name = name
    @gender = gender
    @age = age
  end
end

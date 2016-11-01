class Tenant
  attr_accessor :id, :name, :age, :gender, :apartment_id
  def initialize(id, name, age, gender, apartment_id)
    @name = name,
    @age = age,
    @gender = gender
  end
end

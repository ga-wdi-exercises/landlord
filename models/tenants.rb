class Tenant
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def name
    @name
  end

  def age
    @age
  end

  def gender
    @gender
  end

  def who_lives_here
    puts "#{name} lives here and is #{age} years old and a #{gender}."
  end
end

renter = Tenant.new("squater", 32, "male")
renter.who_lives_here

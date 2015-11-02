class Tenant

# initialize attributes
  def initialize(name, age, gender)
    @name=name
    @age=age
    @gender=gender
  end

# getters
  def name
    @name
  end

  def age
    @age
  end

  def gender
    @gender
  end

# setters
  def name=(new_name)
    @name=new_name
  end

  def age=(new_age)
    @age=new_age
  end

  def gender=(new_gender)
    @gender=new_gender
  end
end

#testing 
# thom=Tenant.new("Thom", 48, "M")
# thom.age=50
#
# puts thom.name
# puts thom.gender
# puts thom.age

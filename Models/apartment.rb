class Apartment
attr_acessor: :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
    @tenants = []
  end

  def add_tenant(tenant)
    @tenants << tenant
  end

end

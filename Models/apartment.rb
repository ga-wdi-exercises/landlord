Class Apartment
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




Define an instance method add_tenant on the apartment class that allows you to add tenants to an existing apartment.
Do not add the tenant to the apartment if the number of tenants would exceed the number of beds

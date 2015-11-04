class Tenant
  attr_accessor :name, :age, :gender
  @@tenant
  def initialize name, age, gender
    @name = name
    @age = age
    @gender = gender
    return @@tenant
  end

  def self.tenant
    @@tenant
  end

end

=begin
alea = Tenant.new("Alea", 40, "male");

puts alea.gender
=end

class Apartment

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address=address
    @monthly_rent=monthly_rent
    @sqft=sqft
    @num_beds=num_beds
    @num_baths=num_baths
    @renters=[]
  end
  # getters
  def address
    @address
  end
  def monthly_rent
    @monthly_rent
  end
  def sqft
    @sqft
  end
  def num_beds
    @num_beds
  end
  def num_baths
    @num_baths
  end
  def renters
    @renters
  end
  # setters
  def address=(new_address)
    @address=new_address
  end
  def monthly_rent(monthly_rent)
    @monthly_rent=monthly_rent
  end
  def sqft=(sqft)
    @sqft=sqft
  end
  def num_beds=(num_beds)
    @num_beds=num_beds
  end
  def num_baths=(num_baths)
    @num_baths=num_baths
  end
  def renters=(renters)
    @renters=renters
  end
# methods
  def add_tenant()
    if renters.length < num_beds
      @renters << tenant
    else
      puts "This apartment is full."
    end
  end
end

# tests
mine=Apartment.new("123 Main", "1200", 400, 2,1,"me")

puts mine.renters

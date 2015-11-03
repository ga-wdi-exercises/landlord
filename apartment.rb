require 'pry'

class Apartment
  attr_accessor :address
  attr_accessor :monthly_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters
  attr_accessor :new_tenants

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end

  def add_tenant
    puts "How many new tenants are being added?"
    @new_tenants = gets.chomp.to_i
    if ((@num_beds - @renters) - @new_tenants < 0)
      space_left = @num_beds - @renters
      puts "Sorry, there is only space for #{space_left} more renters."
    elsif
      @renters += new_tenants
      puts "#{@new_tenants} added. There are now #{@renters} renters."
    end
  end
end

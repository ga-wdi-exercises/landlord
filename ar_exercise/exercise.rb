### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################
# binding.pry
# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
get '/landlord/:choice' do
	@apartments = Apartment.all
	@tenants = Tenant.all
	@table = params[:choice]
	if @table == ""
		erb :"artists/index"
	else
		erb :"songs/index"
	end
end


puts "*" * 50

all_tenants = Tenant.all
all_apartments = Apartment.all
all_tenants.map {|tenant| puts tenant.name + "  " + tenant.age}

puts "*" * 50

# get the first tenant in the DB
first_tenant = Tenant.find(1)
puts first_tenant.class
puts first_tenant.name + "  " + first_tenant.age

puts "*" * 50

# get all tenants older than 65
all_tenants.map do |tenant| 
	if (tenant.age.to_i > 65)
		puts tenant.name + "  " + tenant.age
	# puts first_tenant.name + "  " + first_tenant.age
	end
end

puts "*" * 50

# get all apartments whose price is greater than $2300

all_apartments.map do |apt|
	if (apt.monthly_rent > 2300)
		puts apt.address + " " + apt.monthly_rent.to_s
	end
end

puts "*" * 50


# get the apartment with the address "6005 Damien Corners"
# get all tenants in that apartment
all_apartments.find do |apt|
	if (apt.address == "2927 S. Dakota Ave NE")
		all_tenants.map do |tenant|
			if (tenant.apartment_id === apt.id)
				puts apt.address + "  " + tenant.name
			end
		end
	end
end


puts "*" * 50

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant| 
	puts tenant.id.to_s + "  " + tenant.name
end

puts "*" * 50
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments.each do |apt|
	puts apt.address + "   " + apt.monthly_rent.to_s
end

puts "*" * 50
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apt|
	puts apt.address
	all_tenants.each do |tenant|
		if (tenant.apartment_id === apt.id)
			puts "         " + tenant.name
		end
	end
end

puts "*" * 50

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

puts "create 3 new apartments"
Apartment.create do |apt|
	puts "enter apt address"
	apt.address = gets.chomp
	puts "enter monthly rent"
	apt.monthly_rent = gets.chomp.to_i
	puts "enter square feet "
	apt.sqft = gets.chomp.to_i
	puts "enter num beds "
	apt.num_beds = gets.chomp.to_i
	puts "enter num bathrooms"
	apt.num_baths = gets.chomp.to_i
end


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

require "bundler/setup"
require "pg" 
require "active_record"
require "pry" 

require_relative "db/connection" 
require_relative "models/apartment" 
require_relative "models/tenant"


puts "Do you want to add a tenant, or an apartment?"

def add_tenant
	puts "Name?"
	tenant_name = gets.chomp
	puts "Age?"
	tenant_age = gets.chomp.to_i
	puts "Gender?"
	tenant_gender = gets.chomp
	puts "Apartment ID?"
	tenant_apt = gets.chomp.to_i
	puts "OK. I'll add #{tenant_name}, a #{tenant_gender} age #{tenant_age}, to apartment #{tenant_apt}."
	# if ()
	# Tenant.create(name: "Rebecca", age: 28, gender: "Female", apartment_id: 1)
end

add_tenant

##		if (tenants.length < num_beds)
# 			tenants << tenant
# 		else
# 			puts "Application REJECTED"
# 		end

# def add_apartment
# end

# if user_input === "tenant"
# 	add_tenant
# # elsif user_input === "apartment"
# # 	add_apartment
# else
# 	puts "Sorry, I don't understand that. Please type 'tenant' or 'apartment'."
# 	change_what
# end

# binding.pry
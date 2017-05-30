require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

require "sinatra"
require "sinatra/reloader"

# summit =       {id: 1,address: "215 Grant ave.", monthly_rent: 1200, sqft: 500, num_beds: 2, num_bath: 1}
# pearl =        {id: 2,address: "616 Pearl ave.", monthly_rent: 1600, sqft: 1200, num_beds: 3, num_bath: 2}
# copper_beach = {id: 3,address: "300 Mile Ground rd.", monthly_rent: 1800, sqft: 1000, num_beds: 4, num_bath: 2}


# shmitty = {name: "Shmitty Werben-Jagerman-Jenson",age: 77,gender: "Male",apartment: summit}
# sponge =  {name: "Sponge-Bob Square-Pants",age: 26,gender: "Male",apartment: pearl}
# patrick = {name: "Patrick Star",age: 27,gender: "Male",apartment: pearl}
# sandy =   {name: "Sandy Cheeks",age: 28,gender: "Female",apartment: pearl}
# krabs =   {name: "Mr. Krabs",age: 45,gender: "Male",apartment: copper_beach}
# pk =      {name: "Pearl Krabs",age: 19,gender: "Female",apartment: copper_beach}
# squid =   {name: "Squidward",age: 34,gender: "Male",apartment: copper_beach}
# plank =   {name: "Plankton",age: 28,gender: "Male",apartment: summit}
# mm =    {name: "Mermaid Man",age: 88,gender: "Male",apartment: copper_beach}

# apts = [pearl, summit, copper_beach]
# tents = [shmitty, sponge,patrick,sandy,krabs,pk,squid,plank,mm]

get '/' do
	erb :index
end

get '/apartments' do
	@apt = Apartment.all
	erb :apt_list
end

get '/apartments/:num' do
	@apts = Apartment.all
	@apt_detail = []
	@apts.each do |apt|
		if params[:num].to_i == apt[:id]
			@apt_detail.push(apt)
		else
			next
		end
	end
	erb :apt_details
end

get '/apartments/:num/tenants' do
	@apts = Apartment.all
	@tents = Tenant.all
	@apartment = []
	@res = []
	@apts.each do |apt|
		if params[:num].to_i == apt[:id]
  			@apartment.push("#{apt[:address]}, $#{apt[:monthly_rent]}, #{apt[:sqft]}sqft, #{apt[:num_beds]} beds,#{apt[:num_baths]} baths")
  			@tents.each do |person|
	  			if apt.id == person.apartment_id
	  				@res.push("#{person[:name]}")
	  			else
	  				next
	  			end
	  		end
  		end
  	end
  		erb :apt_with_res
end

get '/apartments/new' do
	@apartments = Apartment.all
	erb :new_apt
end

get '/apartments/:num/tenants/new' do
	# post'/' do
	# end

	erb :new_res
end

post '/apartments/:num/tenants' do
	new_resident = Tenant.create(name: params[:name],age: params[:age], gender: params[:gender], apartment_id: params[:num])
	#new_resident.save
	redirect_to '/' 
end

















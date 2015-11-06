get "/apartments" do
  @apartmentsall = Apartment.all
  erb :"apartments/index"
end

get "/apartment/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/show"
end

get "/apartments/new" do
  erb :"apartments/new"
end

get "/apartments/:id/edit" do
  @id = params[:id]
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

post "/apartments" do
@address = params[:address]
@monthly_rent= params[:monthly_rent]
@sqft = params[:sqft]
@num_beds = params[:num_beds]
@num_baths = params[:num_baths]
Apartment.create(address: @address, monthly_rent: @monthly_rent, sqft: @sqft, num_baths: @num_baths, num_beds: @num_beds)
redirect "/apartments"
end

put "/apartment/:id" do


#@id = params[:id]
#@name = params[:name]
#@photo_url = params[:photo_url]
#@nationality = params[:nationality]
#to_update = apartment.find(@id)
#to_update.name = @name
#to_update.photo_url = @photo_url
#to_update.nationality= @nationality
#to_update.save
#redirect "/apartment/"+@id
end

delete "/apartment/:id" do
  Apartment.delete(params[:id])
  redirect "/apartments"
end

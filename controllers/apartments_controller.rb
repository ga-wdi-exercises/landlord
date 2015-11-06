get "/apartments" do
  apartments = Apartment.all
  @apartments = apartments
  erb :"/apartments/list_apartments"
end

get "/apartments/new" do
  apartments = Apartment.all
  @apartments = apartments
  erb :"apartments/add_apartment"
end

post "/apartments/new" do
  apartments = Apartment.all
  @address = params[:address]
  @monthly_rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @num_beds = params[:num_beds]
  @num_baths = params[:num_baths]
  new_apartment = Apartment.create(address: @address, monthly_rent: @monthly_rent, sqft: @sqft, num_beds: @num_beds, num_baths: @num_baths)
  apartments << new_apartment
  @apartments = apartments
  redirect "/apartments"
end

get "/apartments/:id" do
  @id = params[:id]
  @apartment = Apartment.find(params[:id])
  @address = @apartment.address
  @monthly_rent = @apartment.monthly_rent
  @sqft = @apartment.sqft
  @num_beds = @apartment.num_beds
  @num_baths = @apartment.num_baths
  tenants = @apartment.tenants
  @tenants = tenants
  erb :"/apartments/view_apartment"
end

delete "/apartments/:id" do
  @id = params[:id]
  deleted_apartment = Apartment.find_by(id: @id)
  deleted_apartment.destroy
  redirect "/apartments"
end

get "/apartments" do
  @all_apartments = Apartment.all
  erb :"apartments/index"
end

get "/apartments/new" do
  erb :"apartments/new"
end

get "/apartments/:id" do
  @apartments = Apartment.all
  erb :"apartments/id"
end

put "/apartments/:id" do
  @address = params[:address]
  @rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @beds = params[:num_beds]
  @baths = params[:num_baths]
  Apartment.create(address: @address, monthly_rent: @rent, sqft: @sqft, num_beds: @beds, num_baths: @baths)
  redirect "/apartments"
end

get "/apartments/:id/edit" do
  erb :"apartments/edit"
end

# put "/apartment/:id" do
#   @change_address = Apartment.find(params[:id])
#   @address = params[:address]
#   @rent = params[:monthly_rent]
#   @sqft = params[:sqft]
#   @beds = params[:nu  m_beds]
#   @baths = params[:num_baths]
#   @change_address.update(address: @address, monthly_rent: @rent, sqft: @sqft, num_beds: @beds, num_baths: @baths)

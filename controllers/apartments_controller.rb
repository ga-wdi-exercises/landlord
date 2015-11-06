get "/apartments" do
  @apartments_all = Apartment.all
  erb :"apartments/index"
end

get "/apartments/:id" do
  @apartment = Apartment.find_by(id: params[:id])
  erb :"apartments/:id"
end

post "/apartments" do
  @apartment_adress = (params[:address])
  @apartment_rent = (params[:monthly_rent])
  @apartment_sqft = (params[:sqft])
  @apartment_beds = (params[:num_beds])
  @apartment_baths = (params[:num_baths])
  @new_apartment = Apartment.create(address: @apartment_adress, monthly_rent: @apartment_rent, sqft: @apartment_sqft, num_beds: @apartment_beds, num_baths: @apartment_baths)
  erb :"apartments/new"
  redirect "/apartments"
end

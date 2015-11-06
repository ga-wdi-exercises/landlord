require "pry"

get "/apartments" do
@apartments = Apartment.all
# binding.pry
erb :"/apartments/index"
end

post "/apartments" do
  @all_apartments = Apartment.all
  @new_apartment = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  @all_apartments << @new_apartment
  redirect "/apartments"
end

get "/apartments/new" do
  erb :"/apartments/new"
end


get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = Apartment.find(params[:id]).tenants
  erb :"/apartments/apartment_template"
end

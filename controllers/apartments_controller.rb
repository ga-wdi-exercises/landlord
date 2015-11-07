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

get "/apartments/new_tenant/:id" do
  @apt = Apartment.find(params[:id])
  erb :"/apartments/new_tenant"
end

post "/apartments/:id" do
  @apt = Apartment.find(params[:id])
  @tenants = Apartment.find(params[:id]).tenants
  @new_tenants = Tenant.create(name: params[:name], age: params[:age], gender: params[:gender]);
  @tenants << @new_tenants
  redirect "/apartments/#{@apt.id}"
end

get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = Apartment.find(params[:id]).tenants
  erb :"/apartments/apartment_template"
end

get "/apartments/edit/:id" do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.update(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments/#{@apartment.id}"
end

delete "/apartments/:id" do
  Apartment.find(params[:id]).destroy
  redirect "/apartments"
end

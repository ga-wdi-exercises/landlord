require "pry"

get "/apartments" do
  @apartments = Apartment.all
  erb :apartment_index
end

get "/apartments/new" do
  erb :apartment_new
end

get "/apartments/search" do
  apartment_id = Apartment.find_by(address: params[:address]).id
  redirect "/apartments/#{apartment_id}"
end

get "/apartments/:id/tenants" do
  erb :tenants_index
end

get "/apartments/:id/edit" do
  @apartment = Apartment.find(params[:id])
  erb :apartment_edit
end

get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  erb :apartment_detail
end

post "/apartments" do
  new_apt = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments/#{new_apt.id}"
end

delete "/apartments/:id" do
  Apartment.find(params[:id]).destroy
  redirect "/apartments"
end

put "/apartments/:id" do
  apartment = Apartment.find(params[:id])
  apartment.update(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments/#{params[:id]}"
end

# Show all apartments
get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

# Add apartment
get "/apartments/new" do
  erb :"apartments/new"
end

# Post new apartment form
post '/apartments' do
  apt = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments/" + apt.id.to_s
end

# Edit apartment details
get "/apartments/:apt_id/edit" do
  @apt_details = Apartment.find(params[:apt_id])
  erb :"apartments/edit"
end

# Patch (Edit) apartment form
patch '/apartments/:apt_id' do
  apt = Apartment.find(params[:apt_id])
  apt.update(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments/" + params[:apt_id]
end

# Show apartment details by id
get "/apartments/:apt_id" do
  @apt_details = Apartment.find(params[:apt_id])
  erb :"apartments/show"
end

# Delete apartment
delete "/apartments/:apt_id" do
  Apartment.destroy(params[:apt_id])
  redirect "/apartments"
end

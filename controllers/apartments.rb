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
  @new_apt = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_beds])
  redirect "/apartments/" + @new_apt.id.to_s
end

# Edit apartment details
get "/apartments/:apt_id/edit" do
  @apartments = Apartment.all
  @apt_id = params[:apt_id].to_i
  @apt_details = Apartment.find(@apt_id)
  erb :"apartments/edit"
end

# Show apartment details by id
get "/apartments/:apt_id" do
  @apartments = Apartment.all
  @apt_id = params[:apt_id]
  @apt_details = Apartment.find(params[:apt_id])
  erb :"apartments/show"
end

# Delete apartment
delete "/apartments/:apt_id/delete" do
  Apartment.destroy(params[:apt_id])
  redirect "/apartments"
end

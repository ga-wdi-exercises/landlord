
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  @apartments = Apartment.all
  erb :"apartments/new"
end

post '/apartments' do
  @address = params[:address]
  @monthly_rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @num_beds = params[:num_beds]
  @num_baths = params[:num_baths]
  @apartment = Apartment.create(address:"#{@address}", monthly_rent: "#{@monthly_rent}", sqft: "#{@sqft}", num_beds: "#{@num_beds}", num_baths: "#{@num_baths}")
  redirect ("/apartments/#{@apartment.id}")
end

# post "/artists" do
#   @name = params[:name]
#   @photo_url = params[:photo_url]
#   @nationality = params[:nationality]
#   @artist = Artist.create(name:"#{@name}", photo_url: "#{@photo_url}", nationality: "#{@nationality}")
#   redirect("/artists/#{@artist.id}")
# end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.where(apartment_id: params[:id])
  erb :"apartments/apartment_details"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @address = params[:address]
  @monthly_rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @num_beds = params[:num_beds]
  @num_baths = params[:num_baths]
  @apartment.update(address:"#{@address}", monthly_rent: "#{@monthly_rent}", sqft: "#{@sqft}", num_beds: "#{@num_beds}", num_baths: "#{@num_baths}")
  redirect("/apartments/#{@apartment.id}")
end

delete "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments")
end

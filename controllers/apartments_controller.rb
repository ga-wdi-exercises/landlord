get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

post '/apartments/new' do
  @address = params[:address]
  @rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @beds = params[:num_beds]
  @baths = params[:num_baths]
  Apartment.create(address:"#{@address}", monthly_rent:"#{@rent}", sqft:"#{@sqft}", num_beds:"#{@beds}", num_baths:"#{@baths}")
  redirect "/apartments"
end

get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @tenants = Tenant.where(apartment_id: params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @address = params[:address]
  @rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @beds = params[:num_beds]
  @baths = params[:num_baths]
  @apartment.update(address: "#{@address}", monthly_rent:"#{@rent}", sqft:"#{@sqft}", num_beds: "#{@beds}", num_baths: "#{@baths}")
  redirect "/apartments/#{@apartment.id}"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect"/apartments"
end

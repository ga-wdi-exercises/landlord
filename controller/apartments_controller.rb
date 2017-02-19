get '/' do
  erb :home
end

get '/' do
  @address = params[:address]
  @monthly_rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @num_beds = params[:num_beds]
  @num_baths = params[:num_baths]
  erb :"apartments/index"
end

post '/apartments' do
  Apartment.create! (params[:apartment])
  redirect "/apartments"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :"apartments/show"
end

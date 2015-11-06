require 'pry'

get '/apartments' do
  @apartments_all = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

post '/apartments/new' do
  @apartment = Apartment.new(params[:address], params[:monthly_rent], params[:sqft], params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments/show/#{@apartment.id}"
end

get '/apartments/show/:id' do
  @apartment = Apartment.find_by(id: params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find_by(id: params[:id])
  erb :"apartments/edit"
end

post '/apartments/show/:id' do
  @apartment = Apartment.find_by(id: params[:id])
  @apartment.update(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: [:num_baths])
  redirect "/apartments/show/#{@apartment.id}"
end

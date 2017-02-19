get '/apartments' do
	puts "*" * 30
	@apartments_all = Apartment.all
	erb :'apartments/index'
end

get "/apartments/:id" do
	puts "*" * 30
	@apartment = Apartment.find(params[:id])
	erb :"apartments/:id"
end

get '/new' do
	puts "*" * 30
	erb :"apartments/new"
end

post '/new' do
	puts "*" * 30
	Apartment.create(address: params[:address_name], monthly_rent: params[:rent_month], sqft: params[:square_ft], num_beds: params[:bed_nos], num_baths: params[:bath_nos])
	redirect "/apartments"
end

get '/apartments' do
  @apartments =  Apartment.all
  erb :index
end

get '/apartments/:id' do
@id = params[:name]
@apartment = Apartment.find(@id)
  erb :apartment
end

get '/apartments/new' do
  erb :new
end

post '/apartments/new' do
  @address = params[:address]
    @rent = params[:monthly_rent]
    @sqft = params[:sqft]
    @num_beds = params[:num_beds]
    @num_baths = params[:num_baths]
    apartment = Apartment.new do |apartment|
    apartment.name = @name
    apartment.photo_url = @photo
    apartment.nationality = @nationality
    apartment.save
  redirect '/apartments'
end

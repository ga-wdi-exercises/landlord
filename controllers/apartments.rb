
#home page for apt
get "/apartments" do
  @apt = Apartment.all
  erb (:"apartments/index")
end

#apartments all
get '/apartments' do
  erb (:"apartments/index")
end

#create new
get '/apartments/new' do
  @apt = Apartment.create(params[:apt])

  redirect "/apartments/#{@apt.id}"
end

#show single apt
get '/apartments/:id' do
  @apt = Apartment.find(params[:id])
  erb (:"apartments/show")
end

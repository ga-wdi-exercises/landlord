get '/apartments' do
  @apts = Apartment.all
  erb :'apartments/index'
end

get '/apartments/new' do
  erb :'apartments/new'
end

post '/apartments/new' do
  @new_apt = Apartment.create(address: params[:address])
  redirect '/apartments'
end

get '/apartments/:id' do
  @apt = Apartment.find(params[:id])
  erb :'apartments/apt'
end

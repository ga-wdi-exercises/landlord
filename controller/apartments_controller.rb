get '/' do
  erb :home
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

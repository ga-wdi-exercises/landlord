get '/apartments' do
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id' do
  erb :"apartments/show"
end

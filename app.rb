require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require 'db/connection'

require 'models/apts'
require 'models/tenants'

get '/' do
  erb :"home"
end

get '/apts' do
  @apts = Apts.all
  erb :"apts/index"
end

get 'apts/new' do
  erb :"apts/new"
end

post '/apts' do
  @apts = Apts.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: param[:sqft], num_beds: params[:num_beds, num_baths: params[:num_baths]])
  redirect "apts/#{@apts.id}"
end

get '/apts/:id' do
  @apts = Apts.find(params[:id])
  erb :"apts/show"

get '/apts/:id/edit' do
  @apts = Apts.find(params[:id])
  erb(:"apts/edit")
end

get '/apts/:id/tenants/new' do
  @apts = Apts.find(params[:id])
  erb(:"tenants/new")
end

post '/apts/:id/tenants' do
  @apts = Apts.find(params[:id])
  @tenants = Tenants.create(name: params[:name], age: params[:age], gender: params[:gender], apts_id: @apts[:id])
  redirect "/apts/#{@apts.id}/tenants/#{@renters.id}"
  erb(:"renters/new")
end

get '/apts/:id/tenants' do
  @apts = Apts.find(params[:id])
  @tenants = Tenants.select{|renters| renter[:apts_id] == @apts[:id]}
  erb :"/apts/renters"
end

get '/apts/:id/tenants/:id' do
  @tenants = Tenants.find(params[:id])
  erb :"/renters/show"
end

put '/apts/:id' do
  @apts = Apts.find(params[:id])
  @apts.update(params[:apts])
  redirect("/apts/#{@apartment.id}")
end

delete '/apts/:id' do
  @apts = Apts.find(params[:id])
  @apts.destroy
  redirect("/apts")
end


























end

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"



get '/' do #Does the test pass
 "<br >
     1. List all apartments<br>
     2. List apartment details <br>
     3. Add an apartment<br>
     4. List Tenants<br>
 <form>
   Enter Menu Option:
   <input type='text' name='fmenu'><br>
</form>"
end
get "/apartments" do
  # 1. Get all the apartments
  @apartments=Apartment.all
  # 2. Render the instructs
  erb :"apartment/index"
end

get '/apartments/1' do
  Apartment.find_each do |apt|
    sprintf( ' %-10s  %-30s  $%8.2f\n',apt.id,apt.address,apt.monthly_rent)
  end # do
   puts
end

get "/apartments/new" do
  puts(" Got New Request")
  erb :"apartment/new"
end

post "/apartments" do
  @apartments = Apartment.create(params[:newapt])
  redirect "/apartments/#{@apartments.id}"
end

get "/apartments/:id" do
    @apartments= Apartment.find(params[:id])
    @address=@apartments.address
    @rent=@apartments.monthly_rent
    @sqft=@apartments.sqft
    @num_beds=@apartments.num_beds
    @num_baths=@apartments.num_baths
  erb :"apartment/show"
end
# delete Pokemon

delete '/apartments/:id' do
    @apartments= Apartment.find(params[:id])
    @apartments.destroy
  redirect("/apartments")
end

get "/tenants/:id" do
    p " Apartments",@apartments

    @apartments= Apartment.find(params[:id])
    @tenants= Tenant.where(apartment_id: params[:id])
    p "Tenants", @tenants
  erb :"tenant/show"
end

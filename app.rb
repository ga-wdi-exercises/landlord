require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require 'sinatra/reloader'

require_relative "db/connections"
require_relative "models/apartment"
require_relative "models/tenant"
# require_relative "artists_controller"

get "/" do
  erb :index;
end

get "/apartments" do
  @apartments_info=Apartment.all;
  erb :"apartments/show";
end

get "/apartments/:id" do
  @apartments_info=Apartment.find_by(id: params[:id]);
  erb :"apartments/details";
end

get "/apartments/:id/tenants" do
  @tenants_info=Tenant.find_by(apartment_id: params[:id]);
  erb :"tenants/detail"
end

# get '/apartments' do
#   @apartments=Apartment.all;
#   erb :index;
# end

 # <% @apartments.each do |apartment|%>
 #  <h6><%=apartment.address%><h6>
 #    <%end%>

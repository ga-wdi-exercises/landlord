require 'pry'
require 'pg'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"




class Menu
  def self.display
    while 1
      puts "Choose one of the following:"
      puts "1 - List of Apartments"
      puts "2 - List of Tenants"
      puts "3 - Tenants in Apartment"
      puts "4 - Quit"
      input = gets.chomp
      if input == "1"
        Apartment.all.each do |apt|
          puts apt.address
        end
        sleep(1)
      elsif input == "2"
        Tenant.all.each do |ten|
          puts ten.name
        end
        sleep(1)
      elsif input == "3"
        Apartment.all.each do |apt|
          @tenants = apt.tenants.map {|ten| ten.name}
          puts "#{@tenants.join(", ")} are in #{apt.address}"
        end
        sleep(1)
      elsif input == "4"
        puts "Goodbye"
        break
      else
        puts "Please try again"
        sleep(1)
      end
    end
  end
end


Menu.display

get "/apartments" do
  @apartments = Apartment.all
  erb :"apartment/index"
end

get "/apartments/new" do
  erb :"apartment/new"
end

post "/apartments" do
  Apartment.create(params[:apt])
  redirect "/apartments"
end

get "/apartments/tenants" do
  erb :"apartment/show"
end

get "/apartments/:id/edit" do
  @apartment = apartment.find(params[:id])
  erb :"apartment/edit"
end

put "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:pokemon])
  redirect "/apartment"
end

get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  erb :"apartment/show"
end



binding.pry
puts "done"

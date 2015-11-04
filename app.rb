require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "<hi>Hi there</hi>"
end

get '/:name' do
  "Good to see you, #{params[:name]}"
end

get '/:firstname/:lastname' do
  "Your name is #{params[:lastname]}. #{params[:firstname]} #{params[:lastname]}"
end
# hi there
# good to see you, {name}
# your name is {lastname}. {firstname}{lastname}

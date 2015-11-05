require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'hello'
end

get '/apartments' do
  @apartments = params[:apartments]
  erb :index
end

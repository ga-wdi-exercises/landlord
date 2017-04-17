<a href='/apartments'>List all apartments</a>
<a href='/apartments/[:num]'>View an apartments details</a>
<a href='/apartments/new'>Add an apartment</a>
<a href='/apartments/[:num]/tenants'>List tenants</a>


get '/apartments' do
	@apartments = apartments
	erb :apartments
end

get '/apartments/new' do
	@apartments_new = apartments_new
	erb :apartments_new
end

get '/apartments/[:num]' do
	@num = params[:num].to_i
	erb :apartments_num
end
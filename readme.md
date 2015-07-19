# The Landlord

## Prompt:
You are a landlord in need of an app that will track your apartments and tenants.

## [Part 1 - Ruby Classes](https://github.com/ga-dc/landlord-1)

## [Part 2 - Active Record](https://github.com/ga-dc/landlord-2)

## Part 3 - Sinatra Views and Templates

**Do not connect sinatra to the DB.** That's tomorrow's hw. Focus on creating the routes and views.
Hardcode some sample html for each of the views.

Create the (RESTful) routes and views for the following items:

- The homepage should list several menu options:
  * List all apartments
  * View an apartment's details
  * Add an apartment
  * Add a tenant to an apartment
- The route `GET /apartments` should list all apartments
  * If the apartment is unoccupied(no tenants) you should say something like:
    `Apt 1A is 750 sqft and has 1 bed and 1 bath. It costs $2500 a month`
  * If the apartment is occupied by a tenant, you should say something like:
    `Mikael lives in Apt 1A`
- The route `GET /apartments/new` should show a form for adding a new apartment
  * Make sure to get the appropriate input from the user when creating an apartment
- The route `GET /apartments/1` should show info about a single apartment
  * Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
- The route `GET /apartments/1/tenants` should list all tenants for 1 apartment.
- The route `GET /apartments/1/tenants/new` should show a form for adding a new tenant.
  * Make sure to get the appropriate input from the user to create your person
  * __NOTE:__ Only two people can live in an apartment due to zoning laws (at least until you get to the bonus).

## Part 4 - Connect Sinatra to the Database

In your main app.rb file, create instance variables that query the Database using active record.

In your views, replace hardcoded html with erb. For example:

```html
<% @apartments.each do |apartment| %>
  <li><%= apartment.address %></li>
<% end %>
```

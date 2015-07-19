# The Landlord

## Prompt:
You are a landlord in need of an app that will track your apartments and tenants.

## Part 1 - Creating the classes

Define classes for __Person__ and __Apartment__

A person should have the following attributes:

* name
* age
* gender

An apartment should have the following attributes:

* address (a single string including floor and unit numbers if applicable)
* monthy_rent
* sqft
* num_beds
* num_baths
* renters (the person or persons living in the apartment)

Okay, now take 20 minutes to first read-through and think about the methods & behavior outlined below.

## Part 2 - Active Record and Schema
* Create a `landlord_schema.sql` It should contain the following:
  - Persons table (with the follow attributes):
    - id
    - name
    - age
    - gender
    - apartment_id

  - Apartments table (with the follow attributes):
    - address
    - monthly_rent
    - sqft
    - num_beds
    - num_baths

* Create the landlord database and load the schema to it.

* Connect to the database with ruby

* Define AR classes /w associations for:
  - Person
  - Apartment

* Create a Seed file that (follow comments in `seed.rb`):
  - Creates at least 3 instances of the apartment class
  - Creates at least 9 instances of the Person class. At least 5 should belong to an apartment
  - queries for all instances of the Person class and stores it in a variable of your choice
  - queries for all instances of the Person class that belong to one of the Apartments you created and stories it in a variable of your choosing.
  - Updates attributes using attribute helper methods for one of the objects you've created
  - Saves an object that you updated using attribute helpers to the Database
  - Updates an object using the update methods
  - Deletes one of the objects you've created

#### bonus
- Create a commandline application that utilizes what you know about AR in order to create new apartments and people.

#### mega bonus
- extend functionality of the command line app where you, the landlord, can assign people to apartments, evict tenants, change rent and .... whatever you want!

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

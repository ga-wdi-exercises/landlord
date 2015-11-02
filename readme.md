# The Landlord

## Prompt:
You are a landlord in need of an app that will track your apartments and tenants.

## Directions
Fork/clone this repo. Look at due dates section to figure out which parts you must do by when.

## Due Dates
The due dates for this week will be the same as usual. Wednesday at 9:00 and Friday at 9:00. Both deliverables will be PR's against this repo. Note.. there's no starter code!

> After the dash is the header for the portion of this readme that is required to be accomplished. Before the dash is which classes have which portions of this assignment.

### Wednesday

- All classes - [Ruby Classes](#ruby-classes)
- All classes - [Schema & SQL](#schema--sql)
- Active Record - [Active Record](#active-record)
- Sinatra REST - [Sinatra Views and Templates](#sinatra-views-and-templates)

### Friday
Ideally, you should complete the portion you haven't completed yet before starting [Friday's Portion](#sinatra--db).

Full Crud Application for Landlord(see last subsection - Sinatra & DB). Ultimately, this application is using concepts covered across each of the subtopics.

## Ruby Classes
> Note: If you have taken the Active Record class already, be sure to do this part first, but your PR for Wednesday will only contain your Active Record model definitions.

Create a directory named models.

Define classes for Tenant and Apartment.

Create a file for each of the classes.

A tenant should have the following attributes:

- name
- age
- gender

An apartment should have the following attributes:

- address (a single string including floor and unit numbers if applicable)
- monthy_rent
- sqft
- num_beds
- num_baths
- renters (the tenant or tenants living in the apartment)

And Then...

Define an instance method add_tenant on the apartment class that allows you to add tenants to an existing apartment. Do not add the tenant to the apartment if the number of tenants would exceed the number of beds

## Schema & SQL

* Create a `schema.sql` in the `db` folder. It should contain the following:
  - Tenants table (with the following attributes):
    - id
    - name
    - age
    - gender
    - apartment_id

  - Apartments table (with the following attributes):
    - id
    - address
    - monthly_rent
    - sqft
    - num_beds
    - num_baths

* Load the seed file (`db/seeds.sql`)
* read the comments in `query_exercises.sql` file in the `db` folder. For each one, write a working query to perform the requested action

> Note: If at any point you need a new clean set of data, run the following commands (replacing `database_name` and `name_of_file.sql` with the actual names of the database and files you're using).

```bash
$ dropdb database_name
$ createdb database_name
$ psql -d database_name < name_of_schema_file.sql
$ psql -d database_name < name_of_seed_file.sql
```

## Active Record

* Create the landlord database and load the schema(you created this in the schema portion) to it.

* Connect to the database with ruby

* Define AR classes /w associations in the `models` folder for:
  - Tenant
  - Apartment

* Create a `seeds.rb` file in the `db` directory that:
  - Creates at least 3 instances of the apartment class
  - Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
  - queries for all instances of the Tenant class and stores it in a variable of your choice
  - queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
  - Updates attributes using attribute helper methods for one of the objects you've created
  - Saves an object that you updated using attribute helpers to the Database
  - Updates an object using the update methods
  - Deletes one of the objects you've created

### bonus
- Create a commandline application that utilizes what you know about AR in order to create new apartments and people.

### mega bonus
- extend functionality of the command line app where you, the landlord, can assign people to apartments, evict tenants, change rent and .... whatever you want!


## Sinatra Views and Templates

**Do not connect sinatra to the DB.** That's friday's hw. Focus on creating the routes and views.
Hardcode some sample html for each of the views.

Create the (RESTful) routes and views for the following items:

- The homepage should list several menu options:
  * List all apartments (a link to `GET /apartments`)
  * View an apartment's details(a link to `GET /apartments/1`)
  * Add an apartment(a link to `GET /apartments/new`)
  * List tenants (a link to `GET /apartments/1/tenants`)
- The route `GET /apartments` should list all apartments
  * these apartments will just be hardcoded in your `app.rb` or in your `erb` file.
- The route `GET /apartments/new` should show a form for adding a new apartment
  * Make sure to get the appropriate input from the user when creating an apartment as per schema
- The route `GET /apartments/1` should show info about a single apartment
  * Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
- The route `GET /apartments/1/tenants` should list all tenants for 1 apartment.
- The route `GET /apartments/1/tenants/new` should show a form for adding a new tenant.
  * Make sure to get the appropriate input from the user to create your person as per schema

## Sinatra & DB
Example of using instance variables:

  In your main `app.rb` file, create instance variables that query the Database using active record.

  In your views, replace hardcoded html with erb. For example:

  ```html
  <% @apartments.each do |apartment| %>
    <li><%= apartment.address %></li>
  <% end %>
  ```

> This will be a full single model CRUD application that connects to a database backend

You should have the following in your application:
- Have an index route for apartments
  - should list all of the apartments
  - each apartment should link to its own show page
  - it should have a link to create a new apartment
- have a show route for each apartment specified by the params value in the URL.
  - it should list its address, montly rent, square feet, number of bedrooms and number of bathrooms
  - it should have a link to delete the apartment
  - it should have a link to edit the apartment
  - it should show all tenants living in the apartment
- have a new route for apartments
  - this will contain the form to create new apartments
  - when this form is submitted it will send a `POST` request to the create route(below) in your database.
- have a create route for apartments
  - when there's a `POST` request to this route, it will create an apartment in your database
  - upon creation it will redirect to the created apartment's show route.
- have an edit route for a single apartment
  - this will contain the form to edit an existing apartment
  - when this form is submitted it will send a `PUT` request to and update route(below) in your database
- have an update route for a single apartment specified by the params value in the URL.
  - when there's a `PUT` request to this route, it will update an apartment in the database
  - after updating it should redirect to the updated apartments show route
- have a delete route for a single apartment specified by the params value in the URL.
  - when there's a `DELETE` request to this route, it will delete the apartment specified.

### BONUS
- implement CRUD functionality for tenants
- introduce a 3rd model
- introduce a 4th model ...

### megabonus
- incorporate user authentication

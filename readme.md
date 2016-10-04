# The Landlord

## Prompt:
You are a landlord in need of an app that will track your apartments and tenants.

## Directions
Fork/clone this repo. Look at due dates section to figure out which parts are due when.

## Breakdown

This exercises is broken down into parts with the idea that you should be able to complete
a section corresponding to the appropriate class.

- SQL + Active Record
  - [Schema & SQL](#schema--sql)
  - [Active Record](#active-record)
- Sinatra Intro
  - [Sinatra Views and Templates](#sinatra-views-and-templates)
- Sinatra w/ Active Record
  - [Sinatra Active Record](#sinatra--active-record).

Ideally, you should complete the portion you haven't completed yet before starting
the next one.

## Schema & SQL

### Create a schema file

Create a `schema.sql` in the `db` folder. It should contain the following:

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

### Create your Database and Load the Schema File

1. Create your database
  - `$ createdb landlord`
2. Load the schema file
  - `$ psql -d landlord < db/schema.sql`
3. Load the seed file
  - `$ psql -d landlord < db/seeds.sql`


> Note: If at any point you need a new clean set of data, run the following commands (replacing `database_name` and `name_of_file.sql` with the actual names of the database and files you're using).

```bash
$ dropdb database_name
$ createdb database_name
$ psql -d database_name < name_of_schema_file.sql
$ psql -d database_name < name_of_seed_file.sql
```

![Commit!](http://vignette1.wikia.nocookie.net/uncyclopedia/images/5/5a/Checkmark.png/revision/latest/scale-to-width-down/50?cb=20110702210942)
Make a commit before you move on!

## Active Record Exercises

### Complete the AR Exercises

Look in the `ar_exercises` folder. Update the `exercise.rb` file to solve each
challenge.

![Commit!](http://vignette1.wikia.nocookie.net/uncyclopedia/images/5/5a/Checkmark.png/revision/latest/scale-to-width-down/50?cb=20110702210942)

Make a commit before you move on!

### Command Line Landlord Manager (Using ActiveRecord)

We're going to recreate our command line app, only this time we'll use ActiveRecord
to store / read our data (instead of hashes and/or plain ruby objects like we did before).

#### Step 0 - Create a Gemfile

Create a `Gemfile` in the root of your project directory.

> Can be done with `$ bundler init`

Decide which gems to include, add those to your gemfile, then run `$ bundle install` to install those gems locally.

> **Hint**: You might need to install more gems, as this application grows, make sure to run a `$ bundle install` after each new gem you add

#### Step 1 - Define Your Models

Create a `models` folder. Inside that, you should create models for Apartment
and Tenant. Ensure you set up the correct `has_many` / `belongs_to` associations.

> **Hint**: you can look at the top of `exercise.rb` for code for each model.

#### Step 2 - Create a Connection File

Create a `db/connection.rb` file. See the [AR Lesson](https://github.com/ga-wdi-lessons/activerecord-intro#functionality---wdi-i-do---20--105) for an example of what should be in it. Hint: Make sure you update the name of the DB it's connecting to.

I like to put the following lines at the top of my `connection.rb` file, that
way, I can just load this file elsewhere and it ensures ActiveRecord is loaded:

```ruby
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
```

**VERIFY:** Run the provided `console.rb` and ensure you can run commands like those
below without any errors

```ruby
the_bat_cave = Apartment.create(address: "123 Main St", monthly_rent: 2000, sqft: 600, num_beds: 2, num_baths: 1)
me = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment: the_bat_cave)
```

#### Step 3 - Create a Seeds File

Create a `db/seeds.rb` file.

At the very top, ensure your seed file loads the necessary files using `require_relative`:
* the connection file `db/connection`
* the 2 model files

Below that, add these two lines, to ensure running the seed script clears your DB first.
```ruby
Tenant.destroy_all
Apartment.destroy_all
```

Lastly, copy the code you wrote in `exercise.rb` that *JUST* creates ~9 tenants and ~3 apartments.

Then, run your seed file from the command line: `ruby db/seeds.rb`

**Verify**: Go look at the provided `console.rb`. See the commented out lines?
Uncomment them and re-run `console.rb`. It should run without error and provide
the expected output (in terms of the numbers of apartments and tenants.)

![Commit!](http://vignette1.wikia.nocookie.net/uncyclopedia/images/5/5a/Checkmark.png/revision/latest/scale-to-width-down/50?cb=20110702210942)

Make a commit before you move on!

#### Step 4 - Build out the CLI Interface

Build out a simple command line interface that provides a menu prompt and allows
the user to:

1. See a list of all apartments (include ID#, address, and monthly rent)
2. See a list of all tenants (include name and age)
3. See a list of all apartments and their associated tenants (just address and name)

![Commit!](http://vignette1.wikia.nocookie.net/uncyclopedia/images/5/5a/Checkmark.png/revision/latest/scale-to-width-down/50?cb=20110702210942)
Make a commit before you move on!


#### Bonus

- extend functionality of the command line app where you, the landlord, can assign people to apartments, evict tenants, change rent and .... whatever you want!

## Sinatra Views and Templates

> **At first, don't connect Sinatra to the DB.** Focus on creating the routes and views. Hardcode some sample HTML for each of the views.

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

## Sinatra & Active Record

> **Now connect Sinatra to Active Record** so that the user gets the appropriate data for the corresponding route.

You should complete as many of the following routes (aka features) as you can:

- Have an index route for apartments (`GET /apartments`)
  - should list all of the apartments
  - each apartment should link to its own show page
  - it should have a link to create a new apartment
- Have a show route for each apartment specified by the params value in the URL. (e.g. `GET /apartments/17`)
  - it should list its address, monthly rent, square feet, number of bedrooms and number of bathrooms
  - it should have a link to delete the apartment
  - it should have a link to edit the apartment
  - it should show all tenants living in the apartment
- Have a new route for apartments (`GET /apartments/new`)
  - this will contain the form to create new apartments
  - when this form is submitted it will send a `POST` request to the create route(below) in your database.
- Have a create route for apartments (`POST /apartments`)
  - when there's a `POST` request to this route, it will create an apartment in your database
  - upon creation it will redirect to the created apartment's show route.
- Have an edit route for a single apartment (e.g. `GET /apartments/15/edit`)
  - this will contain the form to edit an existing apartment
  - when this form is submitted it will send a `PUT` request to and update route(below) in your database
- Have an update route for a single apartment specified by the params value in the URL. (e.g. `PUT /apartments/9`)
  - when there's a `PUT` request to this route, it will update an apartment in the database
  - after updating it should redirect to the updated apartments show route
- Have a delete route for a single apartment specified by the params value in the URL. (e.g. `DELETE /apartments/4`)
  - when there's a `DELETE` request to this route, it will delete the apartment specified.

### BONUS

Choose one or more of the following features:

- Implement CRUD functionality for tenants
- Implement a form on the apartment show page, which allows you to add an existing tenant to an apartment
  - The form should have a dropdown which lets you select an existing tenant by name
  - **HINT**: You probably want a new route in your `app.rb` just for handling submissions of this form
  - **HINT**: It should probably use a PUT verb since you're updating a tenant's `apartment_id` property

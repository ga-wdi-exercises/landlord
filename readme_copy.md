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

#### CLI Bonus

  - extend functionality of the command line app where you, the landlord, can assign people to apartments, evict tenants, change rent and .... whatever you want!

### BONUS

Choose one or more of the following features:

- Implement CRUD functionality for tenants
- Implement a form on the apartment show page, which allows you to add an existing tenant to an apartment
  - The form should have a dropdown which lets you select an existing tenant by name
  - **HINT**: You probably want a new route in your `app.rb` just for handling submissions of this form
  - **HINT**: It should probably use a PUT verb since you're updating a tenant's `apartment_id` property

  ```bash
  $ dropdb database_name
  $ createdb database_name
  $ psql -d database_name < name_of_schema_file.sql
  $ psql -d database_name < name_of_seed_file.sql
  ```

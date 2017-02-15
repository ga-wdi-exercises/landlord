- The homepage should list several menu options:
  * List all apartments (a link to `GET /apartments`)
  * View an apartment's details(a link to `GET /apartments/1`)
  * Add an apartment(a link to `GET /apartments/new`)
  * List tenants (a link to `GET /apartments/1/tenants`)

The route `GET /apartments/1/tenants` should list all tenants for 1 apartment.

The route `GET /apartments/1/tenants/new` should show a form for adding a new tenant.

### BONUS

Choose one or more of the following features:

- Implement CRUD functionality for tenants
- Implement a form on the apartment show page, which allows you to add an existing tenant to an apartment
  - The form should have a dropdown which lets you select an existing tenant by name
  - **HINT**: You probably want a new route in your `app.rb` just for handling submissions of this form
  - **HINT**: It should probably use a PUT verb since you're updating a tenant's `apartment_id` property

#### CLI Bonus

    - extend functionality of the command line app where you, the landlord, can assign people to apartments, evict tenants, change rent and .... whatever you want!

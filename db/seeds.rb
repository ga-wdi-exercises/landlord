

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "/connection.rb"


At the very top, ensure your seed file loads the necessary files using `require_relative`:
* the connection file `db/connection`
* the 2 model files

Below that, add these two lines, to ensure running the seed script clears your DB first.
```ruby
Tenant.destroy_all
Apartment.destroy_all
```

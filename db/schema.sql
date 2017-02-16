DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age Int,
  gender TEXT,
  apartment_id Int
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent Int,
  sqft Int,
  num_beds Int,
  num_baths Int
);

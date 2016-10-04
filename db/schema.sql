DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name TEXT,
  age INT,
  gender TEXT,
  apartment_id INT,
);

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address TEXT,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT,
);

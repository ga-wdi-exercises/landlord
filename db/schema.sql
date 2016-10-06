DROP TABLE IF EXISTS tenants;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  apartment_id INTEGER

);
DROP TABLE IF EXISTS apartments;

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address VARCHAR(50),
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

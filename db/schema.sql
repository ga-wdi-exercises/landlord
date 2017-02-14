DROP TABLE IF EXISTS tenants         CASCADE;
DROP TABLE IF EXISTS apartments      CASCADE;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  apartment_id INTEGER
);

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

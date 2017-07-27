DROP TABLE IF EXISTS apartments;
DROP TABLE IF EXISTS tenants;

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INTEGER,
  gender TEXT,
  apartment_id INTEGER
);

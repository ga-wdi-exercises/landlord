DROP TABLE IF EXISTS apartments CASCADE;
DROP TABLE IF EXISTS tenants  CASCADE;

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);
CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  apartment_id INTEGER
);

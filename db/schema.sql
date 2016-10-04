CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age VARCHAR,
  gender VARCHAR NOT NULL,
  apartment_id INTEGER
);
CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

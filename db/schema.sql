CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age TEXT,
  gender TEXT,
  apartment_id INTEGER
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

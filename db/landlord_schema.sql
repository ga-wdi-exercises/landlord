DROP TABLE IF EXISTS apartments;
DROP TABLE IF EXISTS tenants;

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent TEXT,
  sqft TEXT,
  num_beds TEXT,
  num_baths TEXT
);

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age TEXT,
  gender TEXT,
  apartment_id TEXT
);

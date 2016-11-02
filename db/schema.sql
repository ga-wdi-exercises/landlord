DROP TABLE IF EXISTS tenant;
DROP TABLE IF EXISTS apartment;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age TEXT,
  gender TEXT,
  apartment_id TEXT
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  monthly_rent TEXT,
  sqft TEXT,
  num_beds TEXT,
  num_baths TEXT
);

DROP TABLE IF EXISTS Tenants;
DROP TABLE IF EXISTS Apartments;

CREATE TABLE Tenants(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INTEGER,
  gender VARCHAR,
  apartment_id INTEGER
);

CREATE TABLE Apartments(
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

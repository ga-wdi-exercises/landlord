DROP TABLE IF EXISTS tenants, apartments;

CREATE TABLE players (
  id serial PRIMARY KEY,
  name TEXT,
  age INTEGER,
  gender TEXT,
  apartment_id INTEGER

);

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address TEXT,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_beds INTEGER
);

DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  gender TEXT,
  apartment_id INTEGER
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

-- database name is landlord

--drop and reload tables
-- psql -d landlord < landlord_schema.sql

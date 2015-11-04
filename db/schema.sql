-- Tenants table (with the following attributes):
-- id
-- name
-- age
-- gender
-- apartment_id
--
-- Apartments table (with the following attributes):
-- id
-- address
-- monthly_rent
-- sqft
-- num_beds
-- num_baths

CREATE TABLE tenants (
  tenants_id_seq SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT,
  gender VARCHAR,
  apartment_id INT NOT NULL
);

CREATE TABLE apartments (
  apartments_id_seq SERIAL PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

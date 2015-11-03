-- * Create a `schema.sql` in the `db` folder. It should contain the following:
--   - Tenants table (with the following attributes):
--     - id
--     - name
--     - age
--     - gender
--     - apartment_id

--   - Apartments table (with the following attributes):
--     - id
--     - address
--     - monthly_rent
--     - sqft
--     - num_beds
--     - num_baths

DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INT, 
    gender VARCHAR,
    apartment_id INT
);

CREATE TABLE apartments (
    id SERIAL PRIMARY KEY,
    address TEXT,
    monthly_rent INT,
    sqft INT,
    num_beds INT,
    num_baths INT
);
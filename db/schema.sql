-- Create a `schema.sql` in the `db` folder. It should contain the following:
--
DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

-- - Tenants table (with the following attributes):
--   - id
--   - name
--   - age
--   - gender
--   - apartment_id
--  the SERIAL PRIMARY KEY gets automatically assigned when .save is done
CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  gender TEXT,
  apartment_id INT
);

-- - Apartments table (with the following attributes):
--   - id
--   - address
--   - monthly_rent
--   - sqft
--   - num_beds
--   - num_baths
CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

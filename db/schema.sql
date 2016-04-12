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
-- 
-- Note: If at any point you need a new clean set of data, run the following commands (replacing database_name and name_of_file.sql with the actual names of the database and files you're using).
-- $ dropdb database_name
-- $ createdb database_name
-- $ psql -d database_name < name_of_schema_file.sql
-- $ psql -d database_name < name_of_seed_file.sql

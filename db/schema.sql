DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  gender TEXT,
  apartment_id INT
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

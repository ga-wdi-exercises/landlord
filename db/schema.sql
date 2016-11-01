DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS trainers;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age TEXT,
  gender TEXT,
  apartment_id INT
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

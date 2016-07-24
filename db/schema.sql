DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  age INTEGER,
  gender VARCHAR(8),
  apartment_id INTEGER
);

CREATE TABLE apartments
(
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

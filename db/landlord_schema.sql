DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  gender VARCHAR,
  apartment_id INT
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

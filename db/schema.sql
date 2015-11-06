DROP TABLE if exists Tenants;
DROP TABLE if exists Apartments;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  gender TEXT,
  apartment_id INT


);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths VARCHAR

);

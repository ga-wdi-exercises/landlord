DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE  tenants(
  id PRIMARY KEY,
  name VARCHAR,
  age INT,
  gender VARCHAR,
  apartment_id INT
);
CREATE TABLE  apartments(
  id PRIMARY KEY,
  address VARCHAR,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

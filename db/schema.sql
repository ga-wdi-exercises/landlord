DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL,
  gender VARCHAR NOT NULL,
  apartment_id INT NOT NULL
);
CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent VARCHAR NOT NULL,
  sqft INT NOT NULL,
  num_beds INT NOT NULL,
  num_baths INT NOT NULL
);

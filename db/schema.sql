DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT,
  gender VARCHAR,
  apartment_id INT NOT NULL UNIQUE
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent INT NOT NULL,
  sqft INT,
  num_beds INT,
  num_baths INT
);

-- select * from tenants fill outer join apartments on tenants.apartment_id = apartments.id;

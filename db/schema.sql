DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address varchar(50),
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name varchar(50),
  age INT,
  gender varchar(50),
  apartment_id INT REFERENCES apartments(id)
);

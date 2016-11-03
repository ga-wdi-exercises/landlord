DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

create table tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  gender VARCHAR,
  apartment_id INT
);

create table apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

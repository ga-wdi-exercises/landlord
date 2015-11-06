DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  tenants_id_seq SERIAL NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  age INT,
  gender TEXT,
  apartment_id INT NOT NULL
);

CREATE TABLE apartments (
  apartments_id_seq SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

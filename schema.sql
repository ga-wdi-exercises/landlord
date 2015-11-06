DROP TABLE Apartments IF EXISTS;
DROP TABLE Tenants IF EXISTS;

CREATE TABLE Apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
)

CREATE TABLE Tenants (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  gender TEXT,
  apartment_id INT
)

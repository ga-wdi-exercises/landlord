/*- Tenants table (with the following attributes):
  - id
  - name
  - age
  - gender
  - apartment_id
*/

DROP TABLE IF EXISTS tenants;

CREATE TABLE tenants(
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  age integer NOT NULL,
  gender varchar(10) NOT NULL,
  apartment_id integer NOT NULL
);

DROP TABLE IF EXISTS apartments;

CREATE TABLE apartments(
  id serial PRIMARY KEY,
  address varchar(50) NOT NULL,
  monthly_rent decimal(12,2) NOT NULL,
  sqft integer  NOT NUlL,
  num_beds integer NOT NULL,
  num_baths integer NOT NULL
);


/*
- Apartments table (with the following attributes):
  - id
  - address
  - monthly_rent
  - sqft
  - num_beds
  - num_baths

  address, monthly_rent, sqft, num_beds, num_baths
*/

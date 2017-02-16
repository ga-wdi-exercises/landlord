DROP TABLE IF EXISTS apartments, tenants;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  age integer NOT NULL,
  gender varchar,
  apartment_id integer 
);

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address varchar NOT NULL,
  monthly_rent integer NOT NULL,
  sqft integer,
  num_beds integer,
  num_baths integer
);

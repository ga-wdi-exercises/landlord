DROP TABLE IF EXISTS tenants;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  age integer NOT NULL,
  gender varchar NOT NULL,
  apartment_id integer NOT NULL
);

DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  address varchar(50) NOT NULL,
  monthly_rent integer NOT NULL,
  sqft integer NOT NULL,
  num_beds integer NOT NULL,
  num_baths integer NOT NULL,
);

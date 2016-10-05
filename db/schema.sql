DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address varchar(50) NOT NULL,
  monthly_rent integer NOT NULL,
  sqft integer,
  num_beds integer,
  num_baths integer
);
CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  age integer NOT NULL,
  gender varchar(50),
  apartment_id integer
);

DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name text,
  age integer,
  gender text,
  apartment_id integer
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address text,
  monthly_rent integer,
  sqft integer,
  num_beds integer,
  num_baths integer
);

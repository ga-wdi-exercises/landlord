DROP TABLE IF EXISTS tenants         CASCADE;
DROP TABLE IF EXISTS apartments      CASCADE;

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name VARCHAR,
  age integar NOT NULL,
  gender VARCHAR,
  apartment_id integar NOT NULL
);

CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent integar NOT NULL,
  sqft INTEGAR,
  num_beds INTGEGAR,
  num_baths INTEGAR
);

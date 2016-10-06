CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address varchar(255),
  monthly_rent integer,
  sqft integer,
  num_beds integer,
  num_baths integer
);

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name varchar(255),
  age integer,
  gender varchar(10),
  apartment_id integer
);

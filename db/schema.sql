

CREATE TABLE tenants (
  id serial PRIMARY KEY,
  name varchar(50),
  age integer,
  gender varchar,
  apartment_id integer
);


CREATE TABLE apartments (
  id serial PRIMARY KEY,
  address varchar(50),
  monthly_rent integer,
  sqft integer,
  num_beds integer,
  num_baths integer
);

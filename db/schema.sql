DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;


CREATE TABLE Apartments (
  id serial PRIMARY KEY,
  address varchar NOT NULL,
  monthly_rent integer NOT NULL,
  sqft integer NOT NULL,
  num_beds integer NOT NULL,
  num_baths integer NOT NULL
  );

  CREATE TABLE Tenants (
    id serial PRIMARY KEY,
    name varchar NOT NULL,
    age integer NOT NULL,
    gender varchar NOT NULL,
    apartment_id integer NOT NULL
    );

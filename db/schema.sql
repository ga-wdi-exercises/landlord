DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

create table tenants (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    apartment_id VARCHAR
  );

create table apartments (
    id SERIAL PRIMARY KEY,
    address VARCHAR,
    monthly_rent INTEGER,
    sqft INTEGER,
    num_beds INTEGER,
    num_baths INTEGER
  );


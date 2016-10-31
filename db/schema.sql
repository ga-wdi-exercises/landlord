DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

create table tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age VARCHAR,
  gender VARCHAR,
  apartment_id INTEGER
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

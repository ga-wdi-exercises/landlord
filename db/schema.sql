DROP TABLE IF EXISTS tenants            CASCADE;
DROP TABLE IF EXISTS apartments            CASCADE;

create table tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  apartment_id INTEGER
);

create table apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

DROP TABLE IF EXISTS tenants           CASCADE;
DROP TABLE IF EXISTS apartments           CASCADE;

create table apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);
create table tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  gender VARCHAR(225),
  apartment_id INTEGER REFERENCES apartments(id)
);

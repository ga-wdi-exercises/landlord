DROP TABLE IF EXISTS apartments;
DROP TABLE IF EXISTS tenants;

CREATE TABLE apartments (
 id SERIAL PRIMARY KEY,
 address VARCHAR(512),
 monthly_rent INTEGER,
 sqft INTEGER,
 num_beds INTEGER,
 num_baths INTEGER
);

 CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(256),
  age INTEGER,
  gender VARCHAR(256),
  apartment_id INTEGER
);

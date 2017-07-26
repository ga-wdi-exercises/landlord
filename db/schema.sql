DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;


CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  gender TEXT,
  apartment_id INTEGER REFERENCES apartments(id)
);

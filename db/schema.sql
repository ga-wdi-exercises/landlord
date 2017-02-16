DROP TABLE IF EXISTS tenants CASCADE;
DROP TABLE IF EXISTS apartmetns CASCADE;



CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  monthly_rent INTEGER,
  sqft INTEGER,
  num_beds INTEGER,
  num_baths INTEGER
);


CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  gender VARCHAR(15),
  apartment_id INTEGER REFERENCES apartments(id)
);

DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apts;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INTEGER NOT NULL,
  gender VARCHAR,
  apartment_id INTEGER
);

CREATE TABLE apts (
  id SERIAL PRIMARY KEY,
  address VARCHAR NOT NULL,
  monthly_rent INTEGER NOT NULL,
  sqft VARCHAR,
  num_beds INTEGER
  num_baths INTEGER
);

DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS songs;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INT,
  gender TEXT NOT NULL,
  apartment_id INT
);

CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  monthly_rent INT,
  sqft INT,
  num_bed INT,
  num_baths INT
);

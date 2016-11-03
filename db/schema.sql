DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;


CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INT,
  gender TEXT NOT NULL,
  apartment_id INT
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  monthly_rent INT,
  sqft TEXT,
  num_beds INT,
  num_baths INT
);

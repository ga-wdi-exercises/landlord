
CREATE TABLE tenant (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT,
  gender VARCHAR,
  apartment_id INT
);

CREATE TABLE apartment (
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL UNIQUE,
  monthly_rent INT NOT NULL,
  sqft INT,
  num_beds INT,
  num_baths INT
);

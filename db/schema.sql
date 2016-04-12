DROP TABLE IF EXISTS apartments;
DROP TABLE IF EXISTS tenants;

-- apartments (address, monthly_rent, sqft, num_beds, num_baths)
CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);


-- tenants (name, age, gender, apartment_id)
CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INT,
  gender TEXT,
  apartment_id INT
);

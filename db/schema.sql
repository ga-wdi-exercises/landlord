# Drop Table rules
DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

# Table for tenants with attributes
CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age TEXT NOT NULL,
  gender TEXT NOT NULL,
  apartment_id INT
);

# Table for apartments with attrubtues
CREATE TABLE apartments (
  id SERIAL PRIMARY KEY,
  address TEXT NOT NULL,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT
);

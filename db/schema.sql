DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age VARCHAR(255),
  gender VARCHAR(255),
  apartment_id VARCHAR(255)
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  monthly_rent VARCHAR(255),
  sqft VARCHAR(255),
  num_beds VARCHAR(255),
  num_baths VARCHAR(255)
);

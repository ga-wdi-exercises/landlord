DROP TABLE IF EXISTS apartments;
DROP TABLE IF EXISTS tenants;

CREATE TABLE apartments (
id SERIAL PRIMARY KEY,
address INT,
sqft INT,
monthly_rent INT,
num_beds INT,
num_baths INT
);

CREATE TABLE tenants (
id SERIAL PRIMARY KEY,
name TEXT,
age INT,
gender TEXT,
apartment_id INT
);

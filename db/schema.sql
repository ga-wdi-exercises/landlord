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
name VARCHAR NOT NULL,
age INTEGER,
gender VARCHAR,
apartment_id INTEGER
);

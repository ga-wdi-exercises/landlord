DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;



CREATE TABLE tenants(
id SERIAL PRIMARY KEY,
name VARCHAR NOT NULL,
age int,
gender VARCHAR,
apartment_id int
);


CREATE TABLE apartments(

id SERIAL PRIMARY KEY,
address VARCHAR NOT NULL,
monthly_rent int,
sqft int,
num_beds int,
num_baths int

);

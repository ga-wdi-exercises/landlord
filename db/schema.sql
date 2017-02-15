DROP TABLE IF EXISTS Tenants;
DROP TABLE IF EXISTS Apartment;



CREATE TABLE Tenants(
id SERIAL PRIMARY KEY,
name VARCHAR NOT NULL,
age int,
gender VARCHAR,
apartment_id int
);


CREATE TABLE Apartment(

id SERIAL PRIMARY KEY,
address VARCHAR NOT NULL,
monthly_rent int,
sqft int,
num_beds int,
num_baths int

);

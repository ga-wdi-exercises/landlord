DROP TABLE IF EXISTS Tenants;
DROP TABLE IF EXISTS Apartments;

CREATE TABLE Tenants (
 id SERIAL PRIMARY KEY,
 name TEXT NOT NULL,
 age INT NOT NULL,
 gender TEXT,
 apartment_id INT NOT NULL
);

CREATE TABLE Apartments (
 id SERIAL PRIMARY KEY,
 address TEXT NOT NULL,
 monthly_rent INT NOT NULL,
 sqft TEXT NOT NULL,
 num_beds INT,
 num_baths INT
);

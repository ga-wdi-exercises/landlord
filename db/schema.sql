DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants (
    id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    age integer NOT NULL,
    gender varchar NOT NULL,
    apartment_id integer NOT NULL
);

CREATE TABLE apartments (
    id serial PRIMARY KEY,
    address varchar(100) NOT NULL,
    monthly_rent int NOT NULL,
    sqft int NOT NULL,
    num_beds int NOT NULL,
    num_baths int NOT NULL
);
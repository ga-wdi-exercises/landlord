-- ##################################
-- 201702151239L   EL MIERCOLES   JAY
-- ##################################

DROP TABLE IF EXISTS apartments           CASCADE;
DROP TABLE IF EXISTS tenants              CASCADE;
-- -- create table pokemons (   --ACTIVERECORD LOOKS FOR TABLENAME THAT IS A PLURAL OF CLASSNAME OR SOMETHING OR OTHER THING-Y --   id SERIAL PRIMARY KEY, --   name VARCHAR(255), --   cp INTEGER, --   poke_type VARCHAR(255), --   img_url VARCHAR(255) -- );

-- Apartments table (with the following attributes):
create table apartments (
id SERIAL PRIMARY KEY,
address VARCHAR(255),
monthly_rent INTEGER,
sqft INTEGER,
num_beds INTEGER,
num_baths INTEGER
);

-- Tenants table (with the following attributes):
create table tenants (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
age INTEGER,
gender VARCHAR(255),
apartment_id INTEGER
);

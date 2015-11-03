-- Retrieve all info on all tenants
SELECT * FROM tenants;
-- Retrieve the name, age, and gender of all tenants
SELECT name, age, gender FROM tenants;
-- Retrieve all info on all tenants older than 65
SELECT * FROM tenants WHERE age > 65;
-- Retrieve all info on all tenants in apartment with id 20
SELECT * FROM tenants WHERE id = 20;
-- Retrieve all info on all tenants in apartment with ids 20 or 15
SELECT * FROM tenants WHERE id = 20 OR id = 15;
-- Delete all tenants whose age is greater than 65
DELETE FROM tenants WHERE age > 65;
-- Create one new tenant, put them in any apartment you want
INSERT INTO tenants(name, age, gender, apartment_id) VALUES('Aurelio', 27, 'Male', 3);
-- Find just the ids for all apartments
SELECT id FROM tenants;
-- Find all info for apartments whose price is greater than $2300
SELECT * FROM apartments WHERE monthly_rent > 2300;
-- Geriatric Birthday! Update all tenants whose age is 90 to be 91
UPDATE tenants SET age = 91 WHERE age = 90;
-- Change all tenants ages to increase by 1
UPDATE tenants SET age = age + 1;
-- Find all tenants who live in an apartment that costs more than $2300
SELECT * FROM tenants JOIN apartments ON tenants.apartment_id=apartment.id WHERE monthly_rent > 2300;

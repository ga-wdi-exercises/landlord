-- Retrieve all info on all tenants
SELECT * FROM Tenants;
-- Retrieve the name, age, and gender of all tenants
SELECT name, age, gender FROM Tenants;
-- Retrieve all info on all tenants older than 65
SELECT * FROM Tenants WHERE age>65;
-- Retrieve all info on all tenants in apartment with id 20
SELECT * FROM Tenants WHERE apartment_id = 20;
-- Retrieve all info on all tenants in apartment with ids 20 or 15
SELECT * FROM Tenants WHERE apartment_id = 20 or apartment_id = 15;
-- Delete all tenants whose age is greater than 65
DELETE FROM Tenants WHERE age>65;
-- Create one new tenant, put them in any apartment you want
INSERT INTO Tenants(name, age, gender, apartment_id) VALUES ('Amy Davis', 37, 'Female', 13);
-- Find just the ids for all apartments
SELECT id, address  FROM Apartments;
-- Find all info for apartments whose price is greater than $2300
SELECT * FROM Apartments WHERE monthly_rent>2300;
-- Geriatric Birthday! Update all tenants whose age is 90 to be 91
UPDATE Tenants SET age=91 WHERE age=90;
-- Change all tenants ages to increase by 1
UPDATE Tenants SET age=age+1
-- Find all tenants who live in an apartment that costs more than $2300
SELECT * FROM Tenants JOIN Apartments ON Tenants.apartment_id = Apartments.id WHERE monthly_rent>2300;

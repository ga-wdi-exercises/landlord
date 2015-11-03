SELECT * FROM tenants;

SELECT name, age, gender FROM tenants;

SELECT name, age FROM tenants WHERE age > 65;

SELECT * FROM tenants WHERE apartment_id = 20;

SELECT * FROM tenants WHERE apartment_id = 20 OR apartment_id = 15;

DELETE FROM tenants WHERE age > 65;

INSERT INTO tenants(name, apartment_id) VALUES ('Becky Beauchamp', 4);

SELECT id FROM apartments;

SELECT * FROM apartments WHERE monthly_rent < 2300;

UPDATE tenants SET age = '91' WHERE age = '90';

UPDATE tenants SET age = age + 1;

SELECT name, monthly_rent FROM tenants JOIN apartments ON apartments.id=apartment_id WHERE apartments.monthly_rent > 2300;

SELECT * FROM  tenants JOIN apartments ON  apartments.id=apartment_id WHERE apartments.id < 10;

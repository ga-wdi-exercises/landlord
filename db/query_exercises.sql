-- Retrieve all info on all tenants
select * from tenants;
-- Retrieve the name, age, and gender of all tenants
select name, age, gender from tenants;
-- Retrieve all info on all tenants older than 65
select * from tenants where age>65;
-- Retrieve all info on all tenants in apartment with id 20
select * from tenants where apartment_id=20;
-- Retrieve all info on all tenants in apartment with ids 20 or 15
select * from tenants where apartment_id=20 or apartment_id=15;
-- Delete all tenants whose age is greater than 65
delete from tenants where age > 65;
-- Create one new tenant, put them in any apartment you want
insert into tenants(name, age, gender, apartment_id) VALUES ('Wonsik Jeong', 25, 'male', 20);
-- Find just the ids for all apartments
select id from apartments;
-- Find all info for apartments whose price is greater than $2300
select * from apartments where monthly_rent > 2300;
-- Geriatric Birthday! Update all tenants whose age is 90 to be 91
update tenants SET age=91 where age =90;
-- Change all tenants ages to increase by 1
update tenants SET age=age+1;
-- Find all tenants who live in an apartment that costs more than $2300
  select * from tenants JOIN apartments  on tenants.apartment_id=apartments.id where monthly_rent >2300;

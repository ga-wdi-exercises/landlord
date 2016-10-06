drop table if exists tenants;
drop table if exists apartments;

create table tenants(
  id serial primary key,
  name text,
  age int,
  gender text,
  apartment_id int
);

create table apartments(
  id serial primary key,
  address text,
  monthly_rent int,
  sqft int,
  num_beds int,
  num_baths int
);

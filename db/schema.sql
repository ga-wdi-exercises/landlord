create table tenants(
    tenant_id serial primary key
    ,name varchar(250) null
    ,age int null
    ,gender varchar(6) null
    ,apartment_id int not null
);

create table apartments(
    apartment_id serial primary key
    ,address varchar(250)not null
    ,monthly_rent int  null
    ,sqft int  null
    ,num_beds int  null
    ,num_baths int  null
);

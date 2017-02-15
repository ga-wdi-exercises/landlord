DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  gender TEXT,
  apartment_id INT
);

CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  address TEXT,
  monthly_rent INT,
  sqft INT,
  num_beds INT,
  num_baths INT

);

CREATE TABLE prompts(
  id SERIAL PRIMARY KEY,
  prompt TEXT
);

CREATE TABLE responses(
  id SERIAL PRIMARY KEY,
  response TEXT,
  to_prompt INT,
  function_id INT,
  prompt_id INT
);

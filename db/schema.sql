-- CREATE TABLE s
-- (sno VARCHAR(5) NOT NULL PRIMARY KEY,
--  name VARCHAR(16),
--  city VARCHAR(16)
-- )

DROP TABLE IF EXISTS tenants;
DROP TABLE IF EXISTS apartments;

CREATE TABLE tenants(
  id SERIAL PRIMARY KEY,
  -- id int CHECK (id >= 0),
  name VARCHAR(50),
  age int CHECK (age >= 0),
  gender VARCHAR(8),
  apartment_id int CHECK (apartment_id >= 0)
);
  -- PRIMARY KEY (id),
  -- FOREIGN KEY (apartment_id) REFERENCES aprtments(id)


CREATE TABLE apartments(
  id SERIAL PRIMARY KEY,
  -- id int, --CHECK (id >= 0)
  address VARCHAR(150),
  monthly_rent int CHECK (monthly_rent >= 0),
  sqft int, --CHECK (sqft >= 0)
  num_beds int, --CHECK (num_beds >= 0)
  num_baths int --CHECK (num_baths >= 0)
  -- PRIMARY KEY (id)
);

-- DROP TABLE IF EXISTS songs;
-- DROP TABLE IF EXISTS artists;
--
-- CREATE TABLE artists(
--   id SERIAL PRIMARY KEY,
--   name TEXT,
--   photo_url TEXT,
--   nationality TEXT
-- );
--
-- CREATE TABLE songs(
--   id SERIAL PRIMARY KEY,
--   title TEXT,
--   album TEXT,
--   preview_url TEXT,
--   artist_id INT
-- );

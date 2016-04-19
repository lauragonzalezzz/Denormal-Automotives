-- CREATE ROLE normal_user;
-- CREATE DATABASE normal_cars;
-- \c normal_cars;

-- CREATE TABLE IF NOT EXISTS vehicle_year
-- (
--   id SERIAL,
--   year INTEGER NOT NULL,
--   PRIMARY KEY (id)
-- );

CREATE TABLE IF NOT EXISTS vehicle_makes
(
  id SERIAL,
  PRIMARY KEY (id),
  make_code VARCHAR(255),
  make_title VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS vehicle_models
(
  id SERIAL,
  PRIMARY KEY (id),
  model_code VARCHAR(255),
  model_title VARCHAR(255)
);

-- CREATE TABLE IF NOT EXISTS vehicles
-- (
--   id SERIAL,
--   PRIMARY KEY (id),
--   year,
-- );
-- DROP ROLE normal_user;
-- DROP DATABASE normal_cars;
DROP TABLE IF EXISTS models CASCADE;
DROP TABLE IF EXISTS makes CASCADE;
DROP TABLE IF EXISTS vehicles CASCADE;
DROP TABLE IF EXISTS car_models CASCADE;

-- CREATE ROLE normal_user;
-- CREATE DATABASE normal_cars;
-- \c normal_cars
\i /home/laura/DevLeague/Denormal-Automotives/scripts/denormal_data.sql

--Create MAKES table
CREATE TABLE makes (
  id SERIAL PRIMARY KEY,
  makes_code VARCHAR(255) NOT NULL,
  makes_title VARCHAR(255) NOT NULL
);

--Add codes and titles from datadump
INSERT INTO makes(makes_code, makes_title)
SELECT DISTINCT make_code, make_title
FROM car_models;

--Create MODELS table
CREATE TABLE models (
  id SERIAL PRIMARY KEY,
  makes_id INT REFERENCES makes(id),
  model_code VARCHAR(255) NOT NULL,
  model_title VARCHAR(255) NOT NULL
);


--Add makes_id column to DATA DUMP
ALTER TABLE car_models
ADD COLUMN makes_id INTEGER;

UPDATE car_models SET makes_id = (
  SELECT DISTINCT id FROM makes
  WHERE car_models.make_code = makes.makes_code
  AND car_models.make_title = makes.makes_title
);

--Add codes and titles into MODELS from datadump
INSERT INTO models (model_code, model_title, makes_id)
SELECT DISTINCT model_code, model_title, makes_id
FROM car_models;



--Add models_id column to DATA DUMP
ALTER TABLE car_models
ADD COLUMN models_id INTEGER;

UPDATE car_models SET models_id = (
  SELECT DISTINCT id FROM models
  WHERE car_models.model_code = models.model_code
  AND car_models.model_title = models.model_title
);

-- Creates VEHICLES table
CREATE TABLE vehicles (
  id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  models_id INT REFERENCES models(id) NOT NULL,
  makes_id INT REFERENCES makes(id) NOT NULL
);

--Populates VEHICLES table with data from models and makes tables
INSERT INTO vehicles (year, models_id, makes_id)
SELECT DISTINCT year, models_id, makes_id
FROM car_models;

ALTER TABLE car_models
DROP COLUMN models_id;

ALTER TABLE car_models
DROP COLUMN makes_id;
-- --QUERYING
-- --8
SELECT models.model_title
FROM models
INNER JOIN makes
ON makes.id = models.makes_id
WHERE makes.makes_code = 'VOLKS';

--9
SELECT makes.makes_code, models.model_code, models.model_title, year
FROM makes
INNER JOIN models
ON makes.id = models.makes_id
INNER JOIN vehicles
ON vehicles.models_id = models.id
WHERE makes.makes_code = 'LAM';


-- --There is no order in a declarative language.
-- --You can call an alias before you set it and it will work fine
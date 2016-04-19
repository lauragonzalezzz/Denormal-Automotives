-- CREATE ROLE normal_user;
-- CREATE DATABASE normal_cars;
-- \c normal_cars;
-- \i /home/laura/DevLeague/Denormal-Automotives/scripts/denormal_data.sql;

CREATE TABLE years (
  id SERIAL PRIMARY KEY,
  year VARCHAR(255) NOT NULL,
);

CREATE TABLE models (
  id SERIAL PRIMARY KEY,
  model_code VARCHAR(255) NOT NULL,
  model_title VARCHAR(255) NOT NULL
);

CREATE TABLE makes (
  id SERIAL PRIMARY KEY,
  makes_code VARCHAR(255) NOT NULL,
  makes_title VARCHAR(255) NOT NULL
);


CREATE TABLE vehicles (
  id SERIAL PRIMARY KEY,
  year REFERENCES years(year),
  model_code REFERENCES models(model_code),
  model_title REFERENCES models(model_title),
  make_code REFERENCES makes(makes_code),
  make_title REFERENCES makes(makes_title)
);




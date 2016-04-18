-- CREATE ROLE denormal_user;
-- CREATE DATABASE denormal_cars;
-- \c denormal_cars;
-- \i /home/laura/DevLeague/Denormal-Automotives/scripts/denormal_data.sql;

\dS car_models;

-- SELECT make_title, year FROM car_models WHERE year= 2001;
-- SELECT make_title, model_title FROM car_models WHERE year= 2000;
-- SELECT * FROM car_models WHERE make_title= 'Yugo';

-- SELECT DISTINCT make_title FROM car_models;

-- SELECT DISTINCT model_title FROM car_models WHERE make_code= 'VOLKS';

-- SELECT DISTINCT make_code, model_code, model_title, year FROM car_models WHERE make_code= 'LAM';

-- SELECT DISTINCT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
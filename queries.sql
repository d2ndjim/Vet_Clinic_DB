/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/*New Queries*/
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(*) as most_escape, neutered FROM animals GROUP BY neutered;
SELECT MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts) as avg_escape, species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Queries (Joins) */
SELECT * FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT * FROM animals a JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';
SELECT a.name as animal_name, o.full_name FROM animals a JOIN owners o ON a.owner_id = o.id;
SELECT COUNT(*) as num_of_animals, s.name FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;

SELECT a.name, s.name FROM animals a 
JOIN species s ON a.species_id = s.id 
JOIN owners o ON a.owner_id = o.id 
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell'; 

SELECT * FROM animals a 
JOIN owners o ON a.owner_id = o.id
WHERE a.escape_attempts = 0 AND o.full_name = 'Dean Winchester';

SELECT o.full_name, COUNT(*) as max_num FROM animals a JOIN owners o ON a.owner_id = o.id GROUP BY o.full_name ORDER BY max_num DESC LIMIT 1;


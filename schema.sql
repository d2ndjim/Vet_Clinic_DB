/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR;

/* new tables */
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   name VARCHAR(50) 
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT, 
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) 
REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) 
REFERENCES owners(id) ON DELETE CASCADE;
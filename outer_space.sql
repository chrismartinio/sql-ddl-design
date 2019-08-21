-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

--GALAXY--

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way'),
  ('Black Eye');

--MOONS--

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

INSERT INTO moons
  (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

--STARS--

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  galaxy_id INTEGER REFERENCES galaxies ON DELETE CASCADE
);

INSERT INTO stars
  (name, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1),
  ('YOU A STAR', 2);

--PLANETS--

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars ON DELETE CASCADE
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 3);

--PLANET-MOONS--

CREATE TABLE planet_moons
(
  id SERIAL PRIMARY KEY,
  moon_id INTEGER REFERENCES moons ON DELETE CASCADE,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE
);

INSERT INTO planet_moons
  (moon_id, planet_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 2),
  (4, 4),
  (5, 4),
  (6, 4),
  (7, 4),
  (8, 4),
  (9, 4),
  (10, 4),
  (11, 4),
  (12, 4),
  (13, 4),
  (14, 4);


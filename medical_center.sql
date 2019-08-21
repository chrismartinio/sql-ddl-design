-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

-- HOSPITALS


CREATE TABLE hospitals
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO hospitals
  (name)
VALUES
  ('St. Marys'),
  ('Kaiser');

-- DOCTORS

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO doctors
  (first_name, last_name)
VALUES
  ('Dr. Billy', 'Smith'),
  ('Dr. Kelly', 'Doe');

-- PATIENTS

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO patients
  (first_name, last_name)
VALUES
  ('John', 'Martin'),
  ('Jane', 'Alex');

    -- DISEASES

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  type TEXT NOT NULL,
  name TEXT NOT NULL
);

INSERT INTO diseases
  (type, name)
VALUES
  ('autoimmune', 'crohn'),
  ('respitory', 'influenza'),
  ('cardiovascular', 'coronary artery'),
  ('cardiovascular', 'arrhythmia');

-- VISITS

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

INSERT INTO visits
  (doctor_id, patient_id)
VALUES
  (2, 1),
  (1, 2);

  -- VISI

CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO diagnoses
  (visit_id, disease_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4);





DROP DATABASE IF EXISTS league;

CREATE DATABASE league;

\c league

-- TEAMS

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  ranking INTEGER NOT NULL
);

INSERT INTO teams
(name, ranking)
VALUES
  ('Manchester City', 2),
  ('Chelsea FC', 1),
  ('Barcelona', 3);

  -- PLAYERS

  CREATE TABLE players
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
  );

  INSERT INTO players
  (name, team_id)
  VALUES
    ('Lionel Messi', 3),
    ('Luis Suarez', 3),
    ('Arturo Vidal', 3),
    ('Rodri', 1),
    ('Gabriel Jesus', 1),
    ('Tammy Abraham', 2),
    ('Pedro', 2),
    ('Reese James', 2);

    -- REFEREES

    CREATE TABLE referees
    (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL
    );

    INSERT INTO referees
    (name)
    VALUES
      ('Antonio Mateu Lahoz'),
      ('Szymom Marciniak'),
      ('Daniele Orsata'),
      ('Danny Makkelie');

      -- SEASONS

      CREATE TABLE seasons
      (
        id SERIAL PRIMARY KEY,
        begin_date DATE NOT NULL,
        end_date DATE NOT NULL
      );

      INSERT INTO seasons
      (begin_date, end_date)
      VALUES 
        ('2019-10-26', '2019-11-17'),
        ('2020-11-21', '2020-12-01'),
        ('2021-07-22', '2021-08-08');

        -- MATCHES

        CREATE TABLE matches
        (
          id SERIAL PRIMARY KEY,
          ref_id INTEGER REFERENCES referees ON DELETE CASCADE,
          season_id INTEGER REFERENCES seasons ON DELETE CASCADE,
          team1 TEXT REFERENCES teams ("name") ON DELETE CASCADE,
          team2 TEXT REFERENCES teams ("name") ON DELETE CASCADE
        );

        INSERT INTO matches
        (ref_id, season_id, team1, team2)
        VALUES
          (1, 1, 'Manchester City', 'Chelsea FC');


        -- GOALS

        CREATE TABLE goals
        (
          id SERIAL PRIMARY KEY,
          player_id INTEGER REFERENCES players ON DELETE CASCADE,
          match_id INTEGER REFERENCES matches ON DELETE CASCADE
        );

        INSERT INTO goals
        (player_id, match_id)
        VALUES
          (2, 1),
          (3, 1),
          (2, 1);

       


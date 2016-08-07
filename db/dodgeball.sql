DROP TABLE Teams; 
DROP TABLE Matches;

CREATE TABLE Teams (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE Matches (
  id serial4 primary key,
  home_team_id serial4 references teams (id) on delete casacde,
  away_team_id serial4 references teams (id) on delete casacde,
  home_team_score INT4,
  away_team_score INT4
);
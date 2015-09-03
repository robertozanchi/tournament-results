-- Table definitions for the tournament project.

-- Connect to the tournament database
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

-- Create a table for players records
CREATE TABLE players(
	player_id serial PRIMARY KEY,
	player_name text
);

-- Create a table matches records
create table matches(
	match_id serial PRIMARY KEY,
	winner_id int REFERENCES players(player_id),
	loser_id int REFERENCES players(player_id)
);

-- Create a view for number of games won by player id
CREATE VIEW wins AS
SELECT a.player_id, (select count(b.winner_id)) as wins
FROM players as a LEFT JOIN matches as b
ON a.player_id = b.winner_id
GROUP BY player_id
ORDER BY player_id asc;

-- Create a view for number of games lost by player id
CREATE VIEW defeats AS
SELECT a.player_id, (select count(b.loser_id)) as defeats
FROM players as a LEFT JOIN matches as b
ON a.player_id = b.loser_id
GROUP BY player_id
ORDER BY player_id asc;

-- Create a view for number of games won and number of games played (won or lost) by player id
CREATE VIEW standings AS
SELECT a.player_id, a.wins, (SELECT COALESCE(a.wins,0) + COALESCE(b.defeats,0)) as games
FROM wins as a, defeats as b
WHERE a.player_id = b.player_id;

-- Create a standings view including players names ordered by score (number of games won)
CREATE VIEW standings_with_name AS
SELECT a.player_id, a.player_name, b.wins, b.games
FROM players as a LEFT JOIN standings as b
ON a.player_id = b.player_id
ORDER BY b.wins DESC;

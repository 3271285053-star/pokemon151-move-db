/*创建数据库*/
CREATE DATABASE IF NOT EXISTS pokemon151_move_db;
USE pokemon151_move_db;

/*创建数据表*/
CREATE TABLE IF NOT EXISTS pokemon (
    pokemon_id SMALLINT PRIMARY KEY,
    name_en CHAR(50) UNIQUE,
    name_cn CHAR(50) UNIQUE,
    type1 CHAR(50),
    type2 CHAR(50),
    hp SMALLINT,
    attack SMALLINT,
    defense SMALLINT,
    sp_attack SMALLINT,
    sp_defense SMALLINT,
    speed SMALLINT,
    evolution_id SMALLINT,
    evolution_stage SMALLINT,
    remaining_evolutions SMALLINT,
    pre_evolution_id SMALLINT,
    evolution_method CHAR(50),
    evolution_level SMALLINT,
    latest_generation SMALLINT,
    
	FOREIGN KEY (pre_evolution_id) REFERENCES pokemon(pokemon_id)
) CHARSET=utf8mb4;
DESC pokemon;

CREATE TABLE IF NOT EXISTS move (
	move_id SMALLINT PRIMARY KEY,
    name_en CHAR(50) UNIQUE,
    name_cn CHAR(50) UNIQUE,
    move_type CHAR(50),
    category CHAR(50),
    move_power SMALLINT,
    accuracy SMALLINT,
    pp SMALLINT,
	effect TEXT
) CHARSET=utf8mb4;
DESC move;


CREATE TABLE IF NOT EXISTS learn (
	learn_id SMALLINT PRIMARY KEY,
    pokemon_id SMALLINT,
    move_id SMALLINT,
    gen SMALLINT,
    method CHAR(50),
    learn_level SMALLINT,
    
	FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
	FOREIGN KEY (move_id) REFERENCES move(move_id)
) CHARSET=utf8mb4;
DESC learn;

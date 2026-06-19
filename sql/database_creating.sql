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
    evolution_id SMALLINT,
    evolution_stage SMALLINT,
    remaining_evolutions SMALLINT,
    post_evolution_id SMALLINT,
    evolution_level SMALLINT,
    latest_generation SMALLINT,
    
	FOREIGN KEY (post_evolution_id) REFERENCES pokemon(pokemon_id)
) CHARSET=utf8mb4;
DESC pokemon;
drop table pokemon;

CREATE TABLE IF NOT EXISTS move (
	move_id SMALLINT PRIMARY KEY,
    name_en CHAR(50) UNIQUE,
    name_cn CHAR(50) UNIQUE,
    move_type CHAR(50),
    category CHAR(50),
    move_power SMALLINT,
    accuracy SMALLINT,
    pp SMALLINT,
	move_category CHAR(200)
) CHARSET=utf8mb4;
DESC move;
drop table move;

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
DESC move;
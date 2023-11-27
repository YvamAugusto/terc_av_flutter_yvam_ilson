Clone o projeto: git clone https://github.com/YvamAugusto/terc_av_flutter_yvam_ilson.git

Crie uma database e rode os sql's para criar as tabelas
CREATE TABLE If NOT EXISTS musicas (
    id serial4 NOT NULL,
	nome varchar(50) NOT NULL,
	album varchar(30) NOT NULL,
	autor varchar(50) NOT NULL,
	genero varchar(20) NOT NULL,
	ano int4 NOT NULL,
	duracao varchar(6) NOT NULL
);

CREATE SEQUENCE public.musicas_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 50000
	START 1
	CACHE 1
	NO CYCLE;

INSERT INTO musicas(nome, album, autor, genero, ano, duracao) VALUES ('Conexões de Máfia (feat. Rich The Kid)', 'Conexões de Máfia', 'Matuê', 'Trap', 2023, '3:41');

INSERT INTO musicas(nome, album, autor, genero, ano, duracao) VALUES ('Sereia', 'Vida Cara', 'Orochi', 'Trap', 2023, '4:54');


Instale as dependencias: npm install pg cors express

inicie o backend: npm start

Inicie o flutter: flutter run

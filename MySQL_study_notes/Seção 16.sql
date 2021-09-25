SEÇÃO 16 - DICIONÁRIO DE DADOS

CREATE TABLE TABELA (
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

--ADICIONANDO UMA PK
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

--ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO

ALTER TABLE TABELA 
ADD COLUNA VARCHAR(30);

ALTER TABLE TABELA 
ADD COLUNA100P INT;

--ADICIONANDO UMA COLUNA COM POSICAO

ALTER TABLE TABELA 
ADD COLUNA4 VARCHAR(30)
AFTER COLUNA3;


--MODIFICANDO O TIPO DE UM CAMPO

ALTER TABLE TABELA
MODIFY COLUNA2 DATE NOT NULL;

ALTER TABLE TABELA MODIFY COLUNA4 VARCHAR(30) NOT NULL UNIQUE;


--RENOMEANDO O NOME DA TABELA

ALTER TABLE TABELA 
RENAME PESSOA;



CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30));

--Foreign key

ALTER TABLE TIME
ADD FOREIGN KEY (ID_PESSOA)
REFERENCES PESSOA(COLUNA1);


/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE TIME;

/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

DROP TABLE JOGADOR

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);


/* A35 - ORGANIZANDO CHAVES */

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTES;


CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY (IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/* DICIONARIO DE DADOS */

SHOW DATABASES;

USE INFORMATION_SCHEMA;

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_NAME AS 'NOME',
		TABLE_SCHEMA AS 'BANCO',
		TABLE_NAME AS 'TABELA',
		CONSTRAINT_TYPE AS 'TIPO'
		FROM TABLE_CONSTRAINTS
		WHERE TABLE_SCHEMA = 'COMERCIO';


USE COMERCIO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;
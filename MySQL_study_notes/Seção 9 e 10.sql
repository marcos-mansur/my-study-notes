SEÇÃO 9 e 10 - JUNÇÃO, PONTEIRAMENTO


/* FUNCIONA USAR O WHERE PARA JUNÇÃO MAS É DESACONSELHÁVEL. INNER JOIN FAZ ISSO MELHOR */
SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTES, ENDERECO /*ORIGEM */
WHERE IDCLIENTES = ID_CLIENTES; /* JUNCAO */
AND SEXO = 'F';

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+


/* INNER JOIN FAZ ISSO MELHOR: */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTES
	INNER JOIN ENDERECO
	ON IDCLIENTES = ID_CLIENTES
WHERE SEXO = 'F';

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+
/* SEMPRE BOM INDENTAR E DIVIDIR AS QUERYS PARA FACILITAR A LEITURA */


SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTES
	INNER JOIN TELEFONE 
	ON IDCLIENTES = ID_CLIENTES;
+--------+------+----------------+-------------+----------+
| NOME   | SEXO | EMAIL          | TIPO        | NUMERO   |
+--------+------+----------------+-------------+----------+
| JORGE  | M    | JORGE@IG.COM   | CELULAR     | 78458743 |
| JORGE  | M    | JORGE@IG.COM   | RESIDENCIAL | 56576876 |
| JOAO   | M    | JOAOA@IG.COM   | CELULAR     | 87866896 |
| CARLOS | M    | CARLOSA@IG.COM | COMERCIAL   | 54768899 |
| JOAO   | M    | JOAOA@IG.COM   | RESIDENCIAL | 99667587 |
| ANA    | F    | ANA@IG.COM     | CELULAR     | 78989765 |
| ANA    | F    | ANA@IG.COM     | CELULAR     | 99766676 |
| JOAO   | M    | JOAOA@IG.COM   | COMERCIAL   | 66687899 |
| JORGE  | M    | JORGE@IG.COM   | RESIDENCIAL | 89986668 |
| CARLOS | M    | CARLOSA@IG.COM | CELULAR     | 88687909 |
+--------+------+----------------+-------------+----------+


/* PONTERANDO OS ATRIBUTOS PARA FAZER INNER JOIN DE MAIS DE DUAS COLUNAS COMO MSM FK */
SELECT CLIENTES.NOME, CLIENTES.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTES 
	INNER JOIN ENDERECO
	ON CLIENTES.IDCLIENTES=ENDERECO.ID_CLIENTES
		INNER JOIN TELEFONE 
		ON CLIENTES.IDCLIENTES = TELEFONE.ID_CLIENTES;

/* PONTERANDO USANDO ALAS TEMOS */

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTES C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTES=E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES;

============================================================


	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE


========================  DML ===============================

/* INSERT */

INSERT INTO CLIENTES VALUES (NULL, 'PAULA', 'M', NULL, '77437493');

--------------------------------------------------------
/* FILTROS */

SELECT * FROM CLIENTES
WHERE SEXO = 'M';
--------------------------------------------------------

/* UPDATE */

SELECT * FROM CLIENTES
WHERE IDCLIENTES = 7;

UPDATE CLIENTES
SET SEXO = 'F'
WHERE  IDCLIENTES = 7;
--------------------------------------------------------

/* DELETE */ 
INSERT INTO CLIENTES VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTES
WHERE IDCLIENTES = 8;

DELETE FROM CLIENTES WHERE IDCLIENTES = 8;
--------------------------------------------------------

========================  DDL ===============================
-- RELACIONADO A TIPAGEM

CREATE TABLE PRODUTO (
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR (30) NOT NULL,
	PREÇO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */
	/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PREÇO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;


========================= SEÇÃO 10 ==============================
/* EXERCÍCIOS DE DML */

INSERT INTO CLIENTES VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTES VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTES VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTES VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTES VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTES VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTES VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTES VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTES VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTES VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTES VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTES VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTES VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE (IDTELEFONE,TIPO, NUMERO, ID_CLIENTES) VALUES(NULL,'CEL','44522578',21);


/* RELATORIO GERAL DE TODOS OS CLIENTES */

SELECT * FROM CLIENTES C
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES =T.ID_CLIENTES;

+------------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+-------------+------------+----------+------+-------------+
| IDCLIENTES | NOME    | SEXO | EMAIL             | CPF         | IDENDERECO | RUA                | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTES | IDTELEFONE | NUMERO   | TIPO | ID_CLIENTES |
+------------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+-------------+------------+----------+------+-------------+
|          1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |           1 |          3 | 87866896 | CEL  |           1 |
|          1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |           1 |          5 | 99667587 | RES  |           1 |
|          1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |           1 |          8 | 66687899 | COM  |           1 |
|          3 | ANA     | F    | ANA@IG.COM        | 456545678   |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |           3 |          6 | 78989765 | CEL  |           3 |
|          3 | ANA     | F    | ANA@IG.COM        | 456545678   |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |           3 |          7 | 99766676 | CEL  |           3 |
|          2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |           2 |          4 | 54768899 | COM  |           2 |
|          2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |           2 |         10 | 88687909 | CEL  |           2 |
|          5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |           5 |          1 | 78458743 | CEL  |           5 |
|          5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |           5 |          2 | 56576876 | RES  |           5 |
|          5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |           5 |          9 | 89986668 | RES  |           5 |
|          9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |           9 |         11 | 68976565 | RES  |           9 |
|          9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |           9 |         12 | 99656675 | CEL  |           9 |
|         11 | GIOVANA | F    | NULL              | 0876655     |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |          11 |         13 | 33567765 | CEL  |          11 |
|         11 | GIOVANA | F    | NULL              | 0876655     |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |          11 |         14 | 88668786 | CEL  |          11 |
|         11 | GIOVANA | F    | NULL              | 0876655     |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |          11 |         15 | 55689654 | COM  |          11 |
|         12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |          12 |         16 | 88687979 | COM  |          12 |
|         13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    |         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |          13 |         17 | 88965676 | COM  |          13 |
|         15 | EDUARDO | M    | NULL              | 54376457    |         14 | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |          15 |         18 | 89966809 | CEL  |          15 |
|         16 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    |         15 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |          16 |         19 | 88679978 | COM  |          16 |
|         17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |          17 |         20 | 99655768 | CEL  |          17 |
|         18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    |         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |          18 |         21 | 89955665 | RES  |          18 |
|         19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |          19 |         22 | 77455786 | RES  |          19 |
|         19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |          19 |         23 | 89766554 | RES  |          19 |
|         20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          20 |         24 | 77755785 | RES  |          20 |
|         20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          20 |         25 | 44522578 | COM  |          20 |
|         21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |         20 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          21 |         26 | 44522578 | CEL  |          21 |
+------------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+-------------+------------+----------+------+-------------+

/* SEM AS COLUNAS DE FK */

SELECT C.IDCLIENTES,C.NOME,C.SEXO,C.CPF,E.RUA,E.BAIRRO,E.CIDADE,E.ESTADO, T.NUMERO, T.TIPO
FROM CLIENTES C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES;

+------------+---------+------+-------------+--------------------+------------+----------------+--------+----------+------+
| IDCLIENTES | NOME    | SEXO | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | NUMERO   | TIPO |
+------------+---------+------+-------------+--------------------+------------+----------------+--------+----------+------+
|          1 | JOAO    | M    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 87866896 | CEL  |
|          1 | JOAO    | M    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 99667587 | RES  |
|          1 | JOAO    | M    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 66687899 | COM  |
|          3 | ANA     | F    | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | 78989765 | CEL  |
|          3 | ANA     | F    | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | 99766676 | CEL  |
|          2 | CARLOS  | M    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | 54768899 | COM  |
|          2 | CARLOS  | M    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | 88687909 | CEL  |
|          5 | JORGE   | M    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 78458743 | CEL  |
|          5 | JORGE   | M    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 56576876 | RES  |
|          5 | JORGE   | M    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 89986668 | RES  |
|          9 | FLAVIO  | M    | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 68976565 | RES  |
|          9 | FLAVIO  | M    | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 99656675 | CEL  |
|         11 | GIOVANA | F    | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 33567765 | CEL  |
|         11 | GIOVANA | F    | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 88668786 | CEL  |
|         11 | GIOVANA | F    | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 55689654 | COM  |
|         12 | KARLA   | M    | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | 88687979 | COM  |
|         13 | DANIELE | M    | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | 88965676 | COM  |
|         15 | EDUARDO | M    | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | 89966809 | CEL  |
|         16 | ANTONIO | F    | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | 88679978 | COM  |
|         17 | ANTONIO | M    | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | 99655768 | CEL  |
|         18 | ELAINE  | M    | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | 89955665 | RES  |
|         19 | CARMEM  | M    | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 77455786 | RES  |
|         19 | CARMEM  | M    | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 89766554 | RES  |
|         20 | ADRIANA | F    | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 77755785 | RES  |
|         20 | ADRIANA | F    | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 44522578 | COM  |
|         21 | JOICE   | F    | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 44522578 | CEL  |
+------------+---------+------+-------------+--------------------+------------+----------------+--------+----------+------+
2

/* RELATORIO DE HOMENS */

SELECT C.IDCLIENTES,C.NOME,C.SEXO,C.CPF,E.RUA,E.BAIRRO,E.CIDADE,E.ESTADO, T.NUMERO, T.TIPO
FROM CLIENTES C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES
WHERE SEXO = 'M';

+------------+---------+------+-------------+--------------------+------------+----------------+--------+----------+------+
| IDCLIENTES | NOME    | SEXO | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | NUMERO   | TIPO |
+------------+---------+------+-------------+--------------------+------------+----------------+--------+----------+------+
|          1 | JOAO    | M    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 87866896 | CEL  |
|          1 | JOAO    | M    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 99667587 | RES  |
|          1 | JOAO    | M    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | 66687899 | COM  |
|          2 | CARLOS  | M    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | 54768899 | COM  |
|          2 | CARLOS  | M    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | 88687909 | CEL  |
|          5 | JORGE   | M    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 78458743 | CEL  |
|          5 | JORGE   | M    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 56576876 | RES  |
|          5 | JORGE   | M    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | 89986668 | RES  |
|          9 | FLAVIO  | M    | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 68976565 | RES  |
|          9 | FLAVIO  | M    | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 99656675 | CEL  |
|         12 | KARLA   | M    | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | 88687979 | COM  |
|         13 | DANIELE | M    | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | 88965676 | COM  |
|         15 | EDUARDO | M    | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | 89966809 | CEL  |
|         17 | ANTONIO | M    | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | 99655768 | CEL  |
|         18 | ELAINE  | M    | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | 89955665 | RES  |
|         19 | CARMEM  | M    | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 77455786 | RES  |
|         19 | CARMEM  | M    | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 89766554 | RES  |
+------------+---------+------+-------------+--------------------+------------+----------------+--------+----------+------+

SELECT * FROM CLIENTES 
WHERE IDCLIENTES = 12
OR IDCLIENTES = 13
OR IDCLIENTES = 18
OR IDCLIENTES = 19;

SELECT * FROM CLIENTES
WHERE IDCLIENTES IN (12,13,18,19);

UPDATE CLIENTES 
SET SEXO = 'F'
WHERE IDCLIENTES IN (12,13,18,19);

UPDATE CLIENTES 
SET SEXO = 'F'
WHERE IDCLIENTES = 14;


SELECT * FROM CLIENTES;
+------------+---------+------+-------------------+-------------+
| IDCLIENTES | NOME    | SEXO | EMAIL             | CPF         |
+------------+---------+------+-------------------+-------------+
|          1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |
|          2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |
|          3 | ANA     | F    | ANA@IG.COM        | 456545678   |
|          4 | CLARA   | F    | NULL              | 5687766856  |
|          5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |
|          6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  |
|          7 | PAULA   | F    | NULL              | 77437493    |
|          9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |
|         10 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |
|         11 | GIOVANA | F    | NULL              | 0876655     |
|         12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   |
|         13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    |
|         14 | LORENA  | F    | NULL              | 774557887   |
|         15 | EDUARDO | M    | NULL              | 54376457    |
|         16 | ANTONIO | M    | ANTONIO@IG.COM    | 12436767    |
|         17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |
|         18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    |
|         19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   |
|         20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |
|         21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |
+------------+---------+------+-------------------+-------------+
SELECT * FROM TELEFONE;
+------------+----------+------+-------------+
| IDTELEFONE | NUMERO   | TIPO | ID_CLIENTES |
+------------+----------+------+-------------+
|          1 | 78458743 | CEL  |           5 |
|          2 | 56576876 | RES  |           5 |
|          3 | 87866896 | CEL  |           1 |
|          4 | 54768899 | COM  |           2 |
|          5 | 99667587 | RES  |           1 |
|          6 | 78989765 | CEL  |           3 |
|          7 | 99766676 | CEL  |           3 |
|          8 | 66687899 | COM  |           1 |
|          9 | 89986668 | RES  |           5 |
|         10 | 88687909 | CEL  |           2 |
|         11 | 68976565 | RES  |           9 |
|         12 | 99656675 | CEL  |           9 |
|         13 | 33567765 | CEL  |          11 |
|         14 | 88668786 | CEL  |          11 |
|         15 | 55689654 | COM  |          11 |
|         16 | 88687979 | COM  |          12 |
|         17 | 88965676 | COM  |          13 |
|         18 | 89966809 | CEL  |          15 |
|         19 | 88679978 | COM  |          16 |
|         20 | 99655768 | CEL  |          17 |
|         21 | 89955665 | RES  |          18 |
|         22 | 77455786 | RES  |          19 |
|         23 | 89766554 | RES  |          19 |
|         24 | 77755785 | RES  |          20 |
|         25 | 44522578 | COM  |          20 |
|         26 | 44522578 | CEL  |          21 |
+------------+----------+------+-------------+
SELECT * FROM ENDERECO;
+------------+--------------------+------------+----------------+--------+-------------+
| IDENDERECO | RUA                | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTES |
+------------+--------------------+------------+----------------+--------+-------------+
|          1 | RUA ANTONIO SA     | CENTRO     | B. HORIZONTE   | MG     |           4 |
|          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |           1 |
|          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |           3 |
|          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |           2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO   | RIO DE JANEIRO | RJ     |           6 |
|          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |           5 |
|          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |           9 |
|          9 | RUA MAIA LACERDA   | ESTACIO    | RIO DE JANEIRO | RJ     |          10 |
|         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |          11 |
|         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |          12 |
|         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |          13 |
|         13 | RUA CASTRO ALVES   | LEBLON     | RIO DE JANEIRO | RJ     |          14 |
|         14 | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |          15 |
|         15 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |          16 |
|         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |          17 |
|         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |          18 |
|         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |          19 |
|         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          20 |
|         20 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          21 |
+------------+--------------------+------------+----------------+--------+-------------+




/* RELATORIO DE MULHERES */

SELECT C.IDCLIENTES,C.NOME, C.EMAIL,C.SEXO,C.CPF,E.RUA,E.BAIRRO,E.CIDADE,E.ESTADO, T.NUMERO, T.TIPO
FROM CLIENTES C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES
WHERE SEXO = 'F';

+------------+---------+-------------------+------+-----------+--------------------+------------+----------------+--------+----------+------+
| IDCLIENTES | NOME    | EMAIL             | SEXO | CPF       | RUA                | BAIRRO     | CIDADE         | ESTADO | NUMERO   | TIPO |
+------------+---------+-------------------+------+-----------+--------------------+------------+----------------+--------+----------+------+
|          3 | ANA     | ANA@IG.COM        | F    | 456545678 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | 78989765 | CEL  |
|          3 | ANA     | ANA@IG.COM        | F    | 456545678 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | 99766676 | CEL  |
|         11 | GIOVANA | NULL              | F    | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 33567765 | CEL  |
|         11 | GIOVANA | NULL              | F    | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 88668786 | CEL  |
|         11 | GIOVANA | NULL              | F    | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | 55689654 | COM  |
|         12 | KARLA   | KARLA@GMAIL.COM   | F    | 545676778 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | 88687979 | COM  |
|         13 | DANIELE | DANIELE@GMAIL.COM | F    | 43536789  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | 88965676 | COM  |
|         16 | ANTONIO | ANTONIO@IG.COM    | F    | 12436767  | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | 88679978 | COM  |
|         18 | ELAINE  | ELAINE@GLOBO.COM  | F    | 32567763  | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | 89955665 | RES  |
|         19 | CARMEM  | CARMEM@IG.COM     | F    | 787832213 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 77455786 | RES  |
|         19 | CARMEM  | CARMEM@IG.COM     | F    | 787832213 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | 89766554 | RES  |
|         20 | ADRIANA | ADRIANA@GMAIL.COM | F    | 88556942  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 77755785 | RES  |
|         20 | ADRIANA | ADRIANA@GMAIL.COM | F    | 88556942  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 44522578 | COM  |
|         21 | JOICE   | JOICE@GMAIL.COM   | F    | 55412256  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 44522578 | CEL  |
+------------+---------+-------------------+------+-----------+--------------------+------------+----------------+--------+----------+------+


SELECT * FROM CLIENTES
WHERE IDCLIENTES = 16;

UPDATE CLIENTES
SET SEXO = 'M'
WHERE IDCLIENTES = 16;


/* QUANTIDADE DE HOMENS E MULHERES */

SELECT SEXO, COUNT(*) AS QUANTIDADE FROM CLIENTES
GROUP BY SEXO;



==========/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NAO TENHAM CELULAR */ ==========

SELECT BAIRRO, COUNT(*) FROM ENDERECO
GROUP BY BAIRRO;

SELECT CIDADE, COUNT(*) FROM ENDERECO
GROUP BY CIDADE
ORDER BY 1 ASC;

-- CENTRO = 9 | RJ = 10

SELECT C.IDCLIENTES, C.NOME, C.EMAIL 
FROM CLIENTES C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTES = E.ID_CLIENTES
WHERE C.SEXO = 'F'
AND E.CIDADE = 'RIO DE JANEIRO'
AND E.BAIRRO = 'CENTRO'; 
+------------+---------+-------------------+
| IDCLIENTES | NOME    | EMAIL             |
+------------+---------+-------------------+
|         11 | GIOVANA | NULL              |
|         19 | CARMEM  | CARMEM@IG.COM     |
|         20 | ADRIANA | ADRIANA@GMAIL.COM |
|         21 | JOICE   | JOICE@GMAIL.COM   |
+------------+---------+-------------------+

SELECT C.IDCLIENTES, C.NOME, C.EMAIL, T.TIPO, T.NUMERO
FROM CLIENTES C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTES = T.ID_CLIENTES
WHERE IDCLIENTES IN (11,19,20,21);
+------------+---------+-------------------+------+----------+
| IDCLIENTES | NOME    | EMAIL             | TIPO | NUMERO   |
+------------+---------+-------------------+------+----------+
|         11 | GIOVANA | NULL              | CEL  | 33567765 |
|         11 | GIOVANA | NULL              | CEL  | 88668786 |
|         11 | GIOVANA | NULL              | COM  | 55689654 |
|         19 | CARMEM  | CARMEM@IG.COM     | RES  | 77455786 |
|         19 | CARMEM  | CARMEM@IG.COM     | RES  | 89766554 |
|         20 | ADRIANA | ADRIANA@GMAIL.COM | RES  | 77755785 |
|         20 | ADRIANA | ADRIANA@GMAIL.COM | COM  | 44522578 |
|         21 | JOICE   | JOICE@GMAIL.COM   | CEL  | 44522578 |
+------------+---------+-------------------+------+----------+


SELECT C.IDCLIENTES, C.EMAIL, C.NOME, C.SEXO, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE 
FROM CLIENTES C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND (TIPO = 'RES' OR TIPO = 'COM');
+------------+-------------------+---------+------+------+----------+--------+----------------+
| IDCLIENTES | EMAIL             | NOME    | SEXO | TIPO | NUMERO   | BAIRRO | CIDADE         |
+------------+-------------------+---------+------+------+----------+--------+----------------+
|         11 | NULL              | GIOVANA | F    | COM  | 55689654 | CENTRO | RIO DE JANEIRO | -----giovana ainda veio mas ela tem celular
|         19 | CARMEM@IG.COM     | CARMEM  | F    | RES  | 77455786 | CENTRO | RIO DE JANEIRO | ----- precisa de subquery para fazer isso
|         19 | CARMEM@IG.COM     | CARMEM  | F    | RES  | 89766554 | CENTRO | RIO DE JANEIRO |
|         20 | ADRIANA@GMAIL.COM | ADRIANA | F    | RES  | 77755785 | CENTRO | RIO DE JANEIRO |
|         20 | ADRIANA@GMAIL.COM | ADRIANA | F    | COM  | 44522578 | CENTRO | RIO DE JANEIRO |
+------------+-------------------+---------+------+------+----------+--------+----------------+
 
 --Além da giovana, pelo o inner join com a tabela telefone, só vem para cá quem tem algum telefone. quem não registrou nenhum
 --não tem celular mas não aparece aqui. 
 --Entender melhor relacionamento 1 x n e como puxar registros de uma tabela que não tem relacionamento com nenhum registro de outra (pm=fk)

-------------------------------------------------------------------------------------------------------

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT 	C.NOME, C.EMAIL, 
		T.NUMERO, T.TIPO, 
		E.CIDADE
FROM CLIENTES C
	INNER JOIN ENDERECO E  
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES
WHERE E.ESTADO = 'RJ'
AND T.TIPO = 'CEL';
+---------+-----------------+----------+------+----------------+
| NOME    | EMAIL           | NUMERO   | TIPO | CIDADE         |
+---------+-----------------+----------+------+----------------+
| JOAO    | JOAOA@IG.COM    | 87866896 | CEL  | RIO DE JANEIRO |
| CARLOS  | CARLOSA@IG.COM  | 88687909 | CEL  | RIO DE JANEIRO |
| GIOVANA | NULL            | 33567765 | CEL  | RIO DE JANEIRO |
| GIOVANA | NULL            | 88668786 | CEL  | RIO DE JANEIRO |
| JOICE   | JOICE@GMAIL.COM | 44522578 | CEL  | RIO DE JANEIRO |
+---------+-----------------+----------+------+----------------+


/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT 	C.NOME, C.EMAIL, 
		T.NUMERO, T.TIPO, 
		E.ESTADO
FROM CLIENTES C
	INNER JOIN ENDERECO E  
	ON C.IDCLIENTES = E.ID_CLIENTES
		INNER JOIN TELEFONE T
		ON C.IDCLIENTES = T.ID_CLIENTES
WHERE E.ESTADO = 'SP'
AND SEXO = 'F'
AND T.TIPO = 'CEL';









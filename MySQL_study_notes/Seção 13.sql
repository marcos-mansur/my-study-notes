Seção 13 - DELIMITER, PROCEDURES

/* Delimitador */

DELIMITER $

-- é preciso mudar o delimiter para fazer uma procedure

/* STORED PROCEDURES */

DELIMITER $
CREATE PROCEDURE NOME()
BEGIN
	QUALQUER PROGRAMACAO;
END
$


DELIMITER $
CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
END
$

/* CHAMANDO UMA PROCEDURE */


CALL NOME_EMPRESA()$

DELIMITER ;

CALL NOME_EMPRESA();

----------------------------------------------------------------------------

DELIMITER $

CREATE PROCEDURE INSERT_CLIENTES(P_NOME VARCHAR (30), 	
							 	 P_SEXO ENUM('F','M','NÃO-BINÁRIO'),
							 	 P_EMAIL VARCHAR(30), 
							 	 P_CPF VARCHAR(11))
BEGIN
	INSERT INTO CLIENTES VALUES (NULL, P_NOME, P_SEXO, P_EMAIL, P_CPF);
END
$

DELIMITER ;

CALL INSERT_CLIENTES('TICO','M','TICÃONAMONTANHARUSSA@GMAIL.COM','112358133');

+------------+---------+------+---------------------------------+-------------+
| IDCLIENTES | NOME    | SEXO | EMAIL                           | CPF         |
+------------+---------+------+---------------------------------+-------------+
|          1 | JOAO    | M    | JOAOA@IG.COM                    | 76567587887 |
|          2 | CARLOS  | M    | CARLOSA@IG.COM                  | 5464553466  |
|          3 | ANA     | F    | ANA@IG.COM                      | 456545678   |
|          4 | CLARA   | F    | NULL                            | 5687766856  |
|          5 | JORGE   | M    | JORGE@IG.COM                    | 8756547688  |
|          6 | CELIA   | M    | JCELIA@IG.COM                   | 5767876889  |
|          7 | PAULA   | F    | NULL                            | 77437493    |
|          9 | FLAVIO  | M    | FLAVIO@IG.COM                   | 4657765     |
|         10 | ANDRE   | M    | ANDRE@GLOBO.COM                 | 7687567     |
|         11 | GIOVANA | F    | NULL                            | 0876655     |
|         12 | KARLA   | F    | KARLA@GMAIL.COM                 | 545676778   |
|         13 | DANIELE | F    | DANIELE@GMAIL.COM               | 43536789    |
|         14 | LORENA  | F    | NULL                            | 774557887   |
|         15 | EDUARDO | M    | NULL                            | 54376457    |
|         16 | ANTONIO | M    | ANTONIO@IG.COM                  | 12436767    |
|         17 | ANTONIO | M    | ANTONIO@UOL.COM                 | 3423565     |
|         18 | ELAINE  | F    | ELAINE@GLOBO.COM                | 32567763    |
|         19 | CARMEM  | F    | CARMEM@IG.COM                   | 787832213   |
|         20 | ADRIANA | F    | ADRIANA@GMAIL.COM               | 88556942    |
|         21 | JOICE   | F    | JOICE@GMAIL.COM                 | 55412256    |
|         22 | TICO    | M    | TICÃONAMONTANHARUSSA@GMAIL.COM  | 112358133   |
+------------+---------+------+---------------------------------+-------------+

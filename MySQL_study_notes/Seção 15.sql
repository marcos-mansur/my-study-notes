SEÇÃO 15 - SUBQUERIES

/* VENDAS POR SEXO */

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;

/* A 31 - SUBQUERIES

VENDEDOR QUE VENDEU MENOS EM MARCO
E O SEU NOME */

SELECT MIN(MARCO) AS MENOR_MARÇO, NOME
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

/* NOME E O VALOR QUE VENDEU MAIS EM MARCO */

SELECT MAX(MARCO) AS MAIOR_MARÇO, NOME
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

/* QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV */

SELECT NOME
FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

SELECT NOME, FEVEREIRO FROM VENDEDORES
WHERE FEVEREIRO < (SELECT AVG(FEVEREIRO) FROM VENDEDORES);


/* A32 - OPERACOES EM LINHA */

SELECT * FROM VENDEDORES;

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES;
	   
/* APLICANDO UM % */

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   (JANEIRO+FEVEREIRO+MARCO) * .25 AS "DESCONTO",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES;
	   


















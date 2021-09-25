SEÇÃO 21 E 22 - CURSORES, TRIGGERS COM VARIÁVEIS, 2 E 3 FORMAS NORMAIS


/* A 45 - CURSORES */

CREATE DATABASE CURSORES;
USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT
);

INSERT INTO VENDEDORES VALUES(NULL,'MAFRA',32432,242334,574545);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA',65465,65443,653454);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO',12432,65356,8756);
INSERT INTO VENDEDORES VALUES(NULL,'LILIAN',4567,9676,8765);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO',3467,68756,99765);
INSERT INTO VENDEDORES VALUES(NULL,'GLORIA',54786,76889,7098);

SELECT * FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL FROM VENDEDORES;
SELECT NOME, (JAN+FEV+MAR) AS TOTAL, (JAN+FEV+MAR)/3 AS MEDIA FROM VENDEDORES;

CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);

DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN
		DECLARE FIM INT DEFAULT 0;
		DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
		DECLARE VNOME VARCHAR(50);
		
		DECLARE REG CURSOR FOR(
			SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
		);
		
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
		
		OPEN REG;
		
		REPEAT
		
			FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
			IF NOT FIM THEN
			
				SET VTOTAL = VAR1 + VAR2 + VAR3;
				SET VMEDIA = VTOTAL / 3;
				
				INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
				
			END IF;
			
		UNTIL FIM END REPEAT;
		
		CLOSE REG;
END
$

SELECT * FROM VENDEDORES;
SELECT * FROM VEND_TOTAL;

DELIMITER ;

CALL INSEREDADOS();

INSERT INTO VENDEDORES VALUES(NULL,'LETICIA',656,3546,234545);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA',6766,56556,65454);

SELECT * FROM VENDEDORES;
SELECT * FROM VEND_TOTAL;

DELETE FROM VEND_TOTAL;

CALL INSEREDADOS();

==============================================

/* A 46 TRIGGERS COM VARIAVEIS */

DELIMITER $

CREATE TRIGGER CADTOTAL
BEFORE INSERT ON VENDEDORES
FOR EACH ROW
BEGIN
		DECLARE VTOTAL, VMEDIA INT;
		
		SET VTOTAL := NEW.JAN + NEW.FEV + NEW.MAR;
		SET VMEDIA := (NEW.JAN + NEW.FEV + NEW.MAR)/3;
		
		INSERT INTO VEND_TOTAL VALUES(NEW.NOME,NEW.JAN,NEW.FEV,NEW.MAR,VTOTAL,VMEDIA);

END
$

DELIMITER ;

INSERT INTO VENDEDORES VALUES(NULL,'JULIO',9999,9999,9999);
						  
SELECT * FROM VENDEDORES;
SELECT * FROM VEND_TOTAL;





=============== A47 SEGUNDA E TERCEIRAS FORMAS NORMAIS =====================

/*
	 PRIMEIRA FN
	 
	 ATOMICIDADE - UM CAMPO NAO PODE SER DIVISIVEL
	 UM CAMPO NAO PODE SER VETORIZADO
	 PK CHAVE PRIMARIA

*/

CREATE DATABASE CONSULTORIO;

CREATE TABLE PACIENTE(
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	NASCIMENTO DATE
);

CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	ESPECIALIDADE VARCHAR(30),
	FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
	IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	BAIRRO VARCHAR(30),
	CIDADE VARCHAR(30),
	ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
	IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
	ID_PACIENTE INT,
	ID_MEDICO INT,
	ID_HOSPITAL INT,
	DATA DATETIME,
	DIAGNOSTICO VARCHAR(50)
);

CREATE TABLE INTERNACAO(
	IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
	ENTRADA DATETIME,
	QUARTO INT,
	SAIDA DATETIME,
	OBSERVACOES VARCHAR(50),
	ID_CONSULTA INT UNIQUE	
);  


ALTER TABLE CONSULTA
ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA
ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA
ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL (IDHOSPITAL);

ALTER TABLE INTERNACAO
ADD CONSTRAINT FK_INTERNACAO_CONSULTA
FOREIGN KEY (ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);



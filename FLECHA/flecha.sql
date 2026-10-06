CREATE DATABASE flecha;
USE flecha;

CREATE TABLE IF NOT EXISTS usuarios (
id_usuario BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
nome_usuario VARCHAR(67) NOT NULL UNIQUE,
senha_usuario VARCHAR (30) NOT NULL,
cargo_usuario ENUM('aluno monitor', 'professor', 'gestor') NOT NULL
);

CREATE TABLE IF NOT EXISTS professores (
id_professor BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
nome_professor VARCHAR(99) NOT NULL UNIQUE,
diciplina_professor VARCHAR(99) NOT NULL,
periodo_escolar ENUM('matutino', 'vespertino', 'integral') NOT NULL 
);

CREATE TABLE IF NOT EXISTS turmas (
id_turma BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
nome_turma VARCHAR(5) NOT NULL UNIQUE,
quantidade_alunos INT NOT NULL,
modalidade ENUM('desenvolvimento de sistemas', 'administração', 'ensino regular', 'formação de docente') NOT NULL,
turno_escolar ENUM('matutino', 'vespertino') NOT NULL,
andar_escolar ENUM('térreo', 'primeiro piso', 'segundo piso') NOT NULL,
sala INT NOT NULL
);

CREATE TABLE IF NOT EXISTS alunos (
id_aluno BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
nome_aluno VARCHAR(99) NOT NULL,
fk_turma_aluno BIGINT,
FOREIGN KEY (fk_turma_aluno) REFERENCES turmas(id_turma),
numero_chamada INT NOT NULL,
cgm_aluno BIGINT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS aparelhos (
id_aparelho BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
marca_aparelho ENUM('vaio','positivo', 'samsung', 'honor', 'xiaomi') NOT NULL,
modelo_aparelho VARCHAR(45) NOT NULL,
tipo_aparelho ENUM('notebook', 'chromebook', 'notebook ds', 'celular', 'tablet') NOT NULL,
numero_aparelho INT NOT NULL, 
patrimonio BIGINT NOT NULL UNIQUE,
observacoes_aparelho VARCHAR(304) NOT NULL,
disponivel BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS carregamentos (
id_carregamento BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
fk_aparelho_carregado BIGINT,
FOREIGN KEY (fk_aparelho_carregado) REFERENCES aparelhos(id_aparelho),
ultima_recarga DATETIME NOT NULL,
carregando BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS emprestimos (
id_emprestimo BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
fk_usuario VARCHAR(99) NOT NULL,
FOREIGN KEY (fk_usuario) REFERENCES usuarios(nome_usuario),
data_emprestimo DATE NOT NULL,
fk_professor VARCHAR(99) NOT NULL,
FOREIGN KEY (fk_professor) REFERENCES professores(nome_professor),  
fk_turma VARCHAR (5) NOT NULL,
FOREIGN KEY (fk_turma) REFERENCES turmas(nome_turma),
aparelho_emprestado ENUM('notebook', 'notebook ds', 'celular', 'tablet') NOT NULL,
quantidade_emprestada INT NOT NULL,
devolucao BOOLEAN NOT NULL
);
 
CREATE TABLE IF NOT EXISTS especificacao_emprestimos(
fk_emprestimo BIGINT,
FOREIGN KEY (fk_emprestimo) REFERENCES emprestimos(id_emprestimo),
fk_aparelho_emprestimo BIGINT,
FOREIGN KEY (fk_aparelho_emprestimo) REFERENCES aparelhos(id_aparelho),
PRIMARY KEY (fk_emprestimo, fk_aparelho_emprestimo)
);

CREATE TABLE IF NOT EXISTS relatorios(
id_relatorio BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
fk_usuario_relatorio VARCHAR(99) NOT NULL,
FOREIGN KEY (fk_usuario_relatorio) REFERENCES usuarios(nome_usuario),
data_relatorio DATE NOT NULL,
aparelho_relatorio ENUM('notebook', 'notebook ds', 'celular', 'tablet') NOT NULL,
quantidade_relatorio INT NOT NULL,
observacoes_relatorio VARCHAR(304) NOT NULL
);

CREATE TABLE IF NOT EXISTS especificacao_relatorios(
fk_relatorio BIGINT,
FOREIGN KEY (fk_relatorio) REFERENCES relatorios(id_relatorio),
fk_emprestimo_relatorio BIGINT,
FOREIGN KEY (fk_emprestimo_relatorio) REFERENCES emprestimos(id_emprestimo),
PRIMARY KEY (fk_relatorio, fk_emprestimo_relatorio)
);

/*
Pesquisa de campo.
VAIO FH15 (DS - 19)
POSITIVO MASTER N4340 (GERAL - 20)
SAMSUNG CHROMEBOOK 4 (GERAL - 10)
SAMSUNG SM - X205 (GERAL - 34)




CELULARES (GERAL - 33)
05 - REDMI NOTE 11 - 310.009.781.352 - 15
26 - REDMI 9A
14 - REDMI 10A
33 - REDMI A1+
22 - REDMI A1+
36 - REDMI NOTE 11
31 - REDMI 94
21 - REDMI 9C
35 - REDMI 9i
17 - GALAXY A03s
18 - HONOR X6s
BIBLIOTECA - REALME C30
29 - REDMI 10C
25 - REDMI 9
01 - REDMI NOTE 11
NADA - REALME C30
08 - REDMI 9C
RASGADO - REDMI NOTE 11
13 - REDMI 12C
10 - REDMI 10A
37 - REDMI 9C
27 - REDMI 10A
28 - REDMI 9i
07 - REDMI NOTE 11
02 - REDMI NOTE 11 - 310.009.777.919 - 20
04 - REDMI 10C
03 - REDMI NOTE 11 - 310.009.777.916 - 17
06 - REDMI NOTE 11
24 - REDMI 12C - 310.009.780.807 - 12
30 - REDMI 9A - 310.009.779.598 - 09
19 - REDMI 10C - 310.009.777.918 - 19
34 - REDMI 9i
23 - REDMI 10
*/

INSERT INTO aparelhos(marca_aparelho, modelo_aparelho, tipo_aparelho, numero_aparelho, patrimonio, observacoes_aparelho, disponivel)
	VALUES('Positivo', 'Master N4340', 'notebook', 1, 100003556941, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 2, 100003556942, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 3, 100003556943, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 4, 100003556944, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 5, 100003556945, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 6, 100003556946, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 7, 100003556947, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 8, 100003556948, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 9, 100003556949, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 10, 100003556950, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 11, 100003556951, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 12, 100003556952, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 13, 100003556953, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 14, 100003556954, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 15, 100003556955, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 16, 100003556956, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 17, 100003556957, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 18, 100003556958, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 19, 100003556959, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 20, 100003556960, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 21, 100003556961, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 22, 100003556962, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 23, 100003556963, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 24, 100003556964, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 25, 100003556965, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 26, 100003556966, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 27, 100003556967, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 28, 100003556968, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 29, 100003556969, 'nenhuma', true),
		  ('Positivo', 'Master N4340', 'notebook', 30, 100003556970, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 1, 310009499715, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 2, 310009499716, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 3, 310009499717, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 4, 310009499718, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 5, 310009499719, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 6, 310009499720, 'nenhuma', true),		  
		  ('Samsung', 'Chromebook 4', 'chromebook', 7, 310009499721, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 8, 310009499722, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 9, 310009499723, 'nenhuma', true),
		  ('Samsung', 'Chromebook 4', 'chromebook', 10, 310009499724, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 1, 10004718704, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 2, 10004718705, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 3, 10004718706, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 4, 10004718707, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 5, 10004718708, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 6, 10004718709, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 7, 10004718710, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 8, 10004718711, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 9, 10004718712, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 10, 10004718713, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 11, 10004718714, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 12, 10004718715, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 13, 10004718716, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 14, 10004718717, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 15, 10004718718, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 16, 10004718719, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 17, 10004718720, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 18, 10004718721, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 19, 10004718722, 'nenhuma', true),
		  ('VAIO', 'FH15', 'notebook ds', 20, 10004718723, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 1, 310009702139, 'nenuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 2, 310009702140, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 3, 310009702141, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 4, 310009702142, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 5, 310009702143, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 6, 310009702144, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 7, 310009702145, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 8, 310009702146, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 9, 310009702147, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 10, 310009702148, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 11, 310009702149, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 12, 310009702150, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 13, 310009702151, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 14, 310009702152, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 15, 310009702153, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 16, 310009702154, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 17, 310009702155, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 18, 310009702156, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 19, 310009702157, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 20, 310009702158, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 21, 310009702159, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 22, 310009702160, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 23, 310009702161, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 24, 310009702162, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 25, 310009702163, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 26, 310009702164, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 27, 310009702165, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 28, 310009702166, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 29, 310009702167, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 30, 310009702168, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 31, 310009702169, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 32, 310009702170, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 33, 310009702171, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 34, 310009702172, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 35, 310009702173, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 36, 310009702174, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 37, 310009702175, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 38, 310009702176, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 39, 310009702177, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 40, 310009702178, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 41, 310009702179, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 42, 310009702180, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 43, 310009702181, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 44, 310009702182, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 45, 310009702183, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 46, 310009702184, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 47, 310009702185, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 48, 310009702186, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 49, 310009702187, 'nenhuma', true),
		  ('Samsung', 'SM-X205', 'tablet', 50, 310009702188, 'nenhuma', true);

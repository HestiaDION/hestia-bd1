-- SCRIPT PARA A GERAÇÃO DO BANCO
-- 21/08 15:00
--  LINK PARA O MODELO LÓGICO UTILIZADO => https://app.brmodeloweb.com/#!/publicview/66c62a7254bfb2f81899fe61


CREATE TABLE universitario 
( 
 username VARCHAR(30) NOT NULL,  
 email VARCHAR(256) NOT NULL,  
 senha TEXT NOT NULL,  
 descricao VARCHAR(500),  
 nome VARCHAR(150) NOT NULL,  
 dne VARCHAR(20) PRIMARY KEY,  
 plano CHAR(1) NOT NULL,  
 foto_perfil TEXT,  
 id_filtros INT,  
 id_anuncio INT
 CHECK (upper(plano) in ('A', 'I')),
 UNIQUE (username,email,id_filtros)
); 

CREATE TABLE anuncio_casa 
( 
 valor FLOAT NOT NULL,  
 id INT PRIMARY KEY,  
 quant_max INT NOT NULL,  
 status CHAR(1) NOT NULL,  
 dt_inicio DATE NOT NULL,  
 dt_expiracao DATE NOT NULL,  
 faculdade VARCHAR(100) NOT NULL,  
 cep INT NOT NULL,  
 quant_quartos INT NOT NULL,  
 numero INT NOT NULL,  
 rua VARCHAR(100) NOT NULL,  
 ponto_ref VARCHAR(150),  
 bairro VARCHAR(100) NOT NULL,  
 cidade VARCHAR(50) NOT NULL,  
 uf CHAR(2) NOT NULL,  
 id_filtros INT,  
 cpf_anunciante CHAR(11) NOT NULL,  
 id_boost INT
 CHECK (valor > 0 AND quant_max > 0 AND upper(status) in ('A', 'I') AND quant_quartos > 0 AND numero > 0),
 UNIQUE (id_filtros)
); 

CREATE TABLE faculdade 
( 
 uf CHAR(2) NOT NULL,  
 cep INT NOT NULL,  
 cidade VARCHAR(50) NOT NULL,  
 rua VARCHAR(100) NOT NULL,  
 id INT PRIMARY KEY,  
 bairro VARCHAR(100) NOT NULL  
); 

CREATE TABLE filtros 
( 
 id INT PRIMARY KEY,  
 nome_filtro VARCHAR(50) NOT NULL, 
 UNIQUE (nome_filtro)
); 

CREATE TABLE boost 
( 
 tipo_boost VARCHAR(50) NOT NULL,  
 valor FLOAT NOT NULL,  
 id INT PRIMARY KEY,  
 dt_inicio DATE NOT NULL,  
 dt_termino DATE NOT NULL,  
 perc_boost FLOAT NOT NULL  
); 

CREATE TABLE anunciante 
( 
 dt_nasc DATE NOT NULL,  
 plano CHAR(1) NOT NULL,  
 email VARCHAR(256) NOT NULL,  
 senha TEXT NOT NULL,  
 cpf CHAR(11) PRIMARY KEY NOT NULL,  
 descricao VARCHAR(200),  
 username VARCHAR(30) NOT NULL,  
 nome VARCHAR(150) NOT NULL,  
 foto_perfil TEXT,  
 CHECK (upper(plano) in ('A', 'I')),
 UNIQUE (email,cpf,username)
); 

CREATE TABLE pagamento 
( 
 id INT PRIMARY KEY,  
 total FLOAT NOT NULL,  
 tipo_pgto VARCHAR(30) NOT NULL,  
 dt_pagto DATE NOT NULL,  
 pct_desconto FLOAT,  
 cpf_anunciante CHAR(11),  
 id_anuncio INT,  
 id_boost INT,  
 id_plano INT,  
 dne VARCHAR(20)  
 CHECK (total > 0)
); 

CREATE TABLE plano 
( 
 id INT PRIMARY KEY,  
 nome_plano VARCHAR(30) NOT NULL,  
 valor FLOAT NOT NULL,  
 dt_inicio DATE NOT NULL,  
 dt_termino DATE NOT NULL,  
 info VARCHAR(200) NOT NULL 
 CHECK (valor > 0)
); 

CREATE TABLE chat 
( 
 codigo INT PRIMARY KEY,  
 tipo_chat CHAR(2) NOT NULL,  
 horario_envio DATE NOT NULL,  
 mensagem TEXT NOT NULL,  
 id_remetente VARCHAR(20) NOT NULL,  
 status VARCHAR(16) NOT NULL,  
 cpf_anunciante CHAR(11) NOT NULL 
 CHECK (upper(tipo_chat) in ('PV', 'GP') AND upper(status) in ('NÃO ENVIADA', 'ENVIADA/NÃO LIDA', 'LIDA'))
); 

CREATE TABLE universitario_facul 
( 
 id INT PRIMARY KEY,  
 codigo_facul INT,  
 dne VARCHAR(20) NOT NULL  
); 

CREATE TABLE universitarios_chat 
( 
 id INT PRIMARY KEY,  
 codigo_chat INT NOT NULL,  
 dne VARCHAR(20)  
); 

CREATE TABLE telefone_anunciante 
( 
 tel CHAR(13) PRIMARY KEY,  
 cpf_anunciante CHAR(11) NOT NULL  
); 

CREATE TABLE regras 
( 
 id INT PRIMARY KEY,  
 id_anuncio INT NOT NULL,  
 regra VARCHAR(150) NOT NULL 
); 

CREATE TABLE fotos 
( 
 id INT PRIMARY KEY,
 url TEXT NOT NULL,  
 id_anuncio INT NOT NULL  
); 

CREATE TABLE telefone_universitario 
( 
 tel CHAR(13) PRIMARY KEY,  
 dne VARCHAR(20) NOT NULL,
); 

ALTER TABLE universitario ADD FOREIGN KEY(id_filtros) REFERENCES filtros (id);
ALTER TABLE universitario ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_filtros) REFERENCES filtros (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(cpf_anunciante) REFERENCES anunciante (cpf);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_boost) REFERENCES boost (id);
ALTER TABLE pagamento ADD FOREIGN KEY(cpf_anunciante) REFERENCES anunciante (cpf);
ALTER TABLE pagamento ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_boost) REFERENCES boost (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_plano) REFERENCES plano (id);
ALTER TABLE pagamento ADD FOREIGN KEY(dne) REFERENCES universitario (dne);
ALTER TABLE chat ADD FOREIGN KEY(cpf_anunciante) REFERENCES anunciante (cpf);
ALTER TABLE universitario_facul ADD FOREIGN KEY(codigo_facul) REFERENCES faculdade (codigo);
ALTER TABLE universitario_facul ADD FOREIGN KEY(dne) REFERENCES universitario (dne);
ALTER TABLE universitarios_chat ADD FOREIGN KEY(codigo_chat) REFERENCES chat (codigo);
ALTER TABLE universitarios_chat ADD FOREIGN KEY(dne) REFERENCES universitario (dne);
ALTER TABLE telefone_anunciante ADD FOREIGN KEY(cpf_anunciante) REFERENCES anunciante (cpf);
ALTER TABLE regras ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE fotos ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE telefone_universitario ADD FOREIGN KEY(dne) REFERENCES universitario (dne)

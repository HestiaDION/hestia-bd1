-- SCRIPT PARA A GERAÇÃO DO BANCO
-- 21/08 15:00
--  LINK PARA O MODELO LÓGICO UTILIZADO => https://app.brmodeloweb.com/#!/publicview/66c62a7254bfb2f81899fe61

-- DROP TABLE admin;
-- DROP TABLE anuncio_filtro;
-- DROP TABLE chat;
-- DROP TABLE universitario_filtro;
-- DROP TABLE telefone_universitario;
-- DROP TABLE foto;
-- DROP TABLE telefone_anunciante;
-- DROP TABLE forum;
-- DROP TABLE faculdade CASCADE;
-- DROP TABLE filtros CASCADE;
-- DROP TABLE anunciante CASCADE;
-- DROP TABLE plano CASCADE;
-- DROP TABLE universitario CASCADE;
-- DROP TABLE anuncio_casa CASCADE;
-- DROP TABLE boost CASCADE;
-- DROP TABLE pagamento CASCADE;

CREATE TABLE admin 
(
 id INT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 email VARCHAR(266) NOT NULL,
 senha VARCHAR(100) NOT NULL,
 UNIQUE(email)
);

CREATE TABLE universitario 
( 
 id INT PRIMARY KEY,
 dne VARCHAR(30) NOT NULL, 
 nome VARCHAR(100) NOT NULL, 
 username VARCHAR(50) NOT NULL,  
 email VARCHAR(266) NOT NULL,  
 senha VARCHAR(100) NOT NULL,  
 genero VARCHAR(50) NOT NULL,
 plano CHAR(1) NOT NULL,  
 foto_perfil TEXT, 
 descricao TEXT,
 id_filtros INT,  
 id_anuncio INT,  
 id_faculdade INT
 CHECK (upper(plano) in ('A', 'I')),
 UNIQUE (username, email,id_filtros, dne)
); 

CREATE TABLE anuncio_casa 
( 
 id INT PRIMARY KEY,
 cep INT NOT NULL,
 tipo_moradia VARCHAR(50) NOT NULL,
 numero INT NOT NULL,
 rua VARCHAR(100) NOT NULL,
 bairro VARCHAR(100) NOT NULL,  
 cidade VARCHAR(100) NOT NULL,  
 uf VARCHAR(2) NOT NULL, 
 quant_quartos INT NOT NULL,
 quant_max INT NOT NULL,
 valor DECIMAL(10, 2) NOT NULL, 
 status CHAR(1) NOT NULL,
 dt_inicio DATE NOT NULL,  
 dt_expiracao DATE NOT NULL,
 faculdade VARCHAR(100) NOT NULL,  
 ponto_ref VARCHAR(100),  
 regras TEXT,
 id_filtros INT,  
 id_anunciante INT NOT NULL,  
 id_boost INT 
 CHECK (valor > 0 AND quant_max > 0 AND upper(status) in ('A', 'I') AND quant_quartos > 0 AND numero > 0),
 UNIQUE (id_filtros)
); 

CREATE TABLE faculdade 
( 
 id INT PRIMARY KEY,
 nome VARCHAR(100),
 cep INT NOT NULL,
 rua VARCHAR(100) NOT NULL,
 bairro VARCHAR(100) NOT NULL,
 cidade VARCHAR(100) NOT NULL,
 uf VARCHAR(2) NOT NULL
); 

CREATE TABLE filtros 
( 
 id INT PRIMARY KEY,  
 nome_filtro VARCHAR(100) NOT NULL,
 UNIQUE (nome_filtro)
); 

CREATE TABLE boost 
( 
 id INT PRIMARY KEY,
 tipo_boost VARCHAR(50) NOT NULL,  
 valor DECIMAL(10, 2) NOT NULL,
 perc_boost DECIMAL(10, 1) NOT NULL,
 dt_inicio DATE NOT NULL,  
 dt_termino DATE NOT NULL,    
 id_pagamento INT 
); 

CREATE TABLE anunciante 
( 
 id INT PRIMARY KEY,
 cpf VARCHAR(11) NOT NULL,
 nome VARCHAR(100) NOT NULL,
 username VARCHAR(100) NOT NULL,    
 email VARCHAR(266) NOT NULL,  
 senha VARCHAR(100) NOT NULL, 
 plano CHAR(1) NOT NULL,
 descricao TEXT,    
 foto_perfil TEXT
 CHECK (upper(plano) in ('A', 'I')),
 UNIQUE (email,cpf,username)
); 

CREATE TABLE pagamento 
( 
 id INT PRIMARY KEY,
 tipo_pgto VARCHAR(50) NOT NULL,
 dt_pagto DATE NOT NULL,
 pct_desconto DECIMAL(10, 2),
 total DECIMAL(10, 2) NOT NULL,    
 id_anunciante INT,  
 id_anuncio INT,  
 id_plano INT,  
 id_universitario INT  
 CHECK (total > 0)
); 

CREATE TABLE plano 
( 
 id INT PRIMARY KEY,  
 nome_plano VARCHAR(100) NOT NULL,  
 valor DECIMAL(10, 2) NOT NULL,  
 dt_inicio DATE NOT NULL,  
 dt_termino DATE NOT NULL,  
 info TEXT NOT NULL
 CHECK (valor > 0)
); 

CREATE TABLE chat 
( 
 id INT PRIMARY KEY,
 id_remetente INT NOT NULL,
 mensagem TEXT NOT NULL,
 horario_envio TIME NOT NULL,
 dt_mensagem DATE NOT NULL,
 status VARCHAR(20) NOT NULL,    
 id_universitario INT NOT NULL,  
 id_anuncio INT,  
 id_forum INT 
 CHECK (upper(status) in ('NÃO ENVIADA', 'ENVIADA/NÃO LIDA', 'LIDA'))
); 

CREATE TABLE telefone_anunciante 
( 
 id INT PRIMARY KEY,
 tel VARCHAR(20) NOT NULL,  
 id_anunciante INT NOT NULL, 
 UNIQUE (tel)
); 

CREATE TABLE foto 
( 
 id INT PRIMARY KEY,
 url TEXT,  
 id_anuncio INT NOT NULL  
); 

CREATE TABLE telefone_universitario 
( 
 id INT PRIMARY KEY,
 tel VARCHAR(20) NOT NULL,  
 id_universitario INT NOT NULL, 
 UNIQUE (tel)
); 

CREATE TABLE universitario_filtro 
( 
 id INT PRIMARY KEY,
 id_filtros INT,  
 id_universitario INT   
); 

CREATE TABLE anuncio_filtro 
( 
 id INT PRIMARY KEY,
 id_filtros INT,  
 id_anuncio INT 
); 

CREATE TABLE forum 
( 
 id INT PRIMARY KEY,  
 nome INT NOT NULL,  
 id_adm INT NOT NULL,  
 descricao TEXT
); 



ALTER TABLE universitario ADD FOREIGN KEY(id_filtros) REFERENCES filtros (id);
ALTER TABLE universitario ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE universitario ADD FOREIGN KEY(id_faculdade) REFERENCES faculdade (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_filtros) REFERENCES filtros (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_anunciante) REFERENCES anunciante (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_boost) REFERENCES boost (id);
ALTER TABLE boost ADD FOREIGN KEY(id_pagamento) REFERENCES pagamento (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_anunciante) REFERENCES anunciante (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_plano) REFERENCES plano (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_universitario) REFERENCES universitario (id);
ALTER TABLE chat ADD FOREIGN KEY(id_universitario) REFERENCES universitario (id);
ALTER TABLE chat ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE chat ADD FOREIGN KEY(id_forum) REFERENCES forum (id);
ALTER TABLE telefone_anunciante ADD FOREIGN KEY(id_anunciante) REFERENCES anunciante (id);
ALTER TABLE foto ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE telefone_universitario ADD FOREIGN KEY(id_universitario) REFERENCES universitario (id);
ALTER TABLE universitario_filtro ADD FOREIGN KEY(id_filtros) REFERENCES filtros (id);
ALTER TABLE universitario_filtro ADD FOREIGN KEY(id_universitario) REFERENCES universitario (id);
ALTER TABLE anuncio_filtro ADD FOREIGN KEY(id_filtros) REFERENCES filtros (id);
ALTER TABLE anuncio_filtro ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
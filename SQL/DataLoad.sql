-- MUDAR TODOS OS ID PARA UUID AO INVÉS DE NUM

INSERT INTO admin (nome, email, senha) VALUES ('Natalia','natalia.santos@germinare.org.br','1234abc?');

INSERT INTO anunciante (cpf, nome, username, email, senha, plano, descricao, foto_perfil) VALUES
	('12345678910', 'Julia Neves', 'julianev', 'julianevs@gmail.com', '402933?a', 'A', 'Sou uma empresária organizada e trabalhadora que gostaria de alugar o apartamento onde morei durante minha formação na Universidade Presbiteriana Mackenzie. Desejo que o local seja utilizado para fins estudantis e, para evitar conflitos ou multas, prefiro estabelecer algumas regras.', 'https://example.com/perfil_julia.jpg'),
	('0987654321', 'Roberto Carvalho', 'robcarvalho', 'carvalhorobert0@gmail.com', '2245def', 'I', 'Sou uma engenheira dedicada e detalhista, atualmente morando no Rio de Janeiro, e estou oferecendo para aluguel o apartamento onde vivi durante minha graduação na Universidade Federal do Rio de Janeiro (UFRJ). Gostaria que o imóvel fosse alugado para estudantes, e para garantir uma boa convivência e evitar problemas, defini algumas regras básicas.', 'https://example.com/perfil_roberto.jpg'),
	('24680135793', 'Augusto Tavares', 'tavaragusto', 'tavares.ag@gmail.com', '35791qa', 'I', 'ou um advogado disciplinado e focado, agora estabelecido em Belo Horizonte, e estou disponibilizando o apartamento que usei durante minha formação na Universidade Federal de Minas Gerais (UFMG). Prefiro que o espaço seja ocupado por estudantes e, para manter a ordem e evitar qualquer inconveniente, estabeleci algumas regras claras.', 'https://example.com/perfil_atavares.jpg');
-- rever urls
INSERT INTO anuncio_casa (cep, tipo_moradia, numero, rua, bairro, cidade, uf, quant_quartos, quant_max, valor, status,
dt_inicio, dt_expiracao, faculdade, ponto_ref, regras, id_anunciante, id_boost) VALUES 
	(12345678, 'Apartamento', 345, 'Rua das Palmeiras', 'Jardim das Flores', 'São Paulo', 'SP', 3, 5, 2500.00, 'I', '2024-10-01', '2025-04-01', 'Universidade Federal de São Paulo', 'Parque Ibirapuera', 'Proibido realizar festas, horário de silêcio a partir das 22h, visitas somente até às 23h', 1, 1),
	(98765432, 'Casa', 120, 'Avenida Brasil', 'Centro', 'Rio de Janeiro', 'RJ', 4, 6, 3800.00, 'A', '2024-09-20', '2025-03-20', 'Universidade do Estado do Rio de Janeiro','Maracanã', 'Manter as áreas comuns limpas, não tocar instrumentos musicais após às 21h', 2, 2),
	('54321987', 'Kitnet', 15, 'Rua dos Lírios', 'Vila Nova', 'Belo Horizonte', 'MG', 1, 2, 1200.00, 'A', '2025-09-25', '2025-03-25', 'Universidade Federal de Minas Gerais', 'Praça da Liberdade', 'Limpeza das áreas comuns será feita de forma alternada (semanalmente), proibido o uso de aparelhos de som acima de 50 decibéis', 3, 3);


INSERT INTO universitario (dne, nome, username, email, senha, genero, plano, foto_perfil, descricao, id_anuncio, id_faculdade) VALUES 
	(1023456789, 'Laura Pereira', 'laura.pereira', 'laura.pereira@gmail.com', 'L@ura2024!', 'Feminino', 'A', 'https://example.com/perfil_laura.jpg', 'Estudante de arquitetura apaixonada por design sustentável e arquitetura minimalista. Gosto de viajar e explorar novos lugares.', 5, 3),
	(2034567890, 'Thiago Almeida', 'thiago.almeida', 'thiago.almeida@rjmail.com', 'Th!agoRJ2024', 'Masculino', 'A', 'https://example.com/perfil_thiago.jpg', 'Carioca, estudante de engenharia civil na UFRJ. Amo praticar esportes, especialmente surf e futebol. Gosto de aproveitar o que o Rio tem de melhor.', 7, 10),
	(3045678901, 'Mariana Souza', 'souzamari', 'mariana.souza@mgmail.com', 'Mar!anaMG2024', 'Feminino', 'I', 'https://example.com/perfil_mariana.jpg', 'Mineira de coração, estudo medicina veterinária na UFMG. Amo animais e a natureza. Nas horas vagas, gosto de fazer trilhas e descobrir novos lugares.', 4, 7);

INSERT INTO forum (nome, id_adm, descricao) VALUES 
	('Moradia do Sol', 1, 'Grupo informativo - Moradia do Sol');

INSERT INTO chat (id_remetente, mensagem, horario_envio, dt_mensagem, status, id_universitario, id_anuncio) VALUES 
	(2, 'Bom dia!', '14:20:00', '2024-09-12', 'ENVIADA/NÃO LIDA', 3, 1);
							
INSERT INTO telefone_anunciante (tel, id_anunciante) 
VALUES 
	(11912345678, 1),
	(21987654321, 2),
	(31246801357, 3);

INSERT INTO telefone_universitario (tel, id_universitario) 
VALUES 
	(119123456333, 1),
	(21987654699, 2),
	(31246801377, 3);

INSERT INTO foto (url, id_anuncio) 
VALUES 
	('https://example.com/apartamento.jpg', 1),
	('https://example.com/casa.jpg', 2),
	('https://example.com/kitnet.jpg', 3);

INSERT INTO universitario_filtro (id_filtros, id_universitario) 
VALUES 
	(1, 1),
	(3, 1),
	(1, 2),
	(2, 2),
	(3, 3);

INSERT INTO anuncio_filtro (id_filtros, id_anuncio) 
VALUES 
	(1, 1),
	(4, 1),
	(1, 2),
	(2, 2),
	(5, 3);
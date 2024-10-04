-- MUDAR TODOS OS ID PARA UUID AO INVÉS DE NUM
INSERT INTO admin ( cNome

				  , cEmail

				  , cSenha

				  )

		   VALUES ( 'Natalia'

				  ,'natalia.santos@germinare.org.br'

				  ,'1234abc?'

				  )

				  ;

INSERT INTO faculdade ( cUf

					  , cCep

					  , cCidade

					  , cRua

					  , cBairro

					  , iNumero

					  , cNome

					  )

			  VALUES  ( 'SP'

					  , '01303-060'

					  , 'São Paulo'

					  , 'Rua da Consolação'

					  , 'Consolação'

					  , 1234

					  , 'Universidade Presbiteriana Mackenzie'

					  )

					  ,

					  ( 'SP'

					  , '01504-001'

					  , 'São Paulo'

					  , 'Rua Vergueiro'

					  , 'Liberdade'

					  , 4321

					  , 'Universidade Paulista (UNIP)'

					  )

					  ,

					  ( 'SP'

					  , '04004-020'

					  , 'São Paulo'

					  , 'Avenida Paulista'

					  , 'Bela Vista'

					  , 5678

					  , 'Fundação Getulio Vargas (FGV)'

					  )

					  ,

					  ( 'SP'

					  , '05508-900'

					  , 'São Paulo'

					  , 'Rua do Matão'

					  , 'Butantã'

					  , 1000

					  , 'Universidade de São Paulo (USP)'

					  )

					  ,

					  ( 'SP'

					  , '05002-072'

					  , 'São Paulo'

					  , 'Rua Cardoso de Almeida'

					  , 'Perdizes'

					  , 785

					  , 'Pontifícia Universidade Católica (PUC-SP)'

					  )

					  ,

					  ( 'SP'

					  , '03178-200'

					  , 'São Paulo'

					  , 'Rua do Oratório'

					  , 'Vila Prudente'

					  , 234

					  , 'Universidade São Judas Tadeu'

					  )

					  ,

					  ( 'SP'

					  , '04503-060'

					  , 'São Paulo'

					  , 'Avenida Faria Lima'

					  , 'Itaim Bibi'

					  , 876

					  , 'Insper - Instituto de Ensino e Pesquisa'

					  )

					  ,

					  ( 'SP'

					  , '03164-000'

					  , 'São Paulo'

					  , 'Rua Taquari'

					  , 'Mooca'

					  , 598

					  , 'Universidade Cidade de São Paulo (UNICID)'

					  )

					  ,

					  ( 'SP'

					  , '01224-001'

					  , 'São Paulo'

					  , 'Rua Itambé'

					  , 'Higienópolis'

					  , 450

					  , 'Faculdade de Direito da Fundação Armando Penteado (FAAP)'

					  )

					  ,

					  ( 'SP'

					  , '05565-080'

					  , 'São Paulo'

					  , 'Avenida Corifeu de Azevedo'

					  , 'Vila Universitária'

					  , 3145

					  , 'Centro Universitário São Camilo'

					  )

					  ;

INSERT INTO anunciante ( cCpf

					   , cNome

					   , cUsername

					   , cEmail

					   , cSenha

					   , cPlano

					   , cDescricao

					   , cFoto_perfil

					   ) 

				VALUES ( '12345678910'

					   , 'Julia Neves'

					   , 'julianev'

					   , 'julianevs@gmail.com'

					   , '402933?a'

					   , 'A'

					   ,'Sou uma empresária organizada e trabalhadora que gostaria de alugar o apartamento onde morei durante minha formação na Universidade

Presbiteriana Mackenzie. Desejo que o local seja utilizado para fins estudantis e, para evitar conflitos ou multas, prefiro estabelecer algumas regras.'

					   ,'https://example.com/perfil_julia.jpg'

					   )

					 , ('0987654321'

					   , 'Roberto Carvalho'

					   , 'robcarvalho'

					   , 'carvalhorobert0@gmail.com'

					   , '2245def'

					   , 'I'

					   ,'Sou uma engenheira dedicada e detalhista, atualmente morando no Rio de Janeiro, e estou oferecendo para aluguel o apartamento

onde vivi durante minha graduação na PUC. Gostaria que o imóvel fosse alugado para

estudantes, e para garantir uma boa convivência e evitar problemas, defini algumas regras básicas.'

					   , 'https://example.com/perfil_roberto.jpg'

					   )

					 , ('24680135793'

					   , 'Augusto Tavares'

					   , 'tavaragusto'

					   , 'tavares.ag@gmail.com'

					   , '35791qa'

					   , 'I'

					   ,'sou um advogado disciplinado e focado, agora estabelecido em Belo Horizonte, e estou disponibilizando o apartamento

que usei durante minha formação na Universidade de São Paulo (USP). Prefiro que o espaço seja ocupado por estudantes e,

para manter a ordem e evitar qualquer inconveniente, estabeleci algumas regras claras.'

					   ,'https://example.com/perfil_atavares.jpg'

					   )

					   ;

INSERT INTO anuncio_casa ( cCep

						 , cTipo_moradia

						 , iNumCasa

						 , cRua

						 , cBairro

						 , cCidade

						 , cUf

						 , iQuant_quartos

						 , iQuant_max

						 , nValor

						 , cStatus

						 , dDt_inicio

						 , dDt_expiracao

						 , cFaculdade

						 , cPonto_ref

						 , cRegras

						 , uId_anunciante
						  
						 , uId_boost

						 )

				  VALUES ( '12345678'

						 , 'Apartamento'

						 , 345

						 , 'Rua das Palmeiras'

						 , 'Jardim das Flores'

						 , 'São Paulo'

						 , 'SP'

						 , 3

						 , 5

						 , 2500.00

						 , 'I'

						 , 2024-10-01

						 , 2025-04-01

						 , 'Universidade Federal de São Paulo'

						 , 'Parque Ibirapuera'

						 , 'Proibido realizar festas, horário de silêcio a partir das 22h, visitas somente até às 23h'

						 , (SELECT id FROM anunciante WHERE username = 'julianev')
						  
						 , null

						 )

					   , ( '98765432'

						 , 'Casa'

						 , 120

						 , 'Avenida Brasil'

						 , 'Centro'

						 , 'Rio de Janeiro'

						 , 'RJ'

						 , 4

						 , 6

						 , 3800.00

						 , 'A'

						 , 2024-09-20

						 , 2025-03-20

						 , 'Universidade do Estado do Rio de Janeiro'

						 , 'Maracanã'

						 , 'Manter as áreas comuns limpas, não tocar instrumentos musicais após às 21h'

						 , (SELECT id FROM anunciante WHERE username = 'robcarvalho')
						  
						 , null

						 )

					   , ('54321987'

						 , 'Kitnet'

						 , 15

						 , 'Rua dos Lírios'

						 , 'Vila Nova'

						 , 'Belo Horizonte'

						 , 'MG'

						 , 1

						 , 2

						 , 1200.00

						 , 'A'

						 , 2025-09-25

						 , 2025-03-25

						 , 'Universidade Federal de Minas Gerais'

						 , 'Praça da Liberdade'

						 , 'Limpeza das áreas comuns será feita de forma alternada (semanalmente), proibido o uso de aparelhos de som acima de 50 decibéis'

						 , (SELECT id FROM anunciante WHERE username = 'tavaragusto')
						  
						 , null

						 )

						 ;


INSERT INTO universitario ( cDne
						  , cNome
						  , cUsername
						  , cEmail
						  , cSenha
						  , cGenero
						  , cPlano
						  , cFoto_perfil
						  , cDescricao
						  , uId_anuncio
						  , uId_faculdade
						  )

						   VALUES 

						   ( '1023456789'
						   , 'Laura Pereira'
						   , 'laura.pereira'
						   , 'laura.pereira@gmail.com'
						   , 'L@ura2024!'
						   , 'Feminino'
						   , 'A'
						   , 'https://example.com/perfil_laura.jpg'
						   , 'Estudante de arquitetura apaixonada por design sustentável e arquitetura minimalista. Gosto de viajar e explorar novos lugares.'
						   , (SELECT id FROM anuncio WHERE nome = '')
						   , (SELECT id FROM faculdade WHERE nome = 'Universidade Presbiteriana Mackenzie')
						   )
						   ,

						   ('2034567890', 'Thiago Almeida', 'thiago.almeida', 'thiago.almeida@rjmail.com', 'Th!agoRJ2024', 'Masculino', 'A', 

							'https://example.com/perfil_thiago.jpg',

						   'Carioca, estudante de engenharia civil na PUC. Amo praticar esportes, especialmente surf e futebol. Gosto de aproveitar o que o Rio tem de melhor.',

							7, (SELECT id FROM faculdade WHERE nome = 'Pontifícia Universidade Católica (PUC-SP)')),

						   ('3045678901', 'Mariana Souza', 'souzamari', 'mariana.souza@mgmail.com', 'Mar!anaMG2024', 'Feminino', 'I', 'https://example.com/perfil_mariana.jpg',

						   'Mineira de coração, estudo medicina veterinária na UFMG. Amo animais e a natureza. Nas horas vagas, gosto de fazer trilhas e descobrir novos lugares.', 

							4, (SELECT id FROM faculdade WHERE nome = 'Universidade de São Paulo (USP)');

INSERT INTO forum ( cNome

				  , uId_adm

				  , cDescricao

				  ) 

			VALUES( 'Moradia do Sol'

				  , 1

				  , 'Grupo informativo - Moradia do Sol'

				  )

				  ;

INSERT INTO chat ( uId_remetente

				 , cMensagem

				 , dHorario_envio

				 , dDt_mensagem

				 , cStatus

				 , uId_universitario

				 , uId_anuncio

				 ) 

		VALUES   ( 2

				 , 'Bom dia!'

				 , 14:20:00

				 , 2024-09-12

				 , 'ENVIADA/NÃO LIDA'

				 , 3

				 , 1

				 )

				 ;

INSERT INTO telefone_anunciante ( cTel

								, uId_anunciante

								)

						 VALUES ( '11912345678'

								, 1

								)

							 ,  ( '21987654321'

								, 2

								)

							 ,  ( '31246801357'

							    , 3

								)

								;

INSERT INTO telefone_universitario ( cTel

								   , id_universitario

								   ) 	   

						    VALUES ( '119123456333'

								   , 1

								   )

								 , ( '21987654699'

								   , 2

								   )

								 , ( '31246801377'

								   , 3

								   )

								   ;

INSERT INTO foto ( cUrl

				 , uId_anuncio

				 ) 

		  VALUES ( 'https://example.com/apartamento.jpg'

				 , 1

				 )

				 ,

				 ( 'https://example.com/casa.jpg'

				 , 2

			     )

				 ,

				 ( 'https://example.com/kitnet.jpg'

				 , 3

				 )

				 ;

INSERT INTO universitario_filtro ( uId_filtros

								 , uId_universitario

								 ) 

						  VALUES (1

								 , 1

								 )

							   , (3

								 , 1

								 )

							   , (1

								 , 2

								 )

							   , (2

								 , 2

								 )

							   , (3

								 , 3

								 )

								 ;

INSERT INTO anuncio_filtro ( uId_filtros

						   , uId_anuncio

						   ) 

					VALUES ( 1

						   , 1

						   )

						 , (4

						   , 1

						   )

						 , (1

						   , 2

						   )

						 , (2

						   , 2

						   )

						 , (5

						   , 3

						   )

						   ;
							
CREATE OR ALTER PROCEDURE dbo.SP_InserirPorFk
( @A)

insert into filtros(cnome, ccategoria) values ('Cachorro', 'animal');
insert into filtros(cnome, ccategoria) values ('Gato', 'animal');
insert into filtros(cnome, ccategoria) values ('Réptil', 'animal');
insert into filtros(cnome, ccategoria) values ('Anfíbio', 'animal');
insert into filtros(cnome, ccategoria) values ('Pássaro', 'animal');
insert into filtros(cnome, ccategoria) values ('Não tenho', 'animal');
insert into filtros(cnome, ccategoria) values ('Gosto muito', 'animal');
insert into filtros(cnome, ccategoria) values ('Possuo alergia', 'animal');
insert into filtros(cnome, ccategoria) values ('Não tenho, mas amo', 'animal');

insert into filtros(cnome, ccategoria) values ('Mulheres', 'genero');
insert into filtros(cnome, ccategoria) values ('Homens', 'genero');
insert into filtros(cnome, ccategoria) values ('Não me importo', 'genero');
insert into filtros(cnome, ccategoria) values ('Outros gêneros', 'genero');

insert into filtros(cnome, ccategoria) values ('1', 'pessoa');
insert into filtros(cnome, ccategoria) values ('2', 'pessoa');
insert into filtros(cnome, ccategoria) values ('3', 'pessoa');
insert into filtros(cnome, ccategoria) values ('4 ou mais', 'pessoa');

insert into filtros(cnome, ccategoria) values ('Fumo socialmente', 'fumo');
insert into filtros(cnome, ccategoria) values ('Não fumo', 'fumo');
insert into filtros(cnome, ccategoria) values ('Fumante', 'fumo');
insert into filtros(cnome, ccategoria) values ('Tentando parar', 'fumo');

insert into filtros(cnome, ccategoria) values ('Não bebo', 'bebida');
insert into filtros(cnome, ccategoria) values ('Bebo com moderação', 'bebida');
insert into filtros(cnome, ccategoria) values ('Ocasiões especiais', 'bebida');
insert into filtros(cnome, ccategoria) values ('Todo dia', 'bebida');
insert into filtros(cnome, ccategoria) values ('Já bebi, mas não bebo mais', 'bebida');
insert into filtros(cnome, ccategoria) values ('Socialmente, aos fins de semana', 'bebida');

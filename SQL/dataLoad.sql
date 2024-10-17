-- Script para a geração do DataLoad

-- DELETES
DELETE FROM Admin;
DELETE FROM Anuncio_Filtro;
DELETE FROM Chat;
DELETE FROM Universitario_Filtro;
DELETE FROM Foto_Anuncio;
DELETE FROM Forum;
DELETE FROM Plano_vantagem;
DELETE FROM Universitario;
DELETE FROM Faculdade;
DELETE FROM Filtro;
DELETE FROM AnuncioCasa;
DELETE FROM Anunciante;
DELETE FROM Plano;
DELETE FROM Boost;
DELETE FROM Pagamento;

--INSERTS
INSERT INTO Admin ( cNome
				  , cEmail
				  , cSenha
				  )
		   VALUES ( 'Natalia'
				  ,'natalia.santos@germinare.org.br'
				  ,'1234abc?'
				  );

INSERT INTO Anunciante ( cNome
					   , cUsername
					   , cEmail
					   , cSenha
                       , dDtNascimento
                       , cGenero
                       , cMunicipio
                       , cPrefixo
                       , cTel
					   , cPlano
					   , cDescricao
					   , cFotoPerfil
					   )
				VALUES ( 'Julia Neves'
					   , 'julianev'
					   , 'julianevs@imob.org.br'
					   , '402933?a'
                       , '1981-04-21'
                       , 'Mulher'
                       , 'São Paulo'
                       , DEFAULT
                       , '11957843248'
                       , '1'
					   , 'Sou uma empresária organizada e trabalhadora que gostaria de alugar o apartamento onde morei durante minha formação na Universidade
Presbiteriana Mackenzie. Desejo que o local seja utilizado para fins estudantis e, para evitar conflitos ou multas, prefiro estabelecer algumas regras.'
					   , 'https://example.com/perfil_julia.jpg'
					   )
					 , ( 'Roberto Carvalho'
					   , 'robcarvalho'
					   , 'carvalhorobert0@gmail.com'
					   , '2245def'
                       , '1998-07-14'
                       , 'Prefiro não informar'
                       , 'Niterói'
                       , DEFAULT
                       , '(21) 92114-5200'
					   , DEFAULT
					   , 'Sou uma engenheira dedicada e detalhista, atualmente morando no Rio de Janeiro, e estou oferecendo para aluguel o apartamento
onde vivi durante minha graduação na PUC. Gostaria que o imóvel fosse alugado para
estudantes, e para garantir uma boa convivência e evitar problemas, defini algumas regras básicas.'
					   , 'https://example.com/perfil_roberto.jpg'
					   )
					 , ( 'Augusto Tavares'
					   , 'tavaragusto'
					   , 'tavares.ag@hotmail.com'
					   , '35791qa'
                       , '2001-09-11'
                       , 'Homem'
                       , 'Carapicuiba'
                       , DEFAULT
                       , '1199359 4857'
					   , DEFAULT
					   , 'Sou um advogado disciplinado e focado, agora estabelecido em Belo Horizonte, e estou disponibilizando o apartamento
que usei durante minha formação na Universidade de São Paulo (USP). Prefiro que o espaço seja ocupado por estudantes e,
para manter a ordem e evitar qualquer inconveniente, estabeleci algumas regras claras.'
					   , 'https://example.com/perfil_atavares.jpg'
					   );

INSERT INTO AnuncioCasa  ( cNmMoradia
                         , cCep
						 , cTipoMoradia
						 , iNumMoradia
						 , cRua
						 , cBairro
						 , cCidade
						 , cUf
						 , iQntQuartos
						 , iQntPessoasMax
						 , nValor
						 , cStatus
						 , dDtInicio
                         , dDtexpiracao
						 , cComplemento
						 , cRegras
						 , uId_Anunciante
						 , uId_Boost
						 )
				  VALUES ( DEFAULT
				         , '12345678'
						 , 'Apartamento'
						 , 345
						 , 'Rua das Palmeiras'
						 , 'Jardim das Flores'
						 , 'São Paulo'
						 , 'SP'
						 , 3
						 , 5
						 , 2500.00
						 , '0'
						 , '2024-10-01'
                         , DEFAULT
						 , 'Parque Ibirapuera'
						 , 'Proibido realizar festas, horário de silêcio a partir das 22h, visitas somente até às 23h'
				         , FN_Anunciante_id('julianev', NULL)
						 , NULL
						 )
					   , ( 'Moradia do Sol'
					     , '98765432'
						 , 'Casa'
						 , 120
						 , 'Avenida Brasil'
						 , 'Centro'
						 , 'Noterói'
						 , 'RJ'
						 , 4
						 , 6
						 , 3800.00
						 , DEFAULT
						 , '2024-09-20'
						 , DEFAULT
					     , 'Maracanã'
						 , 'Manter as áreas comuns limpas, não tocar instrumentos musicais após às 21h'
						 , FN_Anunciante_id('robcarvalho', NULL)
						 , NULL
						 )
					   , ( DEFAULT
					      ,'54321987'
						 , 'Kitnet'
						 , 15
						 , 'Rua dos Lírios'
						 , 'Vila Nova'
						 , 'Belo Horizonte'
						 , 'MG'
						 , 1
						 , 2
						 , 1200.00
						 , DEFAULT
						 , '2025-09-25'
                         , DEFAULT
						 , 'Praça da Liberdade'
						 , 'Limpeza das áreas comuns será feita de forma alternada (semanalmente), proibido o uso de aparelhos de som acima de 50 decibéis'
						 , FN_Anunciante_id('tavaragusto', NULL)
						 , NULL
						 );

INSERT INTO Universitario ( cDne
						  , cNome
						  , cUsername
						  , cEmail
						  , cSenha
                          , dDtNascimento
                          , cGenero
                          , cMunicipio
                          , cPrefixo
                          , cTel
						  , cPlano
						  , cFotoPerfil
						  , cDescricao
						  , uId_anuncio
						  , cNmFaculdade
						  )
				   VALUES ( '1023456789'
						  , 'Laura Pereira'
						  , 'laura.pereira'
						  , 'laura.pereira@gmail.com'
						  , 'L@ura2024!'
                          , '2005-04-12'
						  , 'Feminino'
                          , 'Niterói'
                          , DEFAULT
                          , '21 97645 2332'
						  , '1'
						  , 'https://example.com/perfil_laura.jpg'
					      , 'Estudante de arquitetura apaixonada por design sustentável e arquitetura minimalista. Gosto de viajar e explorar novos lugares.'
					      , FN_AnuncioCasa_id('Moradia do Sol','robcarvalho', NULL)
						  , 'Universidade Presbiteriana Mackenzie'
						  )
						, ( '2034567890'
                          , 'Thiago Almeida'
                          , 'thiago.almeida'
                          , 'thiago.almeida@rjmail.com'
                          , 'Th!agoRJ2024'
                          , '2004-06-05'
                          , 'Masculino'
                          , 'São Paulo'
                          , DEFAULT
                          , '11 99545 4752'
                          , '1'
                          , 'https://example.com/perfil_thiago.jpg'
                          , 'Carioca, estudante de engenharia civil na PUC. Amo praticar esportes, especialmente surf e futebol. Gosto de aproveitar o que o Rio tem de melhor.'
                          ,	NULL
                          , 'Pontifícia Universidade Católica (PUC-SP)'
                          )
					    , ( '3045678901'
                          , 'Mariana Souza'
                          , 'souzamari'
                          , 'mariana.souza@mgmail.com'
                          , 'Mar!anaMG2024'
                          , '2006-11-07'
                          , 'Feminino'
                          , 'São Paulo'
                          , DEFAULT
                          , '11 92457 9374'
                          , DEFAULT
                          , 'https://example.com/perfil_mariana.jpg'
                          , 'Mineira de coração, estudo medicina veterinária na UFMG. Amo animais e a natureza. Nas horas vagas, gosto de fazer trilhas e descobrir novos lugares.'
                          , NULL
                          , 'Universidade de São Paulo (USP)'
                          );

INSERT INTO Forum ( cNome
                  , uIdAdm
                  , cDescricao
                  )
           VALUES ( DEFAULT
                  , FN_AnuncioCasa_Id('Moradia do Sol', 'robcarvalho', NULL)
                  , 'Grupo informativo - Moradia do Sol'
                  );

INSERT INTO Chat ( uIdRemetente
                 , cMensagem
                 , dDtMensagem
                 , cStatus
                 , uId_Universitario
                 , uId_Anuncio
                 , uId_Forum
                 )
          VALUES ( FN_Anunciante_id('robcarvalho', NULL)
                 , 'Bom dia!'
                 , '2024-09-12 14:20:00'
                 , '0'
                 , FN_Universitario_id('laura.pereira', NULL, NULL)
                 , FN_AnuncioCasa_id('Moradia do Sol', 'robcarvalho', NULL)
                 , FN_Forum_id('Moradia do Sol', (FN_Anunciante_id('robcarvalho', NULL)))
                 );

INSERT INTO Foto_Anuncio ( cUrl
                         , uId_anuncio
                         )
                  VALUES ( 'https://example.com/apartamento.jpg'
                         , FN_AnuncioCasa_id('6181dc76-b', 'julianev', NULL)
                         )
                       , ( 'https://example.com/casa.jpg'
                         , FN_AnuncioCasa_id('Moradia do Sol', 'robcarvalho', NULL)
                         )
                       , ( 'https://example.com/kitnet.jpg'
                         , FN_AnuncioCasa_id('8e497177-3', 'tavaragusto', NULL)
                         );

-- INSERT INTO Universitario_Filtro ( uId_Filtro
--                                  , uId_universitario)
--                           VALUES ( 1
--                                  , FN_Universitario_id('laura.pereira', NULL, NULL)
--                                  )
--                                , ( 3
--                                  , FN_Universitario_id('laura.pereira', NULL, NULL)
--                                  )
--                                , ( 1
--                                  , FN_Universitario_id('thiago.almeida', NULL, NULL)
--                                  )
--                                , ( 2
--                                  , FN_Universitario_id('thiago.almeida', NULL, NULL)
--                                  )
--                                , ( 3
--                                  , FN_Universitario_id('souzamari', NULL, NULL)
--                                  );
--
-- INSERT INTO Anuncio_Filtro ( uId_Filtro
--                            , uId_anuncio)
--                     VALUES ( 1
--                            , FN_Anunciante_id('julianev', NULL)
--                            )
--                          , ( 4
--                            , FN_Anunciante_id('julianev', NULL)
--                            )
--                          , ( 1
--                            , FN_Anunciante_id('robcarvalho', NULL, NULL)
--                            )
--                          , ( 2
--                            , FN_Anunciante_id('robcarvalho', NULL, NULL)
--                            )
--                          , ( 5
--                            , FN_Anunciante_id('tavaragusto', NULL, NULL)
--                            );

INSERT INTO Filtro ( cNome
                   , cCategoria
                   )
            VALUES ( 'Cachorro'
                   , 'animal'
                   )
                 , ( 'Gato'
                   , 'animal'
                   )
                 , ( 'Réptil'
                   , 'animal'
                   )
                 , ( 'Anfíbio'
                   , 'animal'
                   )
                 , ( 'Pássaro'
                   , 'animal'
                   )
                 , ( 'Não tenho'
                   , 'animal'
                   )
                 , ( 'Gosto muito'
                   , 'animal'
                   )
                 , ( 'Possuo alergia'
                   , 'animal'
                   )
                 , ( 'Não tenho, mas amo'
                   , 'animal'
                   ); --Categoria: Animal
INSERT INTO Filtro ( cNome
                   , cCategoria
                   ) 
            VALUES ( 'Mulheres'
                   , 'genero'
                   )
                 , ( 'Homens'
                   , 'genero'
                   )
                 , ( 'Não me importo'
                   , 'genero'
                   )
                 , ( 'Outros gêneros'
                   , 'genero'
                   ); --Categoria: Genero
INSERT INTO Filtro ( cNome
                   , cCategoria
                   )
            VALUES ( '1'
                   , 'pessoa'
                   )
                 , ( '2'
                   , 'pessoa'
                   )
                 , ( '3'
                   , 'pessoa'
                   )
                 , ( '4 ou mais'
                   , 'pessoa'
                   ); --Categoria: Pessoa
INSERT INTO Filtro ( cNome
                   , cCategoria
                   )
            VALUES ( 'Fumo socialmente'
                   , 'fumo'
                   )
                 , ('Não fumo'
                   , 'fumo'
                   )
                 , ('Fumante'
                   , 'fumo'
                   )
                 , ('Tentando parar'
                   , 'fumo'
                   ); --Categoria: Fumo
INSERT INTO Filtro ( cNome
                   , cCategoria
                   )
            VALUES ( 'Não bebo'
                   , 'bebida'
                   )
                 , ( 'Bebo com moderação'
                   , 'bebida'
                   )
                 , ( 'Ocasiões especiais'
                   , 'bebida'
                   )
                 , ( 'Todo dia'
                   , 'bebida'
                   )
                 , ( 'Já bebi, mas não bebo mais'
                   , 'bebida'
                   )
                 , ( 'Socialmente, aos fins de semana'
                   , 'bebida'
                   ); --Categoria: Bebida

-- Script para a geração do DataLoad

-- DELETES
DELETE FROM Admin                  ;
DELETE FROM Anuncio_Filtro         ;
DELETE FROM Chat                   ;
DELETE FROM Universitario_Filtro   ;
DELETE FROM Telefone_Universitario ;
DELETE FROM Foto_Anuncio           ;
DELETE FROM Telefone_Anunciante    ;
DELETE FROM Forum                  ;
DELETE FROM Plano_vantagem         ;
DELETE FROM Anuncio_Faculdade      ;
DELETE FROM Universitario          ;
DELETE FROM Faculdade              ;
DELETE FROM Filtro                 ;
DELETE FROM AnuncioCasa            ;
DELETE FROM Anunciante             ;
DELETE FROM Plano                  ;
DELETE FROM Boost                  ;
DELETE FROM Pagamento              ;

--INSERTS
INSERT INTO Admin ( cNome
				  , cEmail
				  , cSenha
				  )
		   VALUES ( 'Natalia'
				  ,'natalia.santos@germinare.org.br'
				  ,'1234abc?'
				  );

INSERT INTO Faculdade ( cUf
					  , cCep
					  , cCidade
					  , cRua
					  , cBairro
					  , iNumFaculdade
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
					, ( 'SP'
					  , '01504-001'
					  , 'São Paulo'
					  , 'Rua Vergueiro'
					  , 'Liberdade'
					  , 4321
					  , 'Universidade Paulista (UNIP)'
					  )
					, ( 'SP'
					  , '04004-020'
					  , 'São Paulo'
					  , 'Avenida Paulista'
					  , 'Bela Vista'
					  , 5678
					  , 'Fundação Getulio Vargas (FGV)'
					  )
					, ( 'SP'
					  , '05508-900'
					  , 'São Paulo'
					  , 'Rua do Matão'
					  , 'Butantã'
					  , 1000
					  , 'Universidade de São Paulo (USP)'
					  )
					, ( 'SP'
					  , '05002-072'
					  , 'São Paulo'
					  , 'Rua Cardoso de Almeida'
					  , 'Perdizes'
					  , 785
					  , 'Pontifícia Universidade Católica (PUC-SP)'
					  )
					, ( 'SP'
					  , '03178-200'
					  , 'São Paulo'
					  , 'Rua do Oratório'
					  , 'Vila Prudente'
					  , 234
					  , 'Universidade São Judas Tadeu'
					  )
					, ( 'SP'
					  , '04503-060'
					  , 'São Paulo'
					  , 'Avenida Faria Lima'
					  , 'Itaim Bibi'
					  , 876
					  , 'Insper - Instituto de Ensino e Pesquisa'
					  )
					, ( 'SP'
					  , '03164-000'
					  , 'São Paulo'
					  , 'Rua Taquari'
					  , 'Mooca'
					  , 598
					  , 'Universidade Cidade de São Paulo (UNICID)'
					  )
					, ( 'SP'
					  , '01224-001'
					  , 'São Paulo'
					  , 'Rua Itambé'
					  , 'Higienópolis'
					  , 450
					  , 'Faculdade de Direito da Fundação Armando Penteado (FAAP)'
					  )
					, ( 'SP'
                      , '05565-080'
                      , 'São Paulo'
                      , 'Avenida Corifeu de Azevedo'
                      , 'Vila Universitária'
                      , 3145
                      , 'Centro Universitário São Camilo'
                      );

INSERT INTO Anunciante ( cCpf
					   , cNome
					   , cUsername
					   , cEmail
					   , cSenha
                       , cGenero
					   , cPlano
					   , cDescricao
					   , cFoto_AnuncioPerfil
					   )
				VALUES ( '12345678910'
					   , 'Julia Neves'
					   , 'julianev'
					   , 'julianevs@gmail.com'
					   , '402933?a'
                       , 'Mulher'
					   , '1'
					   , 'Sou uma empresária organizada e trabalhadora que gostaria de alugar o apartamento onde morei durante minha formação na Universidade
Presbiteriana Mackenzie. Desejo que o local seja utilizado para fins estudantis e, para evitar conflitos ou multas, prefiro estabelecer algumas regras.'
					   , 'https://example.com/perfil_julia.jpg'
					   )
					 , ( '09876543210'
					   , 'Roberto Carvalho'
					   , 'robcarvalho'
					   , 'carvalhorobert0@gmail.com'
					   , '2245def'
                       , 'Prefiro não informar'
					   , DEFAULT
					   , 'Sou uma engenheira dedicada e detalhista, atualmente morando no Rio de Janeiro, e estou oferecendo para aluguel o apartamento
onde vivi durante minha graduação na PUC. Gostaria que o imóvel fosse alugado para
estudantes, e para garantir uma boa convivência e evitar problemas, defini algumas regras básicas.'
					   , 'https://example.com/perfil_roberto.jpg'
					   )
					 , ( '24680135793'
					   , 'Augusto Tavares'
					   , 'tavaragusto'
					   , 'tavares.ag@gmail.com'
					   , '35791qa'
                       , 'Homem'
					   , DEFAULT
					   , 'sou um advogado disciplinado e focado, agora estabelecido em Belo Horizonte, e estou disponibilizando o apartamento
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
						 , iQntPessoas_max
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
				         , FN_Anunciante_id('julianev', NULL, NULL)
						 , NULL
						 )
					   , ( 'Moradia do Sol'
					     , '98765432'
						 , 'Casa'
						 , 120
						 , 'Avenida Brasil'
						 , 'Centro'
						 , 'Rio de Janeiro'
						 , 'RJ'
						 , 4
						 , 6
						 , 3800.00
						 , DEFAULT
						 , '2024-09-20'
						 , DEFAULT
					     , 'Maracanã'
						 , 'Manter as áreas comuns limpas, não tocar instrumentos musicais após às 21h'
						 , FN_Anunciante_id('robcarvalho', NULL, NULL)
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
						 , FN_Anunciante_id('tavaragusto', NULL, NULL)
						 , NULL
						 );

INSERT INTO Universitario ( cDne
						  , cNome
						  , cUsername
						  , cEmail
						  , cSenha
						  , cGenero
						  , cPlano
						  , cFoto_AnuncioPerfil
						  , cDescricao
						  , uId_anuncio
						  , uId_faculdade
						  )
				   VALUES ( '1023456789'
						  , 'Laura Pereira'
						  , 'laura.pereira'
						  , 'laura.pereira@gmail.com'
						  , 'L@ura2024!'
						  , 'Feminino'
						  , '1'
						  , 'https://example.com/perfil_laura.jpg'
					      , 'Estudante de arquitetura apaixonada por design sustentável e arquitetura minimalista. Gosto de viajar e explorar novos lugares.'
					      , FN_AnuncioCasa_id('Moradia do Sol','robcarvalho', NULL)
						  , FN_Faculdade_id('Universidade Presbiteriana Mackenzie')
						  )
						, ( '2034567890'
                          , 'Thiago Almeida'
                          , 'thiago.almeida'
                          , 'thiago.almeida@rjmail.com'
                          , 'Th!agoRJ2024'
                          , 'Masculino'
                          , '1'
                          , 'https://example.com/perfil_thiago.jpg'
                          , 'Carioca, estudante de engenharia civil na PUC. Amo praticar esportes, especialmente surf e futebol. Gosto de aproveitar o que o Rio tem de melhor.'
                          ,	NULL
                          , FN_Faculdade_id('Pontifícia Universidade Católica (PUC-SP)')
                          )
					    , ( '3045678901'
                          , 'Mariana Souza'
                          , 'souzamari'
                          , 'mariana.souza@mgmail.com'
                          , 'Mar!anaMG2024'
                          , 'Feminino'
                          , DEFAULT
                          , 'https://example.com/perfil_mariana.jpg'
                          , 'Mineira de coração, estudo medicina veterinária na UFMG. Amo animais e a natureza. Nas horas vagas, gosto de fazer trilhas e descobrir novos lugares.'
                          , NULL
                          , FN_Faculdade_id('Universidade de São Paulo (USP)')
                          );

INSERT INTO Forum ( cNome
                  , uIdAdm
                  , cDescricao
                  )
           VALUES ( DEFAULT
                  , FN_AnuncioCasa_Id('Moradia do Sol', 'robcarvalho', NULL)
                  , 'Grupo informativo - Moradia do Sol'
                  );

INSERT INTO Chat ( uId_remetente
                 , cMensagem
                 , dHorarioEnvio
                 , dDtMensagem
                 , cStatus
                 , uId_Universitario
                 , uId_Anuncio
                 , uId_Forum
                 )
          VALUES ( FN_Anunciante_id('robcarvalho', NULL, NULL)
                 , 'Bom dia!'
                 , '14:20:00'
                 , '2024-09-12'
                 , '0'
                 , FN_Universitario_id('laura.pereira', NULL, NULL)
                 , FN_AnuncioCasa_id('Moradia do Sol', 'robcarvalho', NULL)
                 , FN_Forum_id('Moradia do Sol', (FN_Anunciante_id('robcarvalho', NULL, NULL)))
                 );

-- INSERT INTO Telefone_Anunciante ( cTel
--                                 , uId_anunciante
--                                 )
--                          VALUES ( '11912345678'
--                                 , 1)
--                               , ( '21987654321'
--                                 , 2)
--                               , ( '31246801357'
--                                 , 3);
--
-- INSERT INTO Telefone_Universitario ( cTel
--                                    , uId_Universitario
--                                    )
--                             VALUES ( '119123456333'
--                                    , 1)
--                                  , ( '21987654699'
--                                    , 2)
--                                  , ( '31246801377'
--                                    , 3);
--
-- INSERT INTO Foto_Anuncio ( cUrl
--                          , uId_anuncio
--                          )
--                   VALUES ( 'https://example.com/apartamento.jpg'
--                          , 1
--                          )
--                        , ( 'https://example.com/casa.jpg'
--                          , 2
--                          )
--                        , ( 'https://example.com/kitnet.jpg'
--                          , 3
--                          );
--
-- INSERT INTO Universitario_Filtro ( uId_Filtro
--                                  , uId_universitario)
--                           VALUES ( 1
--                                  , 1)
--                                , ( 3
--                                  , 1)
--                                , ( 1
--                                  , 2)
--                                , ( 2
--                                  , 2)
--                                , ( 3
--                                  , 3);
--
-- INSERT INTO anuncio_filtro ( uId_Filtro
--                            , uId_anuncio)
--                     VALUES ( 1
--                            , 1)
--                          , ( 4
--                            , 1)
--                          , ( 1
--                            , 2)
--                          , ( 2
--                            , 2)
--                          , ( 5
--                            , 3);

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

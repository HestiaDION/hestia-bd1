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
INSERT INTO Foto_Anuncio ( cUrl
                         , uId_anuncio
                         )
                  VALUES ( 'https://example.com/apartamento.jpg'
                         , FN_AnuncioCasa_id('b0efdc89-c', 'julianev', NULL)
                         )
                       , ( 'https://example.com/casa.jpg'
                         , FN_AnuncioCasa_id('Moradia do Sol', 'robcarvalho', NULL)
                         )
                       , ( 'https://example.com/kitnet.jpg'
                         , FN_AnuncioCasa_id('2b867633-2', 'tavaragusto', NULL)
                         )
;
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

--

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

INSERT INTO Universitario_Filtro ( uId_Filtro
                                 , uId_universitario
)
VALUES ( FN_Filtro_id('mulheres', 'genero')
       , FN_Universitario_id('laura.pereira', NULL, NULL)
)
     , ( FN_Filtro_id('cachorro', 'animal')
       , FN_Universitario_id('laura.pereira', NULL, NULL)
)
     , ( FN_Filtro_id('Socialmente, aos fins de semana', 'bebida')
       , FN_Universitario_id('thiago.almeida', NULL, NULL)
)
     , ( FN_Filtro_id('não me importo', 'genero')
       , FN_Universitario_id('thiago.almeida', NULL, NULL)
)
     , ( FN_Filtro_id('não fumo', 'fumo')
       , FN_Universitario_id('souzamari', NULL, NULL)
);

INSERT INTO Anuncio_Filtro ( uId_Filtro
                           , uId_anuncio)
VALUES ( FN_Filtro_id('mulheres', 'genero')
       , FN_AnuncioCasa_id('b0efdc89-c', 'julianev', null)
)
     , ( FN_Filtro_id('cachorro', 'animal')
       , FN_AnuncioCasa_id('b0efdc89-c', 'julianev', null)
)
     , ( FN_Filtro_id('Socialmente, aos fins de semana', 'bebida')
       , FN_AnuncioCasa_id('Moradia do Sol', 'robcarvalho', null)
)
     , ( FN_Filtro_id('não me importo', 'genero')
       , FN_AnuncioCasa_id('Moradia do Sol', 'robcarvalho', null)
)
     , ( FN_Filtro_id('não fumo', 'fumo')
       , FN_AnuncioCasa_id('2b867633-2', 'tavaragusto', null)
);



-- Mais dados NÃO INSERIDOS gerados pelo CHATGPT
-- -- INSERTS
--
-- INSERT INTO Anunciante ( cNome
--                        , cUsername
--                        , cEmail
--                        , cSenha
--                        , dDtNascimento
--                        , cGenero
--                        , cMunicipio
--                        , cPrefixo
--                        , cTel
--                        , cPlano
--                        , cDescricao
--                        , cFotoPerfil
-- )
-- VALUES ( 'Fernanda Lima'
--        , 'fernandalima'
--        , 'fernanda.lima@imob.org.br'
--        , 'Fernanda!123'
--        , '1990-03-05'
--        , 'Feminino'
--        , 'Porto Alegre'
--        , DEFAULT
--        , '51987654321'
--        , '2'
--        , 'Trabalho como arquiteta e procuro alugar meu apartamento para estudantes. O ambiente é acolhedor e organizado, ideal para quem busca tranquilidade durante os estudos.'
--        , 'https://example.com/perfil_fernanda.jpg'
-- )
--      , ( 'Carlos Silva'
--        , 'carlossilva'
--        , 'carlos.silva@mail.com'
--        , 'Car!os123'
--        , '1985-08-15'
--        , 'Masculino'
--        , 'Curitiba'
--        , DEFAULT
--        , '41987654321'
--        , DEFAULT
--        , 'Sou engenheiro e estou alugando meu apartamento no centro da cidade. O imóvel é perfeito para quem estuda ou trabalha, com fácil acesso ao transporte público.'
--        , 'https://example.com/perfil_carlos.jpg'
-- );
--
-- INSERT INTO AnuncioCasa  ( cNmMoradia
--                          , cCep
--                          , cTipoMoradia
--                          , iNumMoradia
--                          , cRua
--                          , cBairro
--                          , cCidade
--                          , cUf
--                          , iQntQuartos
--                          , iQntPessoasMax
--                          , nValor
--                          , cStatus
--                          , dDtInicio
--                          , dDtexpiracao
--                          , cComplemento
--                          , cRegras
--                          , uId_Anunciante
--                          , uId_Boost
-- )
-- VALUES ( DEFAULT
--        , '11223344'
--        , 'Apartamento'
--        , 678
--        , 'Rua Flores'
--        , 'Vila Jardim'
--        , 'Porto Alegre'
--        , 'RS'
--        , 2
--        , 4
--        , 1800.00
--        , '0'
--        , '2024-11-01'
--        , DEFAULT
--        , 'Próximo ao parque'
--        , 'Proibido fumar dentro do imóvel, manter silêncio após 22h'
--        , FN_Anunciante_id('fernandalima', NULL)
--        , NULL
-- )
--      , ( 'Residência Silva'
--        , '55667788'
--        , 'Casa'
--        , 90
--        , 'Avenida Paraná'
--        , 'Centro'
--        , 'Curitiba'
--        , 'PR'
--        , 3
--        , 5
--        , 3200.00
--        , DEFAULT
--        , '2024-12-01'
--        , DEFAULT
--        , 'Casa térrea'
--        , 'Não são permitidos animais de estimação, horário de silêncio a partir das 23h'
--        , FN_Anunciante_id('carlossilva', NULL)
--        , NULL
-- );
--
-- INSERT INTO Universitario ( cDne
--                           , cNome
--                           , cUsername
--                           , cEmail
--                           , cSenha
--                           , dDtNascimento
--                           , cGenero
--                           , cMunicipio
--                           , cPrefixo
--                           , cTel
--                           , cPlano
--                           , cFotoPerfil
--                           , cDescricao
--                           , uId_anuncio
--                           , cNmFaculdade
-- )
-- VALUES ( '4056789012'
--        , 'Paula Costa'
--        , 'paula.costa'
--        , 'paula.costa@gmail.com'
--        , 'Paul@123!'
--        , '2003-12-25'
--        , 'Feminino'
--        , 'Porto Alegre'
--        , DEFAULT
--        , '51 94567 1234'
--        , '1'
--        , 'https://example.com/perfil_paula.jpg'
--        , 'Estudante de jornalismo, adoro viajar e descobrir novas culturas. Busco um local tranquilo para continuar meus estudos.'
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
--        , 'Universidade Federal do Rio Grande do Sul (UFRGS)'
-- )
--      , ( '5067890123'
--        , 'Lucas Oliveira'
--        , 'lucas.oliveira'
--        , 'lucas.oliveira@mail.com'
--        , 'L!ucas2024'
--        , '2002-02-28'
--        , 'Masculino'
--        , 'Curitiba'
--        , DEFAULT
--        , '41 95432 6789'
--        , '1'
--        , 'https://example.com/perfil_lucas.jpg'
--        , 'Estudante de engenharia mecânica, gosto de esportes e de aproveitar a vida ao ar livre. Estou em busca de um lugar prático e bem localizado.'
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
--        , 'Universidade Tecnológica Federal do Paraná (UTFPR)'
-- );
--
-- INSERT INTO Foto_Anuncio ( cUrl
--                          , uId_anuncio
-- )
-- VALUES ( 'https://example.com/apto_po.jpg'
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
-- )
--      , ( 'https://example.com/casa_ctba.jpg'
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
-- );
--
-- INSERT INTO Universitario_Filtro ( uId_Filtro
--                                  , uId_universitario
-- )
-- VALUES ( FN_Filtro_id('mulheres', 'genero')
--        , FN_Universitario_id('paula.costa', NULL, NULL)
-- )
--      , ( FN_Filtro_id('cachorro', 'animal')
--        , FN_Universitario_id('paula.costa', NULL, NULL)
-- )
--      , ( FN_Filtro_id('não fumo', 'fumo')
--        , FN_Universitario_id('lucas.oliveira', NULL, NULL)
-- );

-- -- INSERÇÃO DOS FILTROS ADICIONAIS PARA OS NOVOS DADOS
--
-- INSERT INTO Anuncio_Filtro ( uId_Filtro
--                            , uId_anuncio)
-- VALUES ( FN_Filtro_id('mulheres', 'genero')
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
-- )
--      , ( FN_Filtro_id('não fumo', 'fumo')
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
-- )
--      , ( FN_Filtro_id('gato', 'animal')
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
-- )
--      , ( FN_Filtro_id('não me importo', 'genero')
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
-- )
--      , ( FN_Filtro_id('socialmente, aos fins de semana', 'bebida')
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
-- )
--      , ( FN_Filtro_id('não fumo', 'fumo')
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
-- );
--
-- -- INSERÇÃO DOS NOVOS CHATS
--
-- INSERT INTO Chat ( uIdRemetente
--                  , cMensagem
--                  , dDtMensagem
--                  , cStatus
--                  , uId_Universitario
--                  , uId_Anuncio
--                  , uId_Forum
-- )
-- VALUES ( FN_Anunciante_id('fernandalima', NULL)
--        , 'Olá, Paula! O apartamento está disponível para visitas a partir de segunda-feira.'
--        , '2024-10-12 10:30:00'
--        , '0'
--        , FN_Universitario_id('paula.costa', NULL, NULL)
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
--        , FN_Forum_id('678', (FN_Anunciante_id('fernandalima', NULL)))
-- )
--      , ( FN_Anunciante_id('carlossilva', NULL)
--        , 'Oi Lucas, que bom que você gostou do imóvel! Podemos agendar uma visita quando for melhor para você.'
--        , '2024-10-12 14:50:00'
--        , '0'
--        , FN_Universitario_id('lucas.oliveira', NULL, NULL)
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
--        , FN_Forum_id('90', (FN_Anunciante_id('carlossilva', NULL)))
-- );
--
-- -- INSERÇÃO DOS NOVOS FORUNS
--
-- INSERT INTO Forum ( cNome
--                   , uIdAdm
--                   , cDescricao
-- )
-- VALUES ( 'Grupo informativo - Apartamento Porto Alegre'
--        , FN_Anunciante_id('fernandalima', NULL)
--        , 'Fórum de comunicação para moradores e interessados no apartamento da Rua Flores, Porto Alegre.'
-- )
--      , ( 'Grupo informativo - Residência Silva'
--        , FN_Anunciante_id('carlossilva', NULL)
--        , 'Fórum de comunicação para a casa disponível na Avenida Paraná, Curitiba.'
-- );
--
-- -- INSERÇÃO DE MAIS FOTOS DE ANÚNCIO
--
-- INSERT INTO Foto_Anuncio ( cUrl
--                          , uId_anuncio
-- )
-- VALUES ( 'https://example.com/apto_fernanda.jpg'
--        , FN_AnuncioCasa_id('678', 'fernandalima', NULL)
-- )
--      , ( 'https://example.com/casa_silva.jpg'
--        , FN_AnuncioCasa_id('90', 'carlossilva', NULL)
-- );


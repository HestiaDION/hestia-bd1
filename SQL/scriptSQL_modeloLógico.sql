-- SCRIPT PARA A GERAÇÃO DO BANCO
-- 21/08 15:00
--  LINK PARA O MODELO LÓGICO UTILIZADO => https://app.brmodeloweb.com/#!/publicview/66c62a7254bfb2f81899fe61

-- DROP TABLE Admin;
-- DROP TABLE Anuncio_Filtro;
-- DROP TABLE Chat;
-- DROP TABLE Universitario_Filtro;
-- DROP TABLE Telefone_Universitario;
-- DROP TABLE Foto;
-- DROP TABLE Telefone_Anunciante;
-- DROP TABLE Forum;
-- DROP TABLE Plano_vantagem;
-- DROP TABLE Anuncio_Faculdade;
-- DROP TABLE Faculdade CASCADE;
-- DROP TABLE Filtros CASCADE;
-- DROP TABLE Anunciante CASCADE;
-- DROP TABLE Plano CASCADE;
-- DROP TABLE Universitario CASCADE;
-- DROP TABLE Anuncio_casa CASCADE;
-- DROP TABLE Boost CASCADE;
-- DROP TABLE Pagamento CASCADE;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE Admin ( id     UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome  VARCHAR(100) NOT NULL
                   , cEmail VARCHAR(266) NOT NULL
                   , cEenha VARCHAR(100) NOT NULL
                   , UNIQUE(cEmail)
                   );

CREATE TABLE Universitario ( id            UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                           , cDne          VARCHAR(30)  NOT NULL
                           , cNome         VARCHAR(100) NOT NULL
                           , cUsername     VARCHAR(50)  NOT NULL
                           , cEmail        VARCHAR(266) NOT NULL
                           , cSenha        VARCHAR(100) NOT NULL
                           , cGenero       VARCHAR(50)  NOT NULL
                           , cPlano        CHAR(1)      NOT NULL    DEFAULT '0'
                           , cFoto_perfil  TEXT             NULL
                           , cDescricao    TEXT             NULL
                           , id_anuncio    UUID             NULL
                           , id_faculdade  UUID         NOT NULL
                           , CHECK ( cPlano in ('0', '1')                                          AND
                                     cEmail ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
                                   )
                           , UNIQUE (cUsername)
                           , UNIQUE (cEmail)
                           , UNIQUE (cDne)
                           );

CREATE TABLE Anuncio_casa ( id              UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                          , cCEP            VARCHAR(9)     NOT NULL
                          , cTipo_moradia   VARCHAR(50)    NOT NULL
                          , iNumCasa        INT            NOT NULL
                          , cRua            VARCHAR(100)   NOT NULL
                          , cBairro         VARCHAR(100)   NOT NULL
                          , cCidade         VARCHAR(100)   NOT NULL
                          , cUF             VARCHAR(2)     NOT NULL
                          , iQnt_quartos    INT            NOT NULL
                          , iQntPessoas_max INT            NOT NULL
                          , nValor          DECIMAL(10, 2) NOT NULL
                          , cStatus         CHAR(1)        NOT NULL    DEFAULT '1'
                          , dDt_inicio      DATE           NOT NULL    DEFAULT CURRENT_DATE
                          , dDt_expiracao   DATE           NOT NULL    DEFAULT CURRENT_DATE + INTERVAL '6 MONTH'
                          , faculdade      VARCHAR(100)   NOT NULL --*************
                          , cPonto_ref      VARCHAR(100)       NULL
                          , cRegras         TEXT               NULL
                          , id_anunciante   UUID           NOT NULL
                          , id_boost        UUID               NULL
                          , CHECK ( nValor > 0 AND iQntPessoas_max > 0 AND
                                    cStatus in ('0', '1')        AND
                                    iQnt_quartos > 0           AND
                                    iNumCasa > 0
                                  )
                          );

CREATE TABLE Faculdade ( id      UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                       , cNome   VARCHAR(100)     NULL
                       , cCEP    VARCHAR(8)   NOT NULL
                       , cRua    VARCHAR(100) NOT NULL
                       , cBairro VARCHAR(100) NOT NULL
                       , cCidade VARCHAR(100) NOT NULL
                       , cUF     VARCHAR(2)   NOT NULL
                       , CHECK (cCEP LIKE ~* '^[0-9]\{5\}-\?[0-9]\{3\}$' )
                       , UNIQUE(cNome)
                       );

CREATE TABLE Filtros ( id    UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                     , cNome VARCHAR(100) NOT NULL
                     , UNIQUE (cNome)
                     );

CREATE TABLE Boost ( id          UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , cTipo_boost VARCHAR(50)    NOT NULL
                   , nValor      DECIMAL(10, 2) NOT NULL
                   , nPct_boost  DECIMAL(10, 1) NOT NULL
                   , CHECK ( nValor > 0      AND
                             nPct_boost >0
                           )
                   );

CREATE TABLE Anunciante ( id           UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                        , cCPF         VARCHAR(14)  NOT NULL
                        , cNome        VARCHAR(100) NOT NULL
                        , cUsername    VARCHAR(100) NOT NULL
                        , cEmail       VARCHAR(266) NOT NULL
                        , cSenha       VARCHAR(100) NOT NULL
                        , cPlano       CHAR(1)      NOT NULL   DEFAULT '0'
                        , cDescricao   TEXT             NULL
                        , cFoto_perfil TEXT             NULL
                        , CHECK ( cPlano in ('0', '1')                     AND
                                  cCPF LIKE ~* '^[0-9]\{3\}.\?[0-9]\{3\}.\?[0-9]\{3\}-\?[0-9]\{2\}$'
                              )
                        , UNIQUE (cEmail)
                        , UNIQUE (cCPF)
                        , UNIQUE (cUsername)
                        );

CREATE TABLE Pagamento ( id                UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                       , cTipo_pgto        VARCHAR(50)    NOT NULL
                       , cAtivo            CHAR(1)        NOT NULL    DEFAULT '-1'
                       , dDt_fim           DATE           NOT NULL
                       , nPct_desconto     DECIMAL(10, 2)     NULL    DEFAULT 0
                       , nTotal            DECIMAL(10, 2) NOT NULL
                       , id_anunciante     UUID               NULL
                       , id_plano          UUID           NOT NULL
                       , id_universitario  UUID               NULL
                       , CHECK ( nTotal > 0                                                  AND
                                 cAtivo ~* '^(-1|0|1)$'                                      AND
                                 nPct_desconto > 0                                           AND
                                (id_anunciante IS NOT NULL OR id_universitario IS NOT NULL) AND
                                (id_anunciante IS NULL OR id_universitario IS NULL)
                               )
                       );

CREATE TABLE Plano ( id         UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome      VARCHAR(100)   NOT NULL
                   , nValor     DECIMAL(10, 2) NOT NULL
                   , cDescricao TEXT           NOT NULL
                   , CHECK (nValor > 0)
                   , UNIQUE(cNome)
                   );

CREATE TABLE Plano_vantagem ( id UUID PRIMARY KEY DEFAULT gen_random_uuid()
                            , cVantagem VARCHAR(100) NOT NULL
                            , cAtivo CHAR(1) NOT NULL DEFAULT '0'
                            , id_plano UUID NOT NULL
                            , CHECK (cAtivo ~* '^(0|1)$')
                            , UNIQUE (cVantagem, id_plano)
                            );

CREATE TABLE Chat ( id                UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                  , id_remetente      UUID        NOT NULL
                  , cMensagem         TEXT        NOT NULL
                  , dHorario_envio    TIME        NOT NULL    DEFAULT CURRENT_TIME AT TIME ZONE 'America/Sao_Paulo'
                  , dDt_mensagem      DATE        NOT NULL    DEFAULT CURRENT_DATE
                  , cStatus           VARCHAR(20) NOT NULL    DEFAULT '-1'
                  , id_universitario  UUID            NULL
                  , id_anuncio        UUID            NULL
                  , id_forum          UUID            NULL
                  , CHECK ( cStatus ~* '^(-1|0|1)$'                               AND
                            NOT (id_universitario IS NULL AND id_anuncio IS NULL)
                          )
                  );
CREATE TABLE Telefone_Anunciante ( id             UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                                 , cPrefixo       VARCHAR(5)  NOT NULL    DEFAULT '+55'
                                 , cTel           VARCHAR(20) NOT NULL
                                 , id_anunciante  UUID        NOT NULL
                                 , CHECK  ( cPrefixo ~* '^+[0-9].*$' AND
                                            cTel ~* '^(\?[0-9]\{2\}[) ]\? \?[0-9]\{5\}[- ]\?\{4\}$'
                                          )
                                 , UNIQUE (cTel)
                                 );

CREATE TABLE Foto ( id          UUID PRIMARY KEY DEFAULT gen_random_uuid()
                  , cUrl        TEXT     NULL
                  , id_anuncio  UUID NOT NULL
); 

CREATE TABLE Telefone_Universitario ( id                UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                                    , cPrefixo          VARCHAR(5)  NOT NULL    DEFAULT '+55'
                                    , cTel              VARCHAR(20) NOT NULL
                                    , id_universitario  UUID        NOT NULL
                                    , CHECK  ( cPrefixo ~* '^+[0-9].*$' AND
                                               cTel ~* '^(\?[0-9]\{2\}[) ]\? \?[0-9]\{5\}[- ]\?\{4\}$'
                                             )
                                    , UNIQUE (cTel)
                                    );

CREATE TABLE Universitario_Filtro ( id                UUID PRIMARY KEY DEFAULT gen_random_uuid()
                                  , id_filtros        UUID NOT NULL
                                  , id_universitario  UUID NOT NULL
                                  );

CREATE TABLE Anuncio_Filtro ( id          UUID PRIMARY KEY DEFAULT gen_random_uuid()
                            , id_filtros  UUID NOT NULL
                            , id_anuncio  UUID NOT NULL
                            );
CREATE TABLE Anuncio_Faculdade ( id UUID PRIMARY KEY DEFAULT gen_random_uuid()
                               , id_anuncio UUID NOT NULL
                               , id_faculdade UUID NOT NULL
                                --PRIMARY KEY (id_anuncio, id_faculdade)
                               );
CREATE TABLE Forum ( id         UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome      VARCHAR(100) NOT NULL
                   , id_adm     UUID         NOT NULL
                   , cDescricao TEXT             NULL
                   );



ALTER TABLE Universitario          ADD FOREIGN KEY (id_anuncio)       REFERENCES Anuncio_casa  (id);
ALTER TABLE Universitario          ADD FOREIGN KEY (id_faculdade)     REFERENCES Faculdade     (id);
ALTER TABLE Anuncio_casa           ADD FOREIGN KEY (id_anunciante)    REFERENCES Anunciante    (id);
ALTER TABLE Anuncio_casa           ADD FOREIGN KEY (id_boost)         REFERENCES Boost         (id);
ALTER TABLE Pagamento              ADD FOREIGN KEY (id_anunciante)    REFERENCES Anunciante    (id);
ALTER TABLE Pagamento              ADD FOREIGN KEY (id_plano)         REFERENCES Plano         (id);
ALTER TABLE Pagamento              ADD FOREIGN KEY (id_universitario) REFERENCES Universitario (id);
ALTER TABLE Plano_vantagem         ADD FOREIGN KEY (id_plano)         REFERENCES Plano         (id);   
ALTER TABLE Chat                   ADD FOREIGN KEY (id_universitario) REFERENCES Universitario (id);
ALTER TABLE Chat                   ADD FOREIGN KEY (id_anuncio)       REFERENCES Anuncio_casa  (id);
ALTER TABLE Chat                   ADD FOREIGN KEY (id_forum)         REFERENCES Forum         (id);
ALTER TABLE Telefone_Anunciante    ADD FOREIGN KEY (id_anunciante)    REFERENCES Anunciante    (id);
ALTER TABLE Foto                   ADD FOREIGN KEY (id_anuncio)       REFERENCES Anuncio_casa  (id);
ALTER TABLE Telefone_Universitario ADD FOREIGN KEY (id_universitario) REFERENCES Universitario (id);
ALTER TABLE Universitario_Filtro   ADD FOREIGN KEY (id_filtros)       REFERENCES Filtros       (id);
ALTER TABLE Universitario_Filtro   ADD FOREIGN KEY (id_universitario) REFERENCES Universitario (id);
ALTER TABLE Anuncio_Filtro         ADD FOREIGN KEY (id_filtros)       REFERENCES Filtros       (id);
ALTER TABLE Anuncio_Filtro         ADD FOREIGN KEY (id_anuncio)       REFERENCES Anuncio_casa  (id);
ALTER TABLE Anuncio_Faculdade      ADD FOREIGN KEY (id_faculdade)     REFERENCES Faculdade     (id);
ALTER TABLE Anuncio_Faculdade      ADD FOREIGN KEY (id_anuncio)       REFERENCES Anuncio_casa  (id);
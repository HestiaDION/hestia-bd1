-- SCRIPT PARA A GERAÇÃO DO BANCO
-- 21/08 15:00
--  LINK PARA O MODELO LÓGICO UTILIZADO => https://app.brmodeloweb.com/#!/publicview/66c62a7254bfb2f81899fe61
-- CREATE DATABASE Hestia;

DROP TABLE Admin                  CASCADE;
DROP TABLE Anuncio_Filtro         CASCADE;
DROP TABLE Chat                   CASCADE;
DROP TABLE Universitario_Filtro   CASCADE;
DROP TABLE Telefone_Universitario CASCADE;
DROP TABLE Foto                   CASCADE;
DROP TABLE Telefone_Anunciante    CASCADE;
DROP TABLE Forum                  CASCADE;
DROP TABLE Plano_vantagem         CASCADE;
DROP TABLE Anuncio_Faculdade      CASCADE;
DROP TABLE Faculdade              CASCADE;
DROP TABLE Filtro                 CASCADE;
DROP TABLE Anunciante             CASCADE;
DROP TABLE Plano                  CASCADE;
DROP TABLE Universitario          CASCADE;
DROP TABLE Anuncio_casa           CASCADE;
DROP TABLE Boost                  CASCADE;
DROP TABLE Pagamento              CASCADE;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE Admin ( uId    UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome  VARCHAR(100) NOT NULL
                   , cEmail VARCHAR(266) NOT NULL
                   , cSenha VARCHAR(100) NOT NULL
                   , UNIQUE(cEmail)
                   );

CREATE TABLE Universitario ( uId           UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                           , cDne          VARCHAR(30)  NOT NULL
                           , cNome         VARCHAR(100) NOT NULL
                           , cUsername     VARCHAR(50)  NOT NULL
                           , cEmail        VARCHAR(266) NOT NULL
                           , cSenha        VARCHAR(100) NOT NULL
                           , cGenero       VARCHAR(50)  NOT NULL
                           , cPlano        CHAR(1)      NOT NULL    DEFAULT '0'
                           , cFotoPerfil   TEXT             NULL
                           , cDescricao    TEXT             NULL
                           , uId_Anuncio   UUID             NULL
                           , uId_Faculdade UUID         NOT NULL
                           , CHECK ( cPlano ~ '(0|1)'                                           AND
                                     cEmail ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
                                   )
                           , UNIQUE (cUsername)
                           , UNIQUE (cEmail)
                           , UNIQUE (cDne)
                           );

CREATE TABLE Anuncio_casa ( uId             UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                          , cNmMoradia      VARCHAR(10)    NOT NULL    DEFAULT substring(gen_random_uuid()::text, 1, 10)
                          , cCEP            VARCHAR(9)     NOT NULL
                          , cTipoMoradia    VARCHAR(50)    NOT NULL
                          , iNumMoradia     INT            NOT NULL
                          , cRua            VARCHAR(100)   NOT NULL
                          , cBairro         VARCHAR(100)   NOT NULL
                          , cCidade         VARCHAR(100)   NOT NULL
                          , cUF             VARCHAR(2)     NOT NULL
                          , iQnt_quartos    INT            NOT NULL
                          , iQntPessoas_max INT            NOT NULL
                          , nValor          DECIMAL(10, 2) NOT NULL
                          , cStatus         CHAR(1)        NOT NULL    DEFAULT '1'
                          , dDtInicio       DATE           NOT NULL    DEFAULT CURRENT_DATE
                          , dDtExpiracao    DATE           NOT NULL    DEFAULT CURRENT_DATE + INTERVAL '6 MONTH'
                          , cComplemento    VARCHAR(100)       NULL
                          , cRegras         TEXT               NULL
                          , uId_Anunciante  UUID           NOT NULL
                          , uId_Boost       UUID               NULL
                          , CHECK ( nValor > 0          AND
                                    iQntPessoas_max > 0 AND
                                    iNumMoradia > 0     AND
                                    cStatus ~ '(0|1)'   AND
                                    iQnt_quartos > 0
                                  )
                          );

CREATE TABLE Faculdade ( uId           UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                       , cNome         VARCHAR(100)     NULL
                       , cCEP          VARCHAR(8)   NOT NULL
                       , iNumFaculdade INT          NOT NULL
                       , cRua          VARCHAR(100) NOT NULL
                       , cBairro       VARCHAR(100) NOT NULL
                       , cCidade       VARCHAR(100) NOT NULL
                       , cUF           VARCHAR(2)   NOT NULL
                       , CHECK ( iNumFaculdade > 0                   AND
                                 cCEP ~ '^[0-9]\{5\}-\?[0-9]\{3\}$'
                               )
                       , UNIQUE(cNome)
                       );

CREATE TABLE Filtro  ( uId        UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                     , cNome      VARCHAR(100) NOT NULL
                     , cCategoria VARCHAR(100) NOT NULL
                     , UNIQUE (cNome)
                     );

CREATE TABLE Boost ( uId         UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , cTipoBoost  VARCHAR(50)    NOT NULL
                   , nValor      DECIMAL(10, 2) NOT NULL
                   , nPctBoost   DECIMAL(3, 1)  NOT NULL
                   , CHECK ( nValor > 0      AND
                             nPctBoost >0
                           )
                   );

CREATE TABLE Anunciante ( uId          UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                        , cCPF         VARCHAR(14)  NOT NULL
                        , cNome        VARCHAR(100) NOT NULL
                        , cUsername    VARCHAR(100) NOT NULL
                        , cEmail       VARCHAR(266) NOT NULL
                        , cSenha       VARCHAR(100) NOT NULL
                        , cGenero       VARCHAR(50) NOT NULL
                        , cPlano       CHAR(1)      NOT NULL   DEFAULT '0'
                        , cDescricao   TEXT             NULL
                        , cFotoPerfil  TEXT             NULL
                        , CHECK ( cPlano ~ '^(0|1)$'                                                AND
                                  cCPF ~ '^[0-9]\{3\}.\?[0-9]\{3\}.\?[0-9]\{3\}-\?[0-9]\{2\}$'
                              )
                        , UNIQUE (cEmail)
                        , UNIQUE (cCPF)
                        , UNIQUE (cUsername)
                        );

CREATE TABLE Pagamento ( uId               UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                       , cAtivo            CHAR(1)        NOT NULL    DEFAULT '-1'
                       , dDtFim            DATE           NOT NULL
                       , nPctDesconto      DECIMAL(3, 1)      NULL    DEFAULT 0
                       , nTotal            DECIMAL(10, 2) NOT NULL
                       , uId_Anunciante    UUID               NULL
                       , uId_Plano         UUID           NOT NULL
                       , uId_Universitario UUID               NULL
                       , CHECK ( nTotal >  0                                                  AND
                                 cAtivo ~ '^(-1|0|1)$'                                        AND
                                 nPctDesconto >= 0                                           AND
                                (uId_Anunciante IS NOT NULL OR uId_Universitario IS NOT NULL) AND
                                (uId_Anunciante IS     NULL OR uId_Universitario IS     NULL)
                               )
                       );

CREATE TABLE Plano ( uId        UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome      VARCHAR(50)    NOT NULL
                   , nValor     DECIMAL(10, 2) NOT NULL
                   , cDescricao TEXT           NOT NULL
                   , CHECK (nValor > 0)
                   , UNIQUE(cNome)
                   );

CREATE TABLE Plano_vantagem ( uId       UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                            , cVantagem VARCHAR(100) NOT NULL
                            , cAtivo    CHAR(1)      NOT NULL DEFAULT '0'
                            , uId_Plano UUID         NOT NULL
                            , CHECK (cAtivo ~ '^(0|1)$')
                            , UNIQUE (cVantagem, uId_Plano)
                            );

CREATE TABLE Chat ( uId               UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                  , cMensagem         TEXT        NOT NULL
                  , dHorarioEnvio     TIME        NOT NULL    DEFAULT (CURRENT_TIME AT TIME ZONE 'America/Sao_Paulo')
                  , dDtMensagem       DATE        NOT NULL    DEFAULT CURRENT_DATE
                  , cStatus           VARCHAR(20) NOT NULL    DEFAULT '-1'
                  , uId_remetente     UUID        NOT NULL
                  , uId_Universitario UUID            NULL
                  , uId_Anuncio       UUID            NULL
                  , uId_Forum         UUID            NULL
                  , CHECK ( cStatus ~ '^(-1|0|1)$'                                 AND
                            NOT (uId_Universitario IS NULL AND uId_Anuncio IS NULL)
                          )
                  );

CREATE TABLE Telefone_Anunciante ( uId            UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                                 , cPrefixo       VARCHAR(5)  NOT NULL    DEFAULT '+55'
                                 , cTel           VARCHAR(20) NOT NULL
                                 , uId_Anunciante UUID        NOT NULL
                                 , CHECK  ( cPrefixo ~ '^+[0-9].*$' AND
                                            cTel ~ '^(\?[0-9]\{2\}[) ]\? \?[0-9]\{5\}[- ]\?\{4\}$'
                                          )
                                 , UNIQUE (cTel)
                                 );

CREATE TABLE Foto ( uId         UUID PRIMARY KEY DEFAULT gen_random_uuid()
                  , cUrl        TEXT     NULL
                  , uId_Anuncio UUID NOT NULL
                  );

CREATE TABLE Telefone_Universitario ( uId               UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                                    , cPrefixo          VARCHAR(5)  NOT NULL    DEFAULT '+55'
                                    , cTel              VARCHAR(20) NOT NULL
                                    , uId_Universitario UUID        NOT NULL
                                    , CHECK  ( cPrefixo ~ '^+[0-9].*$'                               AND
                                               cTel ~ '^(\?[0-9]\{2\}[) ]\? \?[0-9]\{5\}[- ]\?\{4\}$'
                                             )
                                    , UNIQUE (cTel)
                                    );

CREATE TABLE Universitario_Filtro ( uId               UUID PRIMARY KEY DEFAULT gen_random_uuid()
                                  , uId_Filtro        UUID NOT NULL
                                  , uId_Universitario UUID NOT NULL
                                  );

CREATE TABLE Anuncio_Filtro ( uId         UUID PRIMARY KEY DEFAULT gen_random_uuid()
                            , uId_Filtro  UUID NOT NULL
                            , uId_Anuncio UUID NOT NULL
                            );

CREATE TABLE Anuncio_Faculdade ( uId           UUID PRIMARY KEY DEFAULT gen_random_uuid()
                               , uId_Anuncio   UUID NOT NULL
                               , uId_Faculdade UUID NOT NULL
                               );

CREATE TABLE Forum ( uId        UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome      VARCHAR(100) NOT NULL
                   , uId_adm    UUID         NOT NULL
                   , cDescricao TEXT             NULL
                   );



ALTER TABLE Universitario          ADD FOREIGN KEY (uId_Anuncio)       REFERENCES Anuncio_casa  (uId);
ALTER TABLE Universitario          ADD FOREIGN KEY (uId_Faculdade)     REFERENCES Faculdade     (uId);
ALTER TABLE Anuncio_casa           ADD FOREIGN KEY (uId_Anunciante)    REFERENCES Anunciante    (uId);
ALTER TABLE Anuncio_casa           ADD FOREIGN KEY (uId_Boost)         REFERENCES Boost         (uId);
ALTER TABLE Pagamento              ADD FOREIGN KEY (uId_Anunciante)    REFERENCES Anunciante    (uId);
ALTER TABLE Pagamento              ADD FOREIGN KEY (uId_Plano)         REFERENCES Plano         (uId);
ALTER TABLE Pagamento              ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Plano_vantagem         ADD FOREIGN KEY (uId_Plano)         REFERENCES Plano         (uId);
ALTER TABLE Chat                   ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Chat                   ADD FOREIGN KEY (uId_Anuncio)       REFERENCES Anuncio_casa  (uId);
ALTER TABLE Chat                   ADD FOREIGN KEY (uId_Forum)         REFERENCES Forum         (uId);
ALTER TABLE Telefone_Anunciante    ADD FOREIGN KEY (uId_Anunciante)    REFERENCES Anunciante    (uId);
ALTER TABLE Foto                   ADD FOREIGN KEY (uId_Anuncio)       REFERENCES Anuncio_casa  (uId);
ALTER TABLE Telefone_Universitario ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Universitario_Filtro   ADD FOREIGN KEY (uId_Filtro)        REFERENCES Filtro        (uId);
ALTER TABLE Universitario_Filtro   ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Anuncio_Filtro         ADD FOREIGN KEY (uId_Filtro)        REFERENCES Filtro        (uId);
ALTER TABLE Anuncio_Filtro         ADD FOREIGN KEY (uId_Anuncio)       REFERENCES Anuncio_casa  (uId);
ALTER TABLE Anuncio_Faculdade      ADD FOREIGN KEY (uId_Faculdade)     REFERENCES Faculdade     (uId);
ALTER TABLE Anuncio_Faculdade      ADD FOREIGN KEY (uId_Anuncio)       REFERENCES Anuncio_casa  (uId);
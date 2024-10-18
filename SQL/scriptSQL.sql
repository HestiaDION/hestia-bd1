-- SCRIPT PARA A GERAÇÃO DO BANCO
-- 21/08 15:00
--  LINK PARA O MODELO LÓGICO UTILIZADO => https://app.brmodeloweb.com/#!/publicview/66c62a7254bfb2f81899fe61
-- CREATE DATABASE Hestia;

DROP TABLE IF EXISTS Admin                  CASCADE;
DROP TABLE IF EXISTS Anuncio_Filtro         CASCADE;
DROP TABLE IF EXISTS Chat                   CASCADE;
DROP TABLE IF EXISTS Universitario_Filtro   CASCADE;
DROP TABLE IF EXISTS Foto_Anuncio           CASCADE;
DROP TABLE IF EXISTS Forum                  CASCADE;
DROP TABLE IF EXISTS Plano_vantagem         CASCADE;
DROP TABLE IF EXISTS Filtro                 CASCADE;
DROP TABLE IF EXISTS Anunciante             CASCADE;
DROP TABLE IF EXISTS Plano                  CASCADE;
DROP TABLE IF EXISTS Universitario          CASCADE;
DROP TABLE IF EXISTS AnuncioCasa            CASCADE;
DROP TABLE IF EXISTS Boost                  CASCADE;
DROP TABLE IF EXISTS Pagamento              CASCADE;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE Admin ( uId    UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome  VARCHAR(100) NOT NULL
                   , cEmail VARCHAR(266) NOT NULL
                   , cSenha VARCHAR(100) NOT NULL
                   , cFoto  TEXT             NULL
                   , UNIQUE(cEmail)
                   );

CREATE TABLE Universitario ( uId           UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                           , cDne          VARCHAR(30)  NOT NULL
                           , cNome         VARCHAR(100) NOT NULL
                           , cUsername     VARCHAR(50)  NOT NULL
                           , cEmail        VARCHAR(266) NOT NULL
                           , cSenha        VARCHAR(100) NOT NULL
                           , dDtNascimento DATE         NOT NULL
                           , cGenero       VARCHAR(50)  NOT NULL
                           , cMunicipio    VARCHAR(100) NOT NULL
                           , cPrefixo      VARCHAR(5)   NOT NULL    DEFAULT '+55'
                           , cTel          VARCHAR(20)  NOT NULL
                           , cPlano        CHAR(1)      NOT NULL    DEFAULT '0'
                           , cFotoPerfil   TEXT             NULL
                           , cDescricao    TEXT             NULL
                           , uId_Anuncio   UUID             NULL
                           , cNmFaculdade  VARCHAR(100)     NULL
                           , CHECK ( cPlano ~ '^(0|1)$'                                          AND
                                     cPrefixo ~ '^\+[0-9]+$'                                     AND
                                     cEmail ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' AND
                                     cTel ~ '^\(?[0-9]{2}\)? ?[0-9]{5}[- ]?[0-9]{4}$'
                                 )
                           , UNIQUE (cTel)
                           , UNIQUE (cUsername)
                           , UNIQUE (cEmail)
                           , UNIQUE (cDne)
                           );

CREATE TABLE AnuncioCasa (  uId             UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                          , cNmMoradia      VARCHAR(50)    NOT NULL    DEFAULT substring(gen_random_uuid()::text, 1, 10)
                          , cCEP            VARCHAR(9)     NOT NULL
                          , cTipoMoradia    VARCHAR(50)    NOT NULL
                          , iNumMoradia     INT            NOT NULL
                          , cRua            VARCHAR(100)   NOT NULL
                          , cBairro         VARCHAR(100)   NOT NULL
                          , cCidade         VARCHAR(100)   NOT NULL
                          , cUF             VARCHAR(2)     NOT NULL
                          , iQntQuartos     INT            NOT NULL
                          , iQntPessoasMax INT            NOT NULL
                          , nValor          DECIMAL(10, 2) NOT NULL
                          , cStatus         CHAR(1)        NOT NULL    DEFAULT '1'
                          , dDtInicio       DATE           NOT NULL    DEFAULT CURRENT_DATE
                          , dDtExpiracao    DATE           NOT NULL
                          , cComplemento    VARCHAR(100)       NULL
                          , cRegras         TEXT               NULL
                          , uId_Anunciante  UUID           NOT NULL
                          , uId_Boost       UUID               NULL
                          , CHECK ( nValor > 0                                      AND
                                    iQntPessoasMax > 0                             AND
                                    iNumMoradia > 0                                 AND
                                    (dDtExpiracao - INTERVAL '6 MONTH') = dDtInicio AND
                                    cStatus ~ '^(0|1)$'                             AND
                                    iQntQuartos > 0
                                  )
                          );

CREATE TABLE Filtro  ( uId        UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                     , cNome      VARCHAR(100) NOT NULL
                     , cCategoria VARCHAR(100) NOT NULL
                     , UNIQUE (cNome, cCategoria)
                     );

CREATE TABLE Boost ( uId         UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNmBoost    VARCHAR(50)    NOT NULL
                   , nValor      DECIMAL(10, 2) NOT NULL
                   , nPctBoost   DECIMAL(3, 1)  NOT NULL
                   , cDescricao  TEXT           NOT NULL
                   , CHECK ( nValor > 0    AND
                             nPctBoost >0
                           )
                   , UNIQUE(cNmBoost)
                   );

CREATE TABLE Anunciante ( uId                  UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                        , cNome                VARCHAR(100) NOT NULL
                        , cUsername            VARCHAR(100) NOT NULL
                        , cEmail               VARCHAR(266) NOT NULL
                        , cSenha               VARCHAR(100) NOT NULL
                        , dDtNascimento        DATE         NOT NULL
                        , cGenero              VARCHAR(50)  NOT NULL
                        , cMunicipio           VARCHAR(100) NOT NULL
                        , cPrefixo             VARCHAR(5)   NOT NULL    DEFAULT '+55'
                        , cTel                 VARCHAR(20)  NOT NULL
                        , cPlano               CHAR(1)      NOT NULL    DEFAULT '0'
                        , cDescricao           TEXT             NULL
                        , cFotoPerfil          TEXT             NULL
                        , CHECK ( cPlano ~ '^(0|1)$'                                          AND
                                  cPrefixo ~ '^\+[0-9]+$'                                     AND
                                  cEmail ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' AND
                                  cTel ~ '^\(?[0-9]{2}\)? ?[0-9]{5}[- ]?[0-9]{4}$'
                              )
                        , UNIQUE (cEmail)
                        , UNIQUE (cUsername)
                        , UNIQUE (cTel)
                        );

CREATE TABLE Pagamento ( uId               UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                       , cAtivo            CHAR(1)        NOT NULL    DEFAULT '-1'
                       , dDtFim            DATE               NULL
                       , nPctDesconto      DECIMAL(3, 1)      NULL    DEFAULT 0
                       , nTotal            DECIMAL(10, 2) NOT NULL
                       , uId_Anunciante    UUID               NULL
                       , uId_Plano         UUID           NOT NULL
                       , uId_Universitario UUID               NULL
                       , CHECK ( nTotal >  0                                                  AND
                                 cAtivo ~ '^(-1|0|1)$'                                        AND
                                 nPctDesconto >= 0                                            AND
                                (uId_Anunciante IS NOT NULL OR uId_Universitario IS NOT NULL) AND
                                (uId_Anunciante IS     NULL OR uId_Universitario IS     NULL)
                               )
                       );

CREATE TABLE Plano ( uId          UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome        VARCHAR(50)    NOT NULL
                   , cTipoUsuario VARCHAR(50)    NOT NULL
                   , nValor       DECIMAL(10, 2) NOT NULL
                   , cDescricao   TEXT           NOT NULL
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
                  , dDtMensagem       DATE        NOT NULL    DEFAULT (NOW() AT TIME ZONE 'America/Sao_Paulo')
                  , cStatus           VARCHAR(2)  NOT NULL    DEFAULT '-1'
                  , uIdRemetente      UUID        NOT NULL
                  , uId_Universitario UUID            NULL
                  , uId_Anuncio       UUID            NULL
                  , uId_Forum         UUID            NULL
                  , CHECK ( cStatus ~ '^(-1|0|1)$'                                 AND
                            NOT (uId_Universitario IS NULL AND uId_Anuncio IS NULL)
                          )
                  );

CREATE TABLE Foto_Anuncio ( uId         UUID PRIMARY KEY DEFAULT gen_random_uuid()
                          , cUrl        TEXT     NULL
                          , uId_Anuncio UUID NOT NULL
                          );

CREATE TABLE Universitario_Filtro ( uId               UUID PRIMARY KEY DEFAULT gen_random_uuid()
                                  , uId_Filtro        UUID NOT NULL
                                  , uId_Universitario UUID NOT NULL
                                  );

CREATE TABLE Anuncio_Filtro ( uId         UUID PRIMARY KEY DEFAULT gen_random_uuid()
                            , uId_Filtro  UUID NOT NULL
                            , uId_Anuncio UUID NOT NULL
                            );

CREATE TABLE Forum ( uId        UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , cNome      VARCHAR(100) NOT NULL
                   , uIdAdm     UUID         NOT NULL
                   , cDescricao TEXT             NULL
                   );



ALTER TABLE Universitario          ADD FOREIGN KEY (uId_Anuncio)       REFERENCES AnuncioCasa   (uId);
ALTER TABLE AnuncioCasa            ADD FOREIGN KEY (uId_Anunciante)    REFERENCES Anunciante    (uId);
ALTER TABLE AnuncioCasa            ADD FOREIGN KEY (uId_Boost)         REFERENCES Boost         (uId);
ALTER TABLE Pagamento              ADD FOREIGN KEY (uId_Anunciante)    REFERENCES Anunciante    (uId);
ALTER TABLE Pagamento              ADD FOREIGN KEY (uId_Plano)         REFERENCES Plano         (uId);
ALTER TABLE Pagamento              ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Plano_vantagem         ADD FOREIGN KEY (uId_Plano)         REFERENCES Plano         (uId);
ALTER TABLE Chat                   ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Chat                   ADD FOREIGN KEY (uId_Anuncio)       REFERENCES AnuncioCasa   (uId);
ALTER TABLE Chat                   ADD FOREIGN KEY (uId_Forum)         REFERENCES Forum         (uId);
ALTER TABLE Foto_Anuncio           ADD FOREIGN KEY (uId_Anuncio)       REFERENCES AnuncioCasa   (uId);
ALTER TABLE Universitario_Filtro   ADD FOREIGN KEY (uId_Filtro)        REFERENCES Filtro        (uId);
ALTER TABLE Universitario_Filtro   ADD FOREIGN KEY (uId_Universitario) REFERENCES Universitario (uId);
ALTER TABLE Anuncio_Filtro         ADD FOREIGN KEY (uId_Filtro)        REFERENCES Filtro        (uId);
ALTER TABLE Anuncio_Filtro         ADD FOREIGN KEY (uId_Anuncio)       REFERENCES AnuncioCasa   (uId);

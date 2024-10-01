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

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE admin ( id    UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , nome  VARCHAR(100) NOT NULL
                   , email VARCHAR(266) NOT NULL
                   , senha VARCHAR(100) NOT NULL
                   , UNIQUE(email)
                   );

CREATE TABLE universitario ( id           UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                           , dne          VARCHAR(30)  NOT NULL
                           , nome         VARCHAR(100) NOT NULL
                           , username     VARCHAR(50)  NOT NULL
                           , email        VARCHAR(266) NOT NULL
                           , senha        VARCHAR(100) NOT NULL
                           , genero       VARCHAR(50)  NOT NULL
                           , plano        CHAR(1)      NOT NULL
                           , foto_perfil  TEXT             NULL
                           , descricao    TEXT             NULL
                           , id_anuncio   UUID             NULL
                           , id_faculdade UUID         NOT NULL
                           , CHECK (upper(plano) in ('A', 'I'))
                           , UNIQUE (username, email, dne)
                           );

CREATE TABLE anuncio_casa ( id            UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                          , cep           INT            NOT NULL
                          , tipo_moradia  VARCHAR(50)    NOT NULL
                          , numero        INT            NOT NULL
                          , rua           VARCHAR(100)   NOT NULL
                          , bairro        VARCHAR(100)   NOT NULL
                          , cidade        VARCHAR(100)   NOT NULL
                          , uf            VARCHAR(2)     NOT NULL
                          , quant_quartos INT            NOT NULL
                          , quant_max     INT            NOT NULL
                          , valor         DECIMAL(10, 2) NOT NULL
                          , status        CHAR(1)        NOT NULL
                          , dt_inicio     DATE           NOT NULL
                          , dt_expiracao  DATE           NOT NULL
                          , faculdade     VARCHAR(100)   NOT NULL
                          , ponto_ref     VARCHAR(100)       NULL
                          , regras        TEXT               NULL
                          , id_anunciante UUID           NOT NULL
                          , id_boost      UUID               NULL
                          , CHECK (valor > 0 AND quant_max > 0 AND upper(status) in ('A', 'I') AND quant_quartos > 0 AND numero > 0)
                         );

CREATE TABLE faculdade ( id     UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                       , nome   VARCHAR(100)     NULL
                       , cep    INT          NOT NULL
                       , rua    VARCHAR(100) NOT NULL
                       , bairro VARCHAR(100) NOT NULL
                       , cidade VARCHAR(100) NOT NULL
                       , uf     VARCHAR(2)   NOT NULL
                       , UNIQUE(nome)
                       );

CREATE TABLE filtros ( id   UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                     , nome VARCHAR(100) NOT NULL
                     , UNIQUE (nome)
                     );

CREATE TABLE boost ( id UUID PRIMARY KEY DEFAULT gen_random_uuid()
                   , tipo_boost VARCHAR(50) NOT NULL
                   , valor DECIMAL(10, 2) NOT NULL
                   , perc_boost DECIMAL(10, 1) NOT NULL
                   );

CREATE TABLE anunciante ( id UUID PRIMARY KEY DEFAULT gen_random_uuid()
                        , cpf VARCHAR(11) NOT NULL
                        , nome VARCHAR(100) NOT NULL
                        , username VARCHAR(100) NOT NULL
                        , email VARCHAR(266) NOT NULL
                        , senha VARCHAR(100) NOT NULL
                        , plano CHAR(1) NOT NULL
                        , descricao TEXT
                        , foto_perfil TEXT
                        , CHECK (upper(plano) in ('A', 'I'))
                        , UNIQUE (email,cpf,username)
                        );

CREATE TABLE pagamento ( id               UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                       , tipo_pgto        VARCHAR(50)    NOT NULL
                       , ativo            CHAR(1)        NOT NULL
                       , dt_fim           DATE           NOT NULL
                       , pct_desconto     DECIMAL(10, 2)
                       , total            DECIMAL(10, 2) NOT NULL
                       , id_anunciante    UUID               NULL
                       , id_plano         UUID           NOT NULL
                       , id_universitario UUID               NULL
                       , CHECK ( total > 0                                                  AND
                                (id_anunciante IS NOT NULL OR id_universitario IS NOT NULL) AND
                                (id_anunciante IS NULL OR id_universitario IS NULL)         AND
                                ativo ~ '^[0-9]|[A-z]$'
                               )
                       );

CREATE TABLE plano ( id        UUID           PRIMARY KEY DEFAULT gen_random_uuid()
                   , nome      VARCHAR(100)   NOT NULL
                   , valor     DECIMAL(10, 2) NOT NULL
                   , descricao TEXT           NOT NULL
                   , CHECK (valor > 0)
                   , UNIQUE(nome)
                   );

CREATE TABLE chat ( id               UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                  , id_remetente     UUID        NOT NULL
                  , mensagem         TEXT        NOT NULL
                  , horario_envio    TIME        NOT NULL
                  , dt_mensagem      DATE        NOT NULL
                  , status           VARCHAR(20) NOT NULL
                  , id_universitario UUID            NULL
                  , id_anuncio       UUID            NULL
                  , id_forum         UUID            NULL
                  , CHECK ( upper(status) in ('NÃO ENVIADA', 'ENVIADA/NÃO LIDA', 'LIDA') AND
                            NOT (id_universitario IS NULL AND id_anuncio IS NULL)
                          )
                  );

CREATE TABLE telefone_anunciante ( id            UUID        PRIMARY KEY DEFAULT gen_random_uuid()
                                 , tel           VARCHAR(20) NOT NULL
                                 , id_anunciante UUID        NOT NULL
                                 , UNIQUE (tel)
                                 );

CREATE TABLE foto ( id         UUID PRIMARY KEY DEFAULT gen_random_uuid()
                  , url        TEXT     NULL
                  , id_anuncio UUID NOT NULL
); 

CREATE TABLE telefone_universitario ( id UUID PRIMARY KEY DEFAULT gen_random_uuid()
                                    , tel VARCHAR(20) NOT NULL
                                    , id_universitario UUID NOT NULL
                                    , UNIQUE (tel)
                                    );

CREATE TABLE universitario_filtro ( id               UUID PRIMARY KEY DEFAULT gen_random_uuid()
                                  , id_filtros       UUID NOT NULL
                                  , id_universitario UUID NOT NULL
                                  );

CREATE TABLE anuncio_filtro ( id         UUID PRIMARY KEY DEFAULT gen_random_uuid()
                            , id_filtros UUID
                            , id_anuncio UUID
                            );

CREATE TABLE forum ( id        UUID         PRIMARY KEY DEFAULT gen_random_uuid()
                   , nome      VARCHAR(100) NOT NULL
                   , id_adm    UUID         NOT NULL
                   , descricao TEXT
                   );



ALTER TABLE universitario ADD FOREIGN KEY(id_anuncio) REFERENCES anuncio_casa (id);
ALTER TABLE universitario ADD FOREIGN KEY(id_faculdade) REFERENCES faculdade (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_anunciante) REFERENCES anunciante (id);
ALTER TABLE anuncio_casa ADD FOREIGN KEY(id_boost) REFERENCES boost (id);
ALTER TABLE pagamento ADD FOREIGN KEY(id_anunciante) REFERENCES anunciante (id);
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
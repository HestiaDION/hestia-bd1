-- LÓGICAS DE NEGÓCIO
-- VIEWS DO BANCO
-- PROCEDURES DO BANCO

--FUNCTIONS DO BANCO

--Admin
CREATE OR REPLACE FUNCTION FN_Admin_ID
(
    AcEmail VARCHAR(266)
)
    RETURNS UUID AS $$
BEGIN
    RETURN( SELECT Admin.uId
              FROM Admin
             WHERE UPPER(Admin.cEmail) = UPPER(AcEmail)
          );
END;
$$ LANGUAGE plpgsql;

--Universitário
CREATE OR REPLACE FUNCTION FN_Universitario_ID
(
    AcUsername VARCHAR(50)
,   AcEmail    VARCHAR(266)
,   AcDNE      VARCHAR(30)
)
    RETURNS UUID AS $$
BEGIN
     RETURN( SELECT Universitario.uId
               FROM Universitario
              WHERE Universitario.cUsername = AcUsername
                 OR UPPER(Universitario.cEmail) = UPPER(AcEmail)
                 OR Universitario.cDNE = AcDNE
           );
END;
$$ LANGUAGE plpgsql;

-- AnuncioCasa
CREATE OR REPLACE FUNCTION FN_AnuncioCasa_ID
(
    AcNmMoradia VARCHAR(50)
,   AcUsername  VARCHAR(50)
,   AcEmail     VARCHAR(266)
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT AnuncioCasa.uId
               FROM AnuncioCasa
                    INNER JOIN Anunciante ON AnuncioCasa.uid_anunciante = Anunciante.uid
              WHERE UPPER(AnuncioCasa.cNmMoradia) = UPPER(AcNmMoradia)
                AND (
                    Anunciante.cUsername = AcUsername
                    OR  UPPER(Anunciante.cEmail) = UPPER(AcEmail)
                    )
            );
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION FN_AnuncioCasa_Nome
(
    AuId UUID
)
    RETURNS VARCHAR AS $$
BEGIN
    RETURN ( SELECT cNmMoradia
             FROM AnuncioCasa
             WHERE AnuncioCasa.uId_Anunciante = AuId
                OR AnuncioCasa.uId = AuId
           );
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION FN_AnuncioCasa_SetDefault_DtExpiracao()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.dDtexpiracao IS NULL THEN
        NEW.dDtexpiracao := NEW.dDtinicio + INTERVAL '6 months';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Filtro
CREATE OR REPLACE FUNCTION FN_Filtro_ID
(
    AcNome      VARCHAR(100)
,   AcCategoria VARCHAR(100)
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Filtro.uId
               FROM Filtro
              WHERE UPPER(Filtro.cNome) = UPPER(AcNome)
                AND UPPER(Filtro.cCategoria) = UPPER(AcCategoria)
           );
END;
$$ LANGUAGE plpgsql;

--Boost
CREATE OR REPLACE FUNCTION FN_Boost_ID
(
    AcNmBoost VARCHAR(50)
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Boost.uId
               FROM Boost
              WHERE UPPER(Boost.cNmBoost) = UPPER(AcNmBoost)
           );
END;
$$ LANGUAGE plpgsql;

--Plano
CREATE OR REPLACE FUNCTION FN_Plano_ID
(
    AcNome VARCHAR(50)
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Plano.uId
               FROM Plano
              WHERE UPPER(Plano.cNome) = UPPER(AcNome)
           );
END;
$$ LANGUAGE plpgsql;

--Anunciante
CREATE OR REPLACE FUNCTION FN_Anunciante_ID
(
    AcUsername VARCHAR(50)
,   AcEmail    VARCHAR(266)
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Anunciante.uId
               FROM Anunciante
              WHERE Anunciante.cUsername = AcUsername
                 OR UPPER(Anunciante.cEmail) = UPPER(AcEmail)
           );
END;
$$ LANGUAGE plpgsql;

--Pagamento
CREATE OR REPLACE FUNCTION FN_Pagamento_ID
(
    AuIdUsuario UUID
,   AuIdPlano   UUID
,   AdDtFim     DATE
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Pagamento.uId
               FROM Pagamento
              WHERE Pagamento.uId_Anunciante = AuIdUsuario
                AND Pagamento.uid_Plano = AuIdPlano
                AND Pagamento.dDtFim = AdDtFim
           );
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION FN_Pagamento_SetDtFim_FromAtivo()
    RETURNS TRIGGER
AS $$
BEGIN
    IF NEW.cAtivo == '1' THEN
        NEW.dDtFim := CURRENT_DATE + INTERVAL '1 MONTH';
    ELSE IF NEW.cAtivo == '-1' THEN
        NEW.dDtFim := CURRENT_DATE;
    ELSE
        NEW.dDtFim := NULL;
    END IF;
    END IF;

    RETURN NEW;
END;
$$  LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION FN_Pagamento_NotNullDtFim()
    RETURNS TRIGGER
AS $$
BEGIN
    IF NEW.cAtivo != '0' AND NEW.dDtFim IS NULL THEN
        RAISE EXCEPTION 'NULL value in column "dDtFim" of relation "Pagamento" violates not-null constraint when column "cAtivo" is different from "0"';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Plano Vantagem
CREATE OR REPLACE FUNCTION FN_Plano_vantagem_ID
(
    AcVantagem VARCHAR(100)
,   AuId_Plano UUID
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Plano_vantagem.uID
               FROM Plano_vantagem
              WHERE UPPER(Plano_vantagem.cVantagem) = UPPER(AcVantagem)
                AND Plano_vantagem.uID_Plano = AuId_Plano
           );
END;
$$ LANGUAGE plpgsql;

--Foto
CREATE OR REPLACE FUNCTION FN_Foto_ID
(
    AcUrl TEXT
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Foto_Anuncio.uId
               FROM Foto_anuncio
              WHERE Foto_Anuncio.cUrl = AcUrl
           );
END;
$$ LANGUAGE plpgsql;

--Forum
CREATE OR REPLACE FUNCTION FN_Forum_ID
(
    AcNome  VARCHAR(100)
,   AuIdAdm UUID
)
    RETURNS UUID AS $$
BEGIN
    RETURN ( SELECT Forum.uId
               FROM Forum
              WHERE UPPER(Forum.cNome) = UPPER(AcNome)
                AND Forum.uIdAdm = AuIdAdm
           );
END;
$$ LANGUAGE plpgsql;
-- Forum
CREATE OR REPLACE FUNCTION FN_Forum_SetDefaulft_Nome()
    RETURNS TRIGGER
AS $$
BEGIN
    IF NEW.cNome IS NULL THEN
        NEW.cNome := FN_AnuncioCasa_Nome(NEW.uIdAdm);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGERS DO BANCO

--Forum
CREATE OR REPLACE TRIGGER TG_Forum_SetNome
    BEFORE INSERT ON Forum
    FOR EACH ROW
EXECUTE FUNCTION FN_Forum_SetDefaulft_Nome();

--Anuncio Casa
CREATE OR REPLACE TRIGGER TG_AnuncioCasa_SetDTExpiracao
    BEFORE INSERT ON AnuncioCasa
    FOR EACH ROW
EXECUTE FUNCTION FN_AnuncioCasa_SetDefault_DtExpiracao();

--Pagamento
CREATE OR REPLACE TRIGGER TG_Pagamento_UpdateDtFim
    AFTER UPDATE ON Pagamento
    FOR EACH ROW
EXECUTE FUNCTION FN_Pagamento_SetDtFim_FromAtivo();
CREATE OR REPLACE TRIGGER TG_Pagamento_InsertNotNull_DtFIm
    BEFORE INSERT ON Pagamento
    FOR EACH ROW
EXECUTE FUNCTION FN_Pagamento_NotNullDtFim()

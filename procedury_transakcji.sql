USE WypozyczenieSamochodow;
--------------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD oraz transakcji. 
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Kolejność wstawiania danych do bazy.
--------------------------------------------------------------------
/*
	(1) tabele: [Klient], [Pracownik], [WypozyczenieStatus],
				[Producent], [Kategoria];

	(2) tabele: [Model]

	(3) tabele: [Wypozyczenie], [Samochod];

	(4) tabele: [WypozyczenieProdukt];

	(5) tabele: [Kategoria_Cena_Historia], [Klient_Kopia].

*/

--------------------------------------------------------------------
-- Tabela [Klient].
--------------------------------------------------------------------
CREATE PROCEDURE dbo.Klient_Insert
    @Imie varchar(30),
    @Nazwisko varchar(40),
    @NrTelefonu varchar(20),
    @Email varchar(100),
    @Uwagi varchar(255) = NULL
AS
BEGIN
    INSERT INTO dbo.Klient (Imie, Nazwisko, NrTelefonu, Email, Uwagi)
    VALUES (@Imie, @Nazwisko, @NrTelefonu, @Email, @Uwagi);
END;
GO

CREATE PROCEDURE dbo.Klient_Update
    @IdKlient int,
    @Imie varchar(30),
    @Nazwisko varchar(40),
    @NrTelefonu varchar(20),
    @Email varchar(100),
    @Uwagi varchar(255) = NULL
AS
BEGIN
    UPDATE dbo.Klient
    SET Imie = @Imie,
        Nazwisko = @Nazwisko,
        NrTelefonu = @NrTelefonu,
        Email = @Email,
        Uwagi = @Uwagi
    WHERE IdKlient = @IdKlient;
END;
GO

CREATE PROCEDURE dbo.Klient_Delete
    @IdKlient int
AS
BEGIN
    DELETE FROM dbo.Klient
    WHERE IdKlient = @IdKlient;
END;
GO

--------------------------------------------------------------------
-- Tabela [Pracownik].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Pracownik_Insert
    @Imie varchar(30),
    @Nazwisko varchar(40),
    @Stanowisko varchar(60),
    @NrTelefonu varchar(20),
    @Email varchar(100)
AS
BEGIN
    INSERT INTO dbo.Pracownik (Imie, Nazwisko, Stanowisko, NrTelefonu, Email)
    VALUES (@Imie, @Nazwisko, @Stanowisko, @NrTelefonu, @Email);
END;
GO

CREATE PROCEDURE dbo.Pracownik_Update
    @IdPracownik int,
    @Imie varchar(30),
    @Nazwisko varchar(40),
    @Stanowisko varchar(60),
    @NrTelefonu varchar(20),
    @Email varchar(100)
AS
BEGIN
    UPDATE dbo.Pracownik
    SET Imie = @Imie,
        Nazwisko = @Nazwisko,
        Stanowisko = @Stanowisko,
        NrTelefonu = @NrTelefonu,
        Email = @Email
    WHERE IdPracownik = @IdPracownik;
END;
GO

CREATE PROCEDURE dbo.Pracownik_Delete
    @IdPracownik int
AS
BEGIN
    DELETE FROM dbo.Pracownik
    WHERE IdPracownik = @IdPracownik;
END;
GO

--------------------------------------------------------------------
-- Tabela [WypozyczenieStatus].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.WypozyczenieStatus_Insert
    @Status varchar(30)
AS
BEGIN
    INSERT INTO dbo.WypozyczenieStatus ([Status])
    VALUES (@Status);
END;
GO

CREATE PROCEDURE dbo.WypozyczenieStatus_Update
    @IdWypozyczenieStatus int,
    @Status varchar(30)
AS
BEGIN
    UPDATE dbo.WypozyczenieStatus
    SET [Status] = @Status
    WHERE IdWypozyczenieStatus = @IdWypozyczenieStatus;
END;
GO

CREATE PROCEDURE dbo.WypozyczenieStatus_Delete
    @IdWypozyczenieStatus int
AS
BEGIN
    DELETE FROM dbo.WypozyczenieStatus
    WHERE IdWypozyczenieStatus = @IdWypozyczenieStatus;
END;
GO

--------------------------------------------------------------------
-- Tabela [Producent].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Producent_Insert
    @ProducentNazwa varchar(30)
AS
BEGIN
    INSERT INTO dbo.Producent (ProducentNazwa)
    VALUES (@ProducentNazwa);
END;
GO

CREATE PROCEDURE dbo.Producent_Update
    @IdProducent int,
    @ProducentNazwa varchar(30)
AS
BEGIN
    UPDATE dbo.Producent
    SET ProducentNazwa = @ProducentNazwa
    WHERE IdProducent = @IdProducent;
END;
GO

CREATE PROCEDURE dbo.Producent_Delete
    @IdProducent int
AS
BEGIN
    DELETE FROM dbo.Producent
    WHERE IdProducent = @IdProducent;
END;
GO

--------------------------------------------------------------------
-- Tabela [Kategoria].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Kategoria_Insert
    @KategoriaNazwa nchar(30),
    @CzenaZaDzien money
AS
BEGIN
    INSERT INTO dbo.Kategoria (KategoriaNazwa, CzenaZaDzien)
    VALUES (@KategoriaNazwa, @CzenaZaDzien);
END;
GO

CREATE PROCEDURE dbo.Kategoria_Update
    @IdKategoria int,
    @KategoriaNazwa nchar(30),
    @CzenaZaDzien money
AS
BEGIN
    UPDATE dbo.Kategoria
    SET KategoriaNazwa = @KategoriaNazwa,
        CzenaZaDzien = @CzenaZaDzien
    WHERE IdKategoria = @IdKategoria;
END;
GO

CREATE PROCEDURE dbo.Kategoria_Delete
    @IdKategoria int
AS
BEGIN
    DELETE FROM dbo.Kategoria
    WHERE IdKategoria = @IdKategoria;
END;
GO

--------------------------------------------------------------------
-- Tabela [Model].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Model_Insert
	@IdModel int,
    @ModelNazwa varchar(5),
    @IdProducent int
AS
BEGIN
    INSERT INTO dbo.Model (IdModel, ModelNazwa, IdProducent)
    VALUES (@IdModel, @ModelNazwa, @IdProducent);
END;
GO

CREATE PROCEDURE dbo.Model_Update
    @IdModel int,
    @ModelNazwa varchar(5),
    @IdProducent int
AS
BEGIN
    UPDATE dbo.Model
    SET ModelNazwa = @ModelNazwa,
        IdProducent = @IdProducent
    WHERE IdModel = @IdModel;
END;
GO

CREATE PROCEDURE dbo.Model_Delete
    @IdModel int
AS
BEGIN
    DELETE FROM dbo.Model
    WHERE IdModel = @IdModel;
END;
GO

--------------------------------------------------------------------
-- Tabela [Wypozyczenie].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Wypozyczenie_Insert
    @IdKlient int,
    @IdPracownik int,
    @IdWypozyczenieStatus int,
    @DataZlorzenia date,
    @KwotaLaczna money,
    @Uwagi varchar(255) = NULL
AS
BEGIN
    INSERT INTO dbo.Wypozyczenie (IdKlient, IdPracownik, IdWypozyczenieStatus, DataZlorzenia, KwotaLaczna, Uwagi)
    VALUES (@IdKlient, @IdPracownik, @IdWypozyczenieStatus, @DataZlorzenia, @KwotaLaczna, @Uwagi);
END;
GO

CREATE PROCEDURE dbo.Wypozyczenie_Update
    @IdWypozyczenie int,
    @IdKlient int,
    @IdPracownik int,
    @IdWypozyczenieStatus int,
    @DataZlorzenia date,
    @KwotaLaczna money,
    @Uwagi varchar(255) = NULL
AS
BEGIN
    UPDATE dbo.Wypozyczenie
    SET IdKlient = @IdKlient,
        IdPracownik = @IdPracownik,
        IdWypozyczenieStatus = @IdWypozyczenieStatus,
        DataZlorzenia = @DataZlorzenia,
        KwotaLaczna = @KwotaLaczna,
        Uwagi = @Uwagi
    WHERE IdWypozyczenie = @IdWypozyczenie;
END;
GO

CREATE PROCEDURE dbo.Wypozyczenie_Delete
    @IdWypozyczenie int
AS
BEGIN
    DELETE FROM dbo.Wypozyczenie
    WHERE IdWypozyczenie = @IdWypozyczenie;
END;
GO

--------------------------------------------------------------------
-- Tabela [Samochod].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Samochod_Insert
    @Nazwa nchar(30),
    @wymiary nchar(30),
    @masa int,
    @RozstawOsi int,
    @MocSilnika int,
    @Spalanie float,
    @Pojemnosc_Ludzie int,
    @Nosnosc float,
    @ZuzyciePaliwa float,
    @StanMagazynowy bit,
    @IdKategoria int,
    @IdModel int
AS
BEGIN
    INSERT INTO dbo.Samochod (Nazwa, wymiary, masa, RozstawOsi, MocSilnika, Spalanie, Pojemnosc_Ludzie, Nosnosc, ZuzyciePaliwa, GotowyDoWypozyczenia, IdKategoria, IdModel)
    VALUES (@Nazwa, @wymiary, @masa, @RozstawOsi, @MocSilnika, @Spalanie, @Pojemnosc_Ludzie, @Nosnosc, @ZuzyciePaliwa, @StanMagazynowy, @IdKategoria, @IdModel);
END;
GO

CREATE PROCEDURE dbo.Samochod_Update
    @IdSamochod int,
    @Nazwa nchar(30),
    @wymiary nchar(30),
    @masa int,
    @RozstawOsi int,
    @MocSilnika int,
    @Spalanie float,
    @Pojemnosc_Ludzie int,
    @Nosnosc float,
    @ZuzyciePaliwa float,
    @StanMagazynowy bit,
    @IdKategoria int,
    @IdModel int
AS
BEGIN
    UPDATE dbo.Samochod
    SET Nazwa = @Nazwa,
        wymiary = @wymiary,
        masa = @masa,
        RozstawOsi = @RozstawOsi,
        MocSilnika = @MocSilnika,
        Spalanie = @Spalanie,
        Pojemnosc_Ludzie = @Pojemnosc_Ludzie,
        Nosnosc = @Nosnosc,
        ZuzyciePaliwa = @ZuzyciePaliwa,
        GotowyDoWypozyczenia = @StanMagazynowy,
        IdKategoria = @IdKategoria,
        IdModel = @IdModel
    WHERE IdSamochod = @IdSamochod;
END;
GO

CREATE PROCEDURE dbo.Samochod_Delete
    @IdSamochod int
AS
BEGIN
    DELETE FROM dbo.Samochod
    WHERE IdSamochod = @IdSamochod;
END;
GO

--DROP PROCEDURE dbo.Samochod_Insert;
--------------------------------------------------------------------
-- Tabela [WypozyczenieSamochod].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.WypozyczenieSamochod_Wstaw
@Par_IdWypozyczenie int, 
@Par_IdSamochod int, 
@Par_KwotaLaczna money, 
@Par_DataGodzOd datetime, 
@Par_DataGodzDo datetime, 
@Par_TerminZwrotu datetime, 
@Par_Uwagi nchar(255)
AS
BEGIN
SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @Var_GotowyDoWypozyczenia bit;
DECLARE @Var_CenaZaDzien money;

SELECT @Var_GotowyDoWypozyczenia = GotowyDoWypozyczenia
FROM dbo.Samochod
WHERE IdSamochod = @Par_IdSamochod

IF(@Var_GotowyDoWypozyczenia = 1)
BEGIN
	SELECT @Var_CenaZaDzien = k.CzenaZaDzien
	FROM dbo.Kategoria k
	JOIN dbo.Samochod s ON k.IdKategoria = s.IdKategoria
	WHERE s.IdSamochod = @Par_IdSamochod;

	SELECT @Par_KwotaLaczna = @Par_KwotaLaczna + (@Var_CenaZaDzien * (DATEDIFF(HOUR, @Par_DataGodzOd, @Par_DataGodzDo) / 24.0));

	INSERT dbo.WypozyczenieSamochod
	(IdWypozyczenie, IdSamochod, KwotaLaczna, DataGodzOd, DataGodzDo, TerminZwrotu, Uwagi)
	VALUES
	(@Par_IdWypozyczenie, @Par_IdSamochod, @Par_KwotaLaczna, @Par_DataGodzOd, @Par_DataGodzDo, @Par_TerminZwrotu, @Par_Uwagi)

	UPDATE dbo.Wypozyczenie
	SET KwotaLaczna = @Par_KwotaLaczna
	WHERE IdWypozyczenie = @Par_IdWypozyczenie;

	--Zmniejszenie stanu magazynowego--
	UPDATE dbo.Samochod
	SET GotowyDoWypozyczenia = 0
	WHERE IdSamochod = @Par_IdSamochod;
END
IF(@@ERROR <> 0)
BEGIN
	RAISERROR('Synchronizacja WypozyczenieSamochod error', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION
END;
GO

--DROP PROCEDURE dbo.WypozyczenieSamochod_Wstaw;

--------------------------------------------------------------------
-- Tabela [Kategoria_Cena_Historia].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Kategoria_ZmienCena
@Par_IdKategoria int,
@Par_KategoriaNazwa nchar(30),
@Par_CzenaZaDzien money
AS
BEGIN
SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @Var_CenaPoprzednia money;

-- PobraniePoprzedniejCeny --

SELECT @Var_CenaPoprzednia = CzenaZaDzien
FROM dbo.Kategoria
WHERE IdKategoria = @Par_IdKategoria

-- Modyfikacja danych --
UPDATE dbo.Kategoria
SET KategoriaNazwa = @Par_KategoriaNazwa, 
	CzenaZaDzien = @Par_CzenaZaDzien
WHERE IdKategoria = @Par_IdKategoria;

-- Zapiesanie wiersza w tabeli historii --
IF ((@Var_CenaPoprzednia IS NOT NULL) AND (@Var_CenaPoprzednia <> @Par_CzenaZaDzien))
	INSERT  dbo.Kategoria_Cena_Historia
	(IdKategoria, DataGodzZmiany, CenaPoprzednia, CenaNowa)
	VALUES
	(@Par_IdKategoria, GETDATE(), @Var_CenaPoprzednia, @Par_CzenaZaDzien);

IF(@@ERROR <> 0)
BEGIN
	RAISERROR('ZmienCena kategoria error', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION
END;
GO

--------------------------------------------------------------------
-- Tabela [Klient_Kopia].
--------------------------------------------------------------------

CREATE PROCEDURE dbo.Klient_Archiwizuj
@Par_IdKlient int
AS
BEGIN
SET XACT_ABORT ON;
BEGIN TRANSACTION

--kopiowanie--
INSERT dbo.Klient_Kopia
(IdKlient, Imie, Nazwisko, NrTelefonu, Email, Uwagi)
SELECT IdKlient, Imie, Nazwisko, NrTelefonu, Email, Uwagi
FROM dbo.Klient
WHERE IdKlient = @Par_IdKlient;

--usuniencie--
DELETE dbo.Klient
WHERE IdKlient = @Par_IdKlient;

IF(@@ERROR <> 0)
BEGIN
	RAISERROR('Archiwizacja danyh klienta error', 16, 1);
	ROLLBACK TRANSACTION
END
ELSE
	COMMIT TRANSACTION
END;
GO
CREATE PROCEDURE GetAllCarsWithBranch
AS
BEGIN
    SELECT *
    FROM dbo.Samochod
    UNION ALL
    SELECT *
    FROM LS_SQL2.WypozyczenieSamochodow.dbo.Samochod
    ORDER BY GotowyDoWypozyczenia;
END;
GO

CREATE OR ALTER PROCEDURE GetIntersectKlientRowsFromServers
    @Server NVARCHAR(100)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = 
        'SELECT Imie, Nazwisko, NrTelefonu, Email FROM dbo.Klient ' +
        'INTERSECT ' +
        'SELECT Imie, Nazwisko, NrTelefonu, Email FROM [' + @Server + '].S18_C10.dbo.Klient';

    EXEC sp_executesql @SQL;
END;
GO

--DROP PROCEDURE GetIntersectKlientRowsFromServers;


CREATE OR ALTER PROCEDURE GetClientOrderSummaryByPhoneNumber
    @Server NVARCHAR(100)
AS
BEGIN
    DECLARE @PhoneNumber VARCHAR(20);
    DECLARE @Id INT;
    DECLARE @OrderCountCurrent INT;
    DECLARE @OrderCountRemote INT;
    DECLARE @SQL NVARCHAR(MAX);

    CREATE TABLE #ClientOrders (
        Imie NVARCHAR(30),
        Nazwisko NVARCHAR(40),
        NrTelefonu VARCHAR(20),
        TotalOrders INT
    );

    SET @SQL = '
        DECLARE PhoneCursor CURSOR FOR
        SELECT NrTelefonu
        FROM dbo.Klient
        UNION
        SELECT NrTelefonu
        FROM [' + @Server + '].S18_C10.dbo.Klient';

    EXEC sp_executesql @SQL;

    OPEN PhoneCursor;
    FETCH NEXT FROM PhoneCursor INTO @PhoneNumber;

    WHILE @@FETCH_STATUS = 0
    BEGIN
		--current server
        SET @SQL = 'SELECT @Id = IdKlient FROM dbo.Klient WHERE NrTelefonu = @PhoneNumber';
        EXEC sp_executesql @SQL, N'@PhoneNumber VARCHAR(20), @Id INT OUTPUT', @PhoneNumber, @Id OUTPUT;

        SET @SQL = 'SELECT @OrderCountCurrent = COUNT(IdWypozyczenie) FROM dbo.Wypozyczenie WHERE IdKlient = @Id';
        EXEC sp_executesql @SQL, N'@Id INT, @OrderCountCurrent INT OUTPUT', @Id, @OrderCountCurrent OUTPUT;

		--lincked server
		SET @SQL = 'SELECT @Id = IdKlient FROM [' + @Server + '].S18_C10.dbo.Klient WHERE NrTelefonu = @PhoneNumber';
        EXEC sp_executesql @SQL, N'@PhoneNumber VARCHAR(20), @Id INT OUTPUT', @PhoneNumber, @Id OUTPUT;

        SET @SQL = 'SELECT @OrderCountCurrent = COUNT(IdWypozyczenie) FROM [' + @Server + '].S18_C10.dbo.Wypozyczenie WHERE IdKlient = @Id';
        EXEC sp_executesql @SQL, N'@Id INT, @OrderCountCurrent INT OUTPUT', @Id, @OrderCountRemote OUTPUT;

		--insert ClientOrders
        INSERT INTO #ClientOrders (Imie, Nazwisko, NrTelefonu, TotalOrders)
        SELECT k.Imie, k.Nazwisko, k.NrTelefonu, 
               (@OrderCountCurrent + @OrderCountRemote) AS TotalOrders
        FROM dbo.Klient k
        WHERE k.IdKlient = @Id;

        FETCH NEXT FROM PhoneCursor INTO @PhoneNumber;
    END

    CLOSE PhoneCursor;
    DEALLOCATE PhoneCursor;

    SELECT * FROM #ClientOrders
    ORDER BY TotalOrders DESC;

    DROP TABLE #ClientOrders;
END;
GO

--DROP PROCEDURE GetClientOrderSummaryByPhoneNumber;

CREATE OR ALTER PROCEDURE UpdateCategoryOnBothServers
    @Server NVARCHAR(100),
    @IdKategoria INT,           
    @KategoriaNazwa NCHAR(30), 
    @CzenaZaDzien MONEY       
AS
BEGIN
	SET XACT_ABORT ON;

    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE dbo.Kategoria
        SET 
            KategoriaNazwa = @KategoriaNazwa,
            CzenaZaDzien = @CzenaZaDzien
        WHERE IdKategoria = @IdKategoria;

        DECLARE @SQL NVARCHAR(MAX);
        SET @SQL = '
            UPDATE [' + @Server + '].S18_C10.dbo.Kategoria
            SET 
                KategoriaNazwa = @KategoriaNazwa,
                CzenaZaDzien = @CzenaZaDzien
            WHERE IdKategoria = @IdKategoria
        ';

        EXEC sp_executesql 
            @SQL, 
            N'@IdKategoria INT, @KategoriaNazwa NCHAR(30), @CzenaZaDzien MONEY', 
            @IdKategoria, @KategoriaNazwa, @CzenaZaDzien;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

--DROP PROCEDURE UpdateCategoryOnBothServers;
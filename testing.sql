EXEC GetAllCarsWithBranch;
GO
/*
IdSamochod  Nazwa                          wymiary                        masa        RozstawOsi  MocSilnika  Spalanie               Pojemnosc_Ludzie Nosnosc                ZuzyciePaliwa          GotowyDoWypozyczenia IdKategoria IdModel     IdOddzial
----------- ------------------------------ ------------------------------ ----------- ----------- ----------- ---------------------- ---------------- ---------------------- ---------------------- -------------------- ----------- ----------- -----------
3           BMW X5                         4.9m x 2.0m                    2100        2930        230         8,5                    5                500,5                  10                     0                    3           3           1
4           Audi A4                        4.7m x 1.8m                    1500        2800        150         6                      5                400,5                  7,5                    0                    4           4           1
5           Mercedes C200                  4.8m x 1.9m                    1600        2830        160         6,5                    5                420,5                  8                      0                    5           5           1
6           Volkswagen Golf                4.3m x 1.8m                    1300        2620        120         5,5                    5                350,5                  7                      0                    6           6           1
7           Toyota Corolla                 4.6m x 1.7m                    1400        2700        140         5,8                    5                370,5                  7,2                    0                    7           7           1
8           Honda Civic                    4.5m x 1.8m                    1350        2650        130         5,4                    5                360,5                  7,1                    0                    8           8           1
9           Nissan Leaf                    4.4m x 1.7m                    1500        2700        110         0                      5                380,5                  0                      0                    9           9           1
3           BMW X5                         4.9m x 2.0m                    2100        2930        230         8,5                    5                500,5                  10                     0                    3           3           1
4           Audi A4                        4.7m x 1.8m                    1500        2800        150         6                      5                400,5                  7,5                    0                    4           4           1
5           Mercedes C200                  4.8m x 1.9m                    1600        2830        160         6,5                    5                420,5                  8                      0                    5           5           1
6           Volkswagen Golf                4.3m x 1.8m                    1300        2620        120         5,5                    5                350,5                  7                      0                    6           6           1
7           Toyota Corolla                 4.6m x 1.7m                    1400        2700        140         5,8                    5                370,5                  7,2                    0                    7           7           1
8           Honda Civic                    4.5m x 1.8m                    1350        2650        130         5,4                    5                360,5                  7,1                    0                    8           8           1
9           Nissan Leaf                    4.4m x 1.7m                    1500        2700        110         0                      5                380,5                  0                      0                    9           9           1
1           Fiat 500                       3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1           1
2           Ford Focus                     4.4m x 1.8m                    1200        2700        100         5,2                    5                300,5                  6,5                    1                    2           2           1
10          Hyundai Elantra                4.6m x 1.8m                    1400        2650        145         5,7                    5                390,5                  7,3                    1                    10          10          1
11          Opel Astra                     4.37m x 1.81m x 1.47m          1500        2700        150         6,5                    5                500                    7                      1                    1           1           1
12          BMW 320i                       4.62m x 1.82m x 1.44m          1700        2800        180         7                      5                600                    8,2                    1                    1           2           1
13          Audi A4                        4.72m x 1.84m x 1.42m          1600        2700        170         6                      5                550                    6,5                    1                    1           3           1
14          Toyota Corolla                 4.33m x 1.78m x 1.43m          1400        2600        130         5,5                    5                450                    6                      1                    1           4           1
15          Mercedes C-Class               4.70m x 1.80m x 1.44m          1750        2750        200         8                      5                650                    9                      1                    1           5           1
10          Hyundai Elantra                4.6m x 1.8m                    1400        2650        145         5,7                    5                390,5                  7,3                    1                    10          10          1
1           Fiat 500                       3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1           1
2           Ford Focus                     4.4m x 1.8m                    1200        2700        100         5,2                    5                300,5                  6,5                    1                    2           2           1

(25 rows affected)


Completion time: 2024-12-28T01:22:13.1994091+02:00
*/

EXECUTE GetIntersectKlientRowsFromServers 
	@Server = 'LS_AZURE';
GO

	/*
Imie                           Nazwisko                                 NrTelefonu           Email
------------------------------ ---------------------------------------- -------------------- ----------------------------------------------------------------------------------------------------
Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com
Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com
Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com
Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com
Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com
Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com
Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com
Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com
Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com
Tomasz                         Dabrowski                                +48 852 369 112      tomasz.dabrowski@example.com

(10 rows affected)


Completion time: 2024-12-28T02:23:12.3727380+02:00
*/

EXECUTE GetClientOrderSummaryByPhoneNumber
	@Server = 'LS_AZURE';
GO

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)
Imie                           Nazwisko                                 NrTelefonu           TotalOrders
------------------------------ ---------------------------------------- -------------------- -----------
Tomasz                         Dabrowski                                +48 852 369 112      46
Jan                            Kowalski                                 +48 123 456 789      26
Anna                           Nowak                                    +48 987 654 321      10
Jacek                          Szymanski                                +48 357 951 486      2
Piotr                          Wisniewski                               +48 456 789 123      2
Monika                         Wojciechowska                            +48 753 159 852      2
Katarzyna                      Wojcik                                   +48 789 123 456      2
Agnieszka                      Zielinska                                +48 951 753 852      0
Ewa                            Lewandowska                              +48 654 321 987      0
Marek                          Kaminski                                 +48 321 654 987      0

(10 rows affected)


Completion time: 2025-02-01T17:30:42.0482652+02:00

*/
SELECT* FROM dbo.Wypozyczenie;

EXEC UpdateCategoryOnBothServers 
    @Server = 'LS_AZURE', 
    @IdKategoria = 5, 
    @KategoriaNazwa = 'SUV', 
    @CzenaZaDzien = 302.00;
GO

/*
(1 row affected)
OLE DB provider "MSOLEDBSQL" for linked server "LS_AZURE" returned message "The parameter is incorrect.".

(0 rows affected)
Msg 50000, Level 16, State 2, Procedure UpdateCategoryOnBothServers, Line 40 [Batch Start Line 105]
The operation could not be performed because OLE DB provider "MSOLEDBSQL" for linked server "LS_AZURE" was unable to begin a distributed transaction.

Completion time: 2025-02-01T17:27:10.9335126+02:00
*/

SELECT IdKategoria, KategoriaNazwa COLLATE Polish_CI_AS AS KategoriaNazwa, CzenaZaDzien FROM WypozyczenieSamochodow.dbo.Kategoria
UNION ALL
SELECT IdKategoria, KategoriaNazwa COLLATE Polish_CI_AS AS KategoriaNazwa, CzenaZaDzien  FROM LS_SQL2.WypozyczenieSamochodow.dbo.Kategoria;

/*IdKategoria KategoriaNazwa                 CzenaZaDzien
----------- ------------------------------ ---------------------
1           Ekonomiczna                    100,00
2           Standardowa                    150,00
3           Kompaktowa                     200,00
4           Rodzinna                       250,00
5           SUV                            301,00
6           Luksusowa                      400,00
7           Kabriolet                      350,00
8           Sportowa                       450,00
9           Dostawcza                      500,00
10          Elektryczna                    300,00

(10 rows affected)


Completion time: 2025-01-07T18:19:57.1515250+02:00
*/

EXEC UpdateCategoryOnBothServers 
    @Server = 'LS_SQL23', 
    @IdKategoria = 5, 
    @KategoriaNazwa = 'SUV', 
    @CzenaZaDzien = 302.00;
GO

/*
(1 row affected)
Msg 50000, Level 11, State 2, Procedure UpdateCategoryOnBothServers, Line 40 [Batch Start Line 135]
Could not find server 'LS_SQL23' in sys.servers. Verify that the correct server name was specified. If necessary, execute the stored procedure sp_addlinkedserver to add the server to sys.servers.

Completion time: 2025-01-07T18:20:28.9235517+02:00
*/


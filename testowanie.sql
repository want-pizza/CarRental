USE WypozyczenieSamochodow;

-------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD oraz transakcji. 
-------------------------------------------------------------
-- Dokumentacja testowania.
-------------------------------------------------------------
-------------------------------------------------------------
-- Tabela [Klient].
-------------------------------------------------------------

SELECT *
FROM dbo.Klient;
GO

/*
IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
21          Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com                                                                             NULL
22          Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com                                                                               NULL
23          Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com                                                                         NULL
24          Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com                                                                         NULL
25          Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com                                                                           NULL
26          Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com                                                                          NULL
27          Tomasz                         Dabrowski                                +48 852 369 741      tomasz.dabrowski@example.com                                                                         NULL
28          Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com                                                                      NULL
29          Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com                                                                          NULL
30          Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com 

(10 rows affected)
*/

EXEC dbo.Klient_Insert 
    @Imie = 'Jan', @Nazwisko = 'Kowalski', @NrTelefonu = '+48 888 888 888', @Email = 'jan.kowalski@example.com', @Uwagi = 'test';

/*
(1 row affected)

IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
21          Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com                                                                             NULL
22          Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com                                                                               NULL
23          Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com                                                                         NULL
24          Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com                                                                         NULL
25          Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com                                                                           NULL
26          Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com                                                                          NULL
27          Tomasz                         Dabrowski                                +48 852 369 741      tomasz.dabrowski@example.com                                                                         NULL
28          Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com                                                                      NULL
29          Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com                                                                          NULL
30          Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com                                                                     NULL
31          Jan                            Kowalski                                 +48 888 888 888      jan.kowalski@example.com                                                                             test

(11 rows affected)
*/

EXEC dbo.Klient_Update
    @IdKlient = 31, @Imie = 'Jan', @Nazwisko = 'Kowalski', @NrTelefonu = '+48 888 888 888', @Email = 'jan.kowalski@example.com', @Uwagi = 'test update'; -- uwagi zmienioni

/*
(1 row affected)

IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
21          Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com                                                                             NULL
22          Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com                                                                               NULL
23          Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com                                                                         NULL
24          Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com                                                                         NULL
25          Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com                                                                           NULL
26          Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com                                                                          NULL
27          Tomasz                         Dabrowski                                +48 852 369 741      tomasz.dabrowski@example.com                                                                         NULL
28          Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com                                                                      NULL
29          Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com                                                                          NULL
30          Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com                                                                     NULL
31          Jan                            Kowalski                                 +48 888 888 888      jan.kowalski@example.com                                                                             test update

(11 rows affected)
*/

EXEC dbo.Klient_Delete
    @IdKlient = 31;

/*
(1 row affected)

IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
21          Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com                                                                             NULL
22          Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com                                                                               NULL
23          Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com                                                                         NULL
24          Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com                                                                         NULL
25          Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com                                                                           NULL
26          Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com                                                                          NULL
27          Tomasz                         Dabrowski                                +48 852 369 741      tomasz.dabrowski@example.com                                                                         NULL
28          Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com                                                                      NULL
29          Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com                                                                          NULL
30          Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com                                                                     NULL

(10 rows affected)
*/

--------------------------------------------------------------------
-- Tabela [Pracownik].
--------------------------------------------------------------------

SELECT *
FROM dbo.Pracownik;
GO

/*
IdPracownik Imie                           Nazwisko                                 Stanowisko                                                   NrTelefonu           Email
----------- ------------------------------ ---------------------------------------- ------------------------------------------------------------ -------------------- ----------------------------------------------------------------------------------------------------
1           Adam                           Kaczmarek                                Manager                                                      +48 123 123 123      adam.kaczmarek@example.com
2           Beata                          Pawlak                                   Assistant                                                    +48 321 321 321      beata.pawlak@example.com
3           Cezary                         Malinowski                               Clerk                                                        +48 456 456 456      cezary.malinowski@example.com
4           Dorota                         Zawadzka                                 HR                                                           +48 654 654 654      dorota.zawadzka@example.com
5           Edward                         Piotrowski                               Technician                                                   +48 789 789 789      edward.piotrowski@example.com
6           Felicja                        Krol                                     Manager                                                      +48 987 987 987      felicja.krol@example.com
7           Grzegorz                       Jankowski                                Assistant                                                    +48 852 852 852      grzegorz.jankowski@example.com
8           Hanna                          Mazur                                    Clerk                                                        +48 159 159 159      hanna.mazur@example.com
9           Ignacy                         Kubiak                                   HR                                                           +48 951 951 951      ignacy.kubiak@example.com
10          Jolanta                        Lis                                      Technician                                                   +48 357 357 357      jolanta.lis@example.com

(10 rows affected)


Completion time: 2024-06-03T16:27:35.7702448+03:00
*/

EXEC dbo.Pracownik_Insert 
    @Imie = 'AdamTest', @Nazwisko = 'Kaczmarek', @Stanowisko = 'Manager', @NrTelefonu = '+48 123 123 123', @Email = 'adam.kaczmarek@example.com';

/*

(1 row affected)

Completion time: 2024-06-03T16:28:27.9825115+03:00

IdPracownik Imie                           Nazwisko                                 Stanowisko                                                   NrTelefonu           Email
----------- ------------------------------ ---------------------------------------- ------------------------------------------------------------ -------------------- ----------------------------------------------------------------------------------------------------
1           Adam                           Kaczmarek                                Manager                                                      +48 123 123 123      adam.kaczmarek@example.com
2           Beata                          Pawlak                                   Assistant                                                    +48 321 321 321      beata.pawlak@example.com
3           Cezary                         Malinowski                               Clerk                                                        +48 456 456 456      cezary.malinowski@example.com
4           Dorota                         Zawadzka                                 HR                                                           +48 654 654 654      dorota.zawadzka@example.com
5           Edward                         Piotrowski                               Technician                                                   +48 789 789 789      edward.piotrowski@example.com
6           Felicja                        Krol                                     Manager                                                      +48 987 987 987      felicja.krol@example.com
7           Grzegorz                       Jankowski                                Assistant                                                    +48 852 852 852      grzegorz.jankowski@example.com
8           Hanna                          Mazur                                    Clerk                                                        +48 159 159 159      hanna.mazur@example.com
9           Ignacy                         Kubiak                                   HR                                                           +48 951 951 951      ignacy.kubiak@example.com
10          Jolanta                        Lis                                      Technician                                                   +48 357 357 357      jolanta.lis@example.com
11          AdamTest                       Kaczmarek                                Manager                                                      +48 123 123 123      adam.kaczmarek@example.com

(11 rows affected)


Completion time: 2024-06-03T16:28:42.7071000+03:00

*/

EXEC dbo.Pracownik_Update
    @IdPracownik = 11, @Imie = 'AdamUpdate', @Nazwisko = 'Kaczmarek', @Stanowisko = 'Manager', @NrTelefonu = '+48 123 123 123', @Email = 'adam.kaczmarek@example.com'; --imie zmienione

/*

(1 row affected)

Completion time: 2024-06-03T16:30:00.9973795+03:00

IdPracownik Imie                           Nazwisko                                 Stanowisko                                                   NrTelefonu           Email
----------- ------------------------------ ---------------------------------------- ------------------------------------------------------------ -------------------- ----------------------------------------------------------------------------------------------------
1           Adam                           Kaczmarek                                Manager                                                      +48 123 123 123      adam.kaczmarek@example.com
2           Beata                          Pawlak                                   Assistant                                                    +48 321 321 321      beata.pawlak@example.com
3           Cezary                         Malinowski                               Clerk                                                        +48 456 456 456      cezary.malinowski@example.com
4           Dorota                         Zawadzka                                 HR                                                           +48 654 654 654      dorota.zawadzka@example.com
5           Edward                         Piotrowski                               Technician                                                   +48 789 789 789      edward.piotrowski@example.com
6           Felicja                        Krol                                     Manager                                                      +48 987 987 987      felicja.krol@example.com
7           Grzegorz                       Jankowski                                Assistant                                                    +48 852 852 852      grzegorz.jankowski@example.com
8           Hanna                          Mazur                                    Clerk                                                        +48 159 159 159      hanna.mazur@example.com
9           Ignacy                         Kubiak                                   HR                                                           +48 951 951 951      ignacy.kubiak@example.com
10          Jolanta                        Lis                                      Technician                                                   +48 357 357 357      jolanta.lis@example.com
11          AdamUpdate                     Kaczmarek                                Manager                                                      +48 123 123 123      adam.kaczmarek@example.com

(11 rows affected)


Completion time: 2024-06-03T16:31:06.0612240+03:00

*/

EXEC dbo.Pracownik_Delete
	@IdPracownik = 11;

/*

(1 row affected)

Completion time: 2024-06-03T16:32:25.2167254+03:00

IdPracownik Imie                           Nazwisko                                 Stanowisko                                                   NrTelefonu           Email
----------- ------------------------------ ---------------------------------------- ------------------------------------------------------------ -------------------- ----------------------------------------------------------------------------------------------------
1           Adam                           Kaczmarek                                Manager                                                      +48 123 123 123      adam.kaczmarek@example.com
2           Beata                          Pawlak                                   Assistant                                                    +48 321 321 321      beata.pawlak@example.com
3           Cezary                         Malinowski                               Clerk                                                        +48 456 456 456      cezary.malinowski@example.com
4           Dorota                         Zawadzka                                 HR                                                           +48 654 654 654      dorota.zawadzka@example.com
5           Edward                         Piotrowski                               Technician                                                   +48 789 789 789      edward.piotrowski@example.com
6           Felicja                        Krol                                     Manager                                                      +48 987 987 987      felicja.krol@example.com
7           Grzegorz                       Jankowski                                Assistant                                                    +48 852 852 852      grzegorz.jankowski@example.com
8           Hanna                          Mazur                                    Clerk                                                        +48 159 159 159      hanna.mazur@example.com
9           Ignacy                         Kubiak                                   HR                                                           +48 951 951 951      ignacy.kubiak@example.com
10          Jolanta                        Lis                                      Technician                                                   +48 357 357 357      jolanta.lis@example.com

(10 rows affected)


Completion time: 2024-06-03T16:32:45.6454523+03:00

*/

--------------------------------------------------------------------
-- Tabela [WypozyczenieStatus].
--------------------------------------------------------------------

SELECT*
FROM WypozyczenieStatus;
GO

/*
IdWypozyczenieStatus Status
-------------------- ------------------------------
4                    Anulowane
7                    Dostarczone
5                    Opoznione
9                    W przygotowaniu
2                    W realizacji
6                    Wyslane
8                    Zamkniete
10                   Zatwierdzone
1                    Zlozone
3                    Zrealizowane

(10 rows affected)


Completion time: 2024-06-03T16:33:57.3438302+03:00

*/

EXEC dbo.WypozyczenieStatus_Insert @Status = 'ZłożoneTest';

/*
(1 row affected)

Completion time: 2024-06-03T16:35:20.4583442+03:00

IdWypozyczenieStatus Status
-------------------- ------------------------------
4                    Anulowane
7                    Dostarczone
5                    Opoznione
9                    W przygotowaniu
2                    W realizacji
6                    Wyslane
8                    Zamkniete
10                   Zatwierdzone
1                    Zlozone
11                   ZlozoneTest
3                    Zrealizowane

(11 rows affected)


Completion time: 2024-06-03T16:35:34.0063049+03:00

*/

EXEC dbo.WypozyczenieStatus_Update @IdWypozyczenieStatus = 11, @Status = 'ZłożoneUpdate';

/*
1 row affected)

Completion time: 2024-06-03T16:37:50.4368872+03:00

IdWypozyczenieStatus Status
-------------------- ------------------------------
4                    Anulowane
7                    Dostarczone
5                    Opoznione
9                    W przygotowaniu
2                    W realizacji
6                    Wyslane
8                    Zamkniete
10                   Zatwierdzone
1                    Zlozone
11                   ZlozoneUpdate
3                    Zrealizowane

(11 rows affected)


Completion time: 2024-06-03T16:38:04.4837249+03:00

*/

EXEC dbo.WypozyczenieStatus_Delete @IdWypozyczenieStatus = 11;

/*

(1 row affected)

Completion time: 2024-06-03T16:39:33.5390669+03:00

IdWypozyczenieStatus Status
-------------------- ------------------------------
4                    Anulowane
7                    Dostarczone
5                    Opoznione
9                    W przygotowaniu
2                    W realizacji
6                    Wyslane
8                    Zamkniete
10                   Zatwierdzone
1                    Zlozone
3                    Zrealizowane

(10 rows affected)


Completion time: 2024-06-03T16:40:02.9298297+03:00

*/

--------------------------------------------------------------------
-- Tabela [Producent].
--------------------------------------------------------------------

SELECT*
FROM Producent;
GO

/*
IdProducent ProducentNazwa
----------- ------------------------------
4           Audi
3           BMW
1           Fiat
2           Ford
8           Honda
10          Hyundai
5           Mercedes
9           Nissan
7           Toyota
6           Volkswagen

(10 rows affected)


Completion time: 2024-06-03T16:42:09.2862256+03:00

*/

EXEC dbo.Producent_Insert @ProducentNazwa = 'FiatTest';

/*

(1 row affected)

Completion time: 2024-06-03T16:42:32.8708204+03:00

IdProducent ProducentNazwa
----------- ------------------------------
4           Audi
3           BMW
1           Fiat
11          FiatTest
2           Ford
8           Honda
10          Hyundai
5           Mercedes
9           Nissan
7           Toyota
6           Volkswagen

(11 rows affected)


Completion time: 2024-06-03T16:42:56.9042098+03:00

*/

EXEC dbo.Producent_Update @IdProducent = 11, @ProducentNazwa = 'FiatUpdate';

/*

(1 row affected)

Completion time: 2024-06-03T16:43:49.1643391+03:00

IdProducent ProducentNazwa
----------- ------------------------------
4           Audi
3           BMW
1           Fiat
11          FiatUpdate
2           Ford
8           Honda
10          Hyundai
5           Mercedes
9           Nissan
7           Toyota
6           Volkswagen

(11 rows affected)


Completion time: 2024-06-03T16:44:05.2099785+03:00
*/

EXEC dbo.Producent_Delete @IdProducent = 11;

/*

(1 row affected)

Completion time: 2024-06-03T16:44:52.1306599+03:00

IdProducent ProducentNazwa
----------- ------------------------------
4           Audi
3           BMW
1           Fiat
2           Ford
8           Honda
10          Hyundai
5           Mercedes
9           Nissan
7           Toyota
6           Volkswagen

(10 rows affected)


Completion time: 2024-06-03T16:45:08.2640723+03:00

*/

--------------------------------------------------------------------
-- Tabela [Kategoria].
--------------------------------------------------------------------

SELECT*
FROM Kategoria;
GO

/*
IdKategoria KategoriaNazwa                 CzenaZaDzien
----------- ------------------------------ ---------------------
1           Ekonomiczna                    100,00
2           Standardowa                    150,00
3           Kompaktowa                     200,00
4           Rodzinna                       250,00
5           SUV                            300,00
6           Luksusowa                      400,00
7           Kabriolet                      350,00
8           Sportowa                       450,00
9           Dostawcza                      500,00
10          Elektryczna                    300,00

(10 rows affected)


Completion time: 2024-06-03T16:46:11.3081084+03:00

*/

EXEC dbo.Kategoria_Insert @KategoriaNazwa = 'EkonomicznaTest', @CzenaZaDzien = 100.00;

/*

(1 row affected)

Completion time: 2024-06-03T16:46:51.0370729+03:00

IdKategoria KategoriaNazwa                 CzenaZaDzien
----------- ------------------------------ ---------------------
1           Ekonomiczna                    100,00
2           Standardowa                    150,00
3           Kompaktowa                     200,00
4           Rodzinna                       250,00
5           SUV                            300,00
6           Luksusowa                      400,00
7           Kabriolet                      350,00
8           Sportowa                       450,00
9           Dostawcza                      500,00
10          Elektryczna                    300,00
11          EkonomicznaTest                100,00

(11 rows affected)


Completion time: 2024-06-03T16:47:04.3599320+03:00

*/

EXEC dbo.Kategoria_Update @IdKategoria = 11, @KategoriaNazwa = 'EkonomicznaTest', @CzenaZaDzien = 110.00; --  @CzenaZaDzien = 110.00

/*

(1 row affected)

Completion time: 2024-06-03T16:48:21.0452138+03:00

IdKategoria KategoriaNazwa                 CzenaZaDzien
----------- ------------------------------ ---------------------
1           Ekonomiczna                    100,00
2           Standardowa                    150,00
3           Kompaktowa                     200,00
4           Rodzinna                       250,00
5           SUV                            300,00
6           Luksusowa                      400,00
7           Kabriolet                      350,00
8           Sportowa                       450,00
9           Dostawcza                      500,00
10          Elektryczna                    300,00
11          EkonomicznaTest                110,00

(11 rows affected)


Completion time: 2024-06-03T16:49:17.9268679+03:00

*/

EXEC dbo.Kategoria_Delete @IdKategoria = 11;

/*

(1 row affected)

Completion time: 2024-06-03T16:49:52.9805410+03:00

IdKategoria KategoriaNazwa                 CzenaZaDzien
----------- ------------------------------ ---------------------
1           Ekonomiczna                    100,00
2           Standardowa                    150,00
3           Kompaktowa                     200,00
4           Rodzinna                       250,00
5           SUV                            300,00
6           Luksusowa                      400,00
7           Kabriolet                      350,00
8           Sportowa                       450,00
9           Dostawcza                      500,00
10          Elektryczna                    300,00

(10 rows affected)


Completion time: 2024-06-03T16:50:08.7657777+03:00

*/


--------------------------------------------------------------------
-- Tabela [Model].
--------------------------------------------------------------------

SELECT*
FROM Model;
GO

/*
IdModel     ModelNazwa IdProducent
----------- ---------- -----------
1           Golf       1
2           Corol      2
3           Range      3
4           A3         4
5           X5         5
6           GLC        6
7           Megan      7
8           Cruze      8
9           Civic      9
10          500        10

(11 rows affected)


Completion time: 2024-06-03T16:52:11.6300622+03:00

*/

EXEC dbo.Model_Insert @IdModel = 11, @ModelNazwa = 'GolfTest', @IdProducent = 1;

/*

(1 row affected)

Completion time: 2024-06-03T16:51:46.1161439+03:00

IdModel     ModelNazwa IdProducent
----------- ---------- -----------
1           Golf       1
2           Corol      2
3           Range      3
4           A3         4
5           X5         5
6           GLC        6
7           Megan      7
8           Cruze      8
9           Civic      9
10          500        10
11          GolfT      1

(11 rows affected)


Completion time: 2024-06-03T16:52:11.6300622+03:00

*/

EXEC dbo.Model_Update @IdModel = 11, @ModelNazwa = 'GolfU', @IdProducent = 1;

/*

(1 row affected)

Completion time: 2024-06-03T16:53:18.5549836+03:00

IdModel     ModelNazwa IdProducent
----------- ---------- -----------
1           Golf       1
2           Corol      2
3           Range      3
4           A3         4
5           X5         5
6           GLC        6
7           Megan      7
8           Cruze      8
9           Civic      9
10          500        10
11          GolfU      1

(11 rows affected)


Completion time: 2024-06-03T16:53:28.8102347+03:00

*/

EXEC dbo.Model_Delete @IdModel = 11;

/*

(1 row affected)

Completion time: 2024-06-03T16:54:20.2748507+03:00

IdModel     ModelNazwa IdProducent
----------- ---------- -----------
1           Golf       1
2           Corol      2
3           Range      3
4           A3         4
5           X5         5
6           GLC        6
7           Megan      7
8           Cruze      8
9           Civic      9
10          500        10

(10 rows affected)


Completion time: 2024-06-03T16:54:29.2272194+03:00

*/

--------------------------------------------------------------------
-- Tabela [Wypozyczenie].
--------------------------------------------------------------------

SELECT*
FROM Wypozyczenie;
GO

/*IdWypozyczenie IdKlient    IdPracownik IdWypozyczenieStatus DataZlorzenia KwotaLaczna           Uwagi
-------------- ----------- ----------- -------------------- ------------- --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11             21          1           1                    2024-05-01    1000,00               NULL
12             22          2           2                    2024-05-02    1500,00               NULL
13             23          3           3                    2024-05-03    2000,00               NULL
14             24          4           1                    2024-05-04    2500,00               NULL
15             25          5           2                    2024-05-05    3000,00               NULL
16             26          6           3                    2024-05-06    3500,00               NULL
17             27          7           1                    2024-05-07    4000,00               NULL
18             28          8           2                    2024-05-08    4500,00               NULL
19             29          9           3                    2024-05-09    5000,00               NULL
20             30          10          1                    2024-05-10    5500,00               NULL

(10 rows affected)


Completion time: 2024-06-03T16:56:06.7273976+03:00
*/

EXEC dbo.Wypozyczenie_Insert 
    @IdKlient = 21, @IdPracownik = 1, @IdWypozyczenieStatus = 1, @DataZlorzenia = '2024-05-01', @KwotaLaczna = 1000.00, @Uwagi = 'test';


/*

(1 row affected)

Completion time: 2024-06-03T16:56:20.3612423+03:00

IdWypozyczenie IdKlient    IdPracownik IdWypozyczenieStatus DataZlorzenia KwotaLaczna           Uwagi
-------------- ----------- ----------- -------------------- ------------- --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11             21          1           1                    2024-05-01    1000,00               NULL
12             22          2           2                    2024-05-02    1500,00               NULL
13             23          3           3                    2024-05-03    2000,00               NULL
14             24          4           1                    2024-05-04    2500,00               NULL
15             25          5           2                    2024-05-05    3000,00               NULL
16             26          6           3                    2024-05-06    3500,00               NULL
17             27          7           1                    2024-05-07    4000,00               NULL
18             28          8           2                    2024-05-08    4500,00               NULL
19             29          9           3                    2024-05-09    5000,00               NULL
20             30          10          1                    2024-05-10    5500,00               NULL
21             21          1           1                    2024-05-01    1000,00               test

(11 rows affected)


Completion time: 2024-06-03T16:56:34.6013080+03:00

*/

EXEC dbo.Wypozyczenie_Update
    @IdWypozyczenie = 21, @IdKlient = 21, @IdPracownik = 1, @IdWypozyczenieStatus = 1, @DataZlorzenia = '2024-05-01', @KwotaLaczna = 1000.00, @Uwagi = 'test-update'; --@Uwagi = 'test-update'


/*

(1 row affected)

Completion time: 2024-06-03T16:57:48.4229905+03:00

IdWypozyczenie IdKlient    IdPracownik IdWypozyczenieStatus DataZlorzenia KwotaLaczna           Uwagi
-------------- ----------- ----------- -------------------- ------------- --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11             21          1           1                    2024-05-01    1000,00               NULL
12             22          2           2                    2024-05-02    1500,00               NULL
13             23          3           3                    2024-05-03    2000,00               NULL
14             24          4           1                    2024-05-04    2500,00               NULL
15             25          5           2                    2024-05-05    3000,00               NULL
16             26          6           3                    2024-05-06    3500,00               NULL
17             27          7           1                    2024-05-07    4000,00               NULL
18             28          8           2                    2024-05-08    4500,00               NULL
19             29          9           3                    2024-05-09    5000,00               NULL
20             30          10          1                    2024-05-10    5500,00               NULL
21             21          1           1                    2024-05-01    1000,00               test-update

(11 rows affected)


Completion time: 2024-06-03T16:58:02.8197648+03:00

*/

EXEC dbo.Wypozyczenie_Delete
    @IdWypozyczenie = 21;

/*

(1 row affected)

Completion time: 2024-06-03T16:58:47.0434467+03:00

IdWypozyczenie IdKlient    IdPracownik IdWypozyczenieStatus DataZlorzenia KwotaLaczna           Uwagi
-------------- ----------- ----------- -------------------- ------------- --------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11             21          1           1                    2024-05-01    1000,00               NULL
12             22          2           2                    2024-05-02    1500,00               NULL
13             23          3           3                    2024-05-03    2000,00               NULL
14             24          4           1                    2024-05-04    2500,00               NULL
15             25          5           2                    2024-05-05    3000,00               NULL
16             26          6           3                    2024-05-06    3500,00               NULL
17             27          7           1                    2024-05-07    4000,00               NULL
18             28          8           2                    2024-05-08    4500,00               NULL
19             29          9           3                    2024-05-09    5000,00               NULL
20             30          10          1                    2024-05-10    5500,00               NULL

(10 rows affected)


Completion time: 2024-06-03T16:58:58.2108359+03:00

*/

--------------------------------------------------------------------
-- Tabela [Samochod].
--------------------------------------------------------------------

SELECT*
FROM Samochod;
GO

/*
IdSamochod  Nazwa                          wymiary                        masa        RozstawOsi  MocSilnika  Spalanie               Pojemnosc_Ludzie Nosnosc                ZuzyciePaliwa          GotowyDoWypozyczenia IdKategoria IdModel
----------- ------------------------------ ------------------------------ ----------- ----------- ----------- ---------------------- ---------------- ---------------------- ---------------------- -------------------- ----------- -----------
71          Fiat 500                       3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1
72          Ford Focus                     4.4m x 1.8m                    1200        2700        100         5,2                    5                300,5                  6,5                    0                    2           2
73          BMW X5                         4.9m x 2.0m                    2100        2930        230         8,5                    5                500,5                  10                     0                    3           3
74          Audi A4                        4.7m x 1.8m                    1500        2800        150         6                      5                400,5                  7,5                    0                    4           4
75          Mercedes C200                  4.8m x 1.9m                    1600        2830        160         6,5                    5                420,5                  8                      0                    5           5
76          Volkswagen Golf                4.3m x 1.8m                    1300        2620        120         5,5                    5                350,5                  7                      0                    6           6
77          Toyota Corolla                 4.6m x 1.7m                    1400        2700        140         5,8                    5                370,5                  7,2                    0                    7           7
78          Honda Civic                    4.5m x 1.8m                    1350        2650        130         5,4                    5                360,5                  7,1                    1                    8           8
79          Nissan Leaf                    4.4m x 1.7m                    1500        2700        110         0                      5                380,5                  0                      1                    9           9
80          Hyundai Elantra                4.6m x 1.8m                    1400        2650        145         5,7                    5                390,5                  7,3                    1                    10          10

(10 rows affected)


Completion time: 2024-06-03T17:01:42.1550612+03:00

*/

EXEC dbo.Samochod_Insert 
    @Nazwa = 'Fiat Test', @wymiary = '3.6m x 1.6m', @masa = 900, @RozstawOsi = 2300, @MocSilnika = 85, 
    @Spalanie = 4.8, @Pojemnosc_Ludzie = 4, @Nosnosc = 200.5, @ZuzyciePaliwa = 6.0, @StanMagazynowy = 1, @IdKategoria = 1, @IdModel = 1;

/*

(1 row affected)

Completion time: 2024-06-03T17:02:07.4839061+03:00

IdSamochod  Nazwa                          wymiary                        masa        RozstawOsi  MocSilnika  Spalanie               Pojemnosc_Ludzie Nosnosc                ZuzyciePaliwa          GotowyDoWypozyczenia IdKategoria IdModel
----------- ------------------------------ ------------------------------ ----------- ----------- ----------- ---------------------- ---------------- ---------------------- ---------------------- -------------------- ----------- -----------
71          Fiat 500                       3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1
72          Ford Focus                     4.4m x 1.8m                    1200        2700        100         5,2                    5                300,5                  6,5                    0                    2           2
73          BMW X5                         4.9m x 2.0m                    2100        2930        230         8,5                    5                500,5                  10                     0                    3           3
74          Audi A4                        4.7m x 1.8m                    1500        2800        150         6                      5                400,5                  7,5                    0                    4           4
75          Mercedes C200                  4.8m x 1.9m                    1600        2830        160         6,5                    5                420,5                  8                      0                    5           5
76          Volkswagen Golf                4.3m x 1.8m                    1300        2620        120         5,5                    5                350,5                  7                      0                    6           6
77          Toyota Corolla                 4.6m x 1.7m                    1400        2700        140         5,8                    5                370,5                  7,2                    0                    7           7
78          Honda Civic                    4.5m x 1.8m                    1350        2650        130         5,4                    5                360,5                  7,1                    1                    8           8
79          Nissan Leaf                    4.4m x 1.7m                    1500        2700        110         0                      5                380,5                  0                      1                    9           9
80          Hyundai Elantra                4.6m x 1.8m                    1400        2650        145         5,7                    5                390,5                  7,3                    1                    10          10
81          Fiat Test                      3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1

(11 rows affected)


Completion time: 2024-06-03T17:02:14.2110622+03:00

*/

EXEC dbo.Samochod_Update
    @IdSamochod = 81, @Nazwa = 'Fiat Update', @wymiary = '3.6m x 1.6m', @masa = 900, @RozstawOsi = 2300, @MocSilnika = 85, 
    @Spalanie = 4.8, @Pojemnosc_Ludzie = 4, @Nosnosc = 200.5, @ZuzyciePaliwa = 6.0, @StanMagazynowy = 1, @IdKategoria = 1, @IdModel = 1;--@Nazwa = 'Fiat Update'

/*

(1 row affected)

Completion time: 2024-06-03T17:03:18.1369773+03:00

IdSamochod  Nazwa                          wymiary                        masa        RozstawOsi  MocSilnika  Spalanie               Pojemnosc_Ludzie Nosnosc                ZuzyciePaliwa          GotowyDoWypozyczenia IdKategoria IdModel
----------- ------------------------------ ------------------------------ ----------- ----------- ----------- ---------------------- ---------------- ---------------------- ---------------------- -------------------- ----------- -----------
71          Fiat 500                       3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1
72          Ford Focus                     4.4m x 1.8m                    1200        2700        100         5,2                    5                300,5                  6,5                    0                    2           2
73          BMW X5                         4.9m x 2.0m                    2100        2930        230         8,5                    5                500,5                  10                     0                    3           3
74          Audi A4                        4.7m x 1.8m                    1500        2800        150         6                      5                400,5                  7,5                    0                    4           4
75          Mercedes C200                  4.8m x 1.9m                    1600        2830        160         6,5                    5                420,5                  8                      0                    5           5
76          Volkswagen Golf                4.3m x 1.8m                    1300        2620        120         5,5                    5                350,5                  7                      0                    6           6
77          Toyota Corolla                 4.6m x 1.7m                    1400        2700        140         5,8                    5                370,5                  7,2                    0                    7           7
78          Honda Civic                    4.5m x 1.8m                    1350        2650        130         5,4                    5                360,5                  7,1                    1                    8           8
79          Nissan Leaf                    4.4m x 1.7m                    1500        2700        110         0                      5                380,5                  0                      1                    9           9
80          Hyundai Elantra                4.6m x 1.8m                    1400        2650        145         5,7                    5                390,5                  7,3                    1                    10          10
81          Fiat Update                    3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1

(11 rows affected)


Completion time: 2024-06-03T17:03:32.1822447+03:00

*/

EXEC dbo.Samochod_Delete
    @IdSamochod = 81;

/*

(1 row affected)

Completion time: 2024-06-03T17:05:28.6685196+03:00

IdSamochod  Nazwa                          wymiary                        masa        RozstawOsi  MocSilnika  Spalanie               Pojemnosc_Ludzie Nosnosc                ZuzyciePaliwa          GotowyDoWypozyczenia IdKategoria IdModel
----------- ------------------------------ ------------------------------ ----------- ----------- ----------- ---------------------- ---------------- ---------------------- ---------------------- -------------------- ----------- -----------
71          Fiat 500                       3.6m x 1.6m                    900         2300        85          4,8                    4                200,5                  6                      1                    1           1
72          Ford Focus                     4.4m x 1.8m                    1200        2700        100         5,2                    5                300,5                  6,5                    0                    2           2
73          BMW X5                         4.9m x 2.0m                    2100        2930        230         8,5                    5                500,5                  10                     0                    3           3
74          Audi A4                        4.7m x 1.8m                    1500        2800        150         6                      5                400,5                  7,5                    0                    4           4
75          Mercedes C200                  4.8m x 1.9m                    1600        2830        160         6,5                    5                420,5                  8                      0                    5           5
76          Volkswagen Golf                4.3m x 1.8m                    1300        2620        120         5,5                    5                350,5                  7                      0                    6           6
77          Toyota Corolla                 4.6m x 1.7m                    1400        2700        140         5,8                    5                370,5                  7,2                    0                    7           7
78          Honda Civic                    4.5m x 1.8m                    1350        2650        130         5,4                    5                360,5                  7,1                    1                    8           8
79          Nissan Leaf                    4.4m x 1.7m                    1500        2700        110         0                      5                380,5                  0                      1                    9           9
80          Hyundai Elantra                4.6m x 1.8m                    1400        2650        145         5,7                    5                390,5                  7,3                    1                    10          10

(10 rows affected)


Completion time: 2024-06-03T17:05:49.6748895+03:00
*/


SELECT* FROM dbo.Kategoria;

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
10          Elektryczna                    400,00

(10 rows affected)


Completion time: 2025-02-01T17:04:00.3664477+02:00
*/

EXEC dbo.Kategoria_ZmienCena 
    @Par_IdKategoria = 999, 
    @Par_KategoriaNazwa = 'Nieistniejąca', 
    @Par_CzenaZaDzien = 120.00;

	/*
(0 rows affected)

Completion time: 2025-02-01T17:05:49.0345395+02:00
*/

EXEC dbo.Kategoria_ZmienCena 
    @Par_IdKategoria = 1, 
    @Par_KategoriaNazwa = 'Ekonomiczna', 
    @Par_CzenaZaDzien = 130.00;

	/*
(1 row affected)

(1 row affected)

Completion time: 2025-02-01T17:04:10.5917490+02:00
*/

/*IdKategoria KategoriaNazwa                 CzenaZaDzien
----------- ------------------------------ ---------------------
1           Ekonomiczna                    120,00
2           Standardowa                    150,00
3           Kompaktowa                     200,00
4           Rodzinna                       250,00
5           SUV                            301,00
6           Luksusowa                      400,00
7           Kabriolet                      350,00
8           Sportowa                       450,00
9           Dostawcza                      500,00
10          Elektryczna                    400,00

(10 rows affected)


Completion time: 2025-02-01T17:04:26.2672574+02:00
*/

SELECT* FROM [dbo].[Kategoria_Cena_Historia];

/*IdKategoria_Cena_Historia IdKategoria DataGodzZmiany          CenaPoprzednia        CenaNowa
------------------------- ----------- ----------------------- --------------------- ---------------------
1                         1           2025-02-01 15:04:09.053 100,00                120,00
2                         1           2025-02-01 15:18:05.977 120,00                130,00

(2 rows affected)


Completion time: 2025-02-01T17:18:10.7805674+02:00

*/


SELECT* FROM dbo.Klient;

/*IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi                                                                                                                                                                                                                                                           IdOddzial
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com                                                                             NULL                                                                                                                                                                                                                                                            2
2           Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com                                                                               NULL                                                                                                                                                                                                                                                            2
3           Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com                                                                         NULL                                                                                                                                                                                                                                                            2
4           Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com                                                                         NULL                                                                                                                                                                                                                                                            2
5           Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com                                                                           NULL                                                                                                                                                                                                                                                            2
6           Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com                                                                          NULL                                                                                                                                                                                                                                                            2
7           Tomasz                         Dabrowski                                +48 852 369 112      tomasz.dabrowski@example.com                                                                         NULL                                                                                                                                                                                                                                                            2
8           Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com                                                                      NULL                                                                                                                                                                                                                                                            2
9           Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com                                                                          NULL                                                                                                                                                                                                                                                            2
10          Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com                                                                     NULL                                                                                                                                                                                                                                                            2
11          Jan                            Kowalski                                 +48 888 888 888      jan.kowalski@example.com                                                                             test                                                                                                                                                                                                                                                            NULL

(11 rows affected)


Completion time: 2025-02-01T17:07:39.8527711+02:00

*/

EXEC dbo.Klient_Archiwizuj @Par_IdKlient = 12;
/*
(0 rows affected)

(0 rows affected)

Completion time: 2025-02-01T17:09:35.6106710+02:00
*/

EXEC dbo.Klient_Archiwizuj @Par_IdKlient = 10;

/*
(1 row affected)
Msg 547, Level 16, State 0, Procedure dbo.Klient_Archiwizuj, Line 16 [Batch Start Line 1012]
The DELETE statement conflicted with the REFERENCE constraint "FK_Wypozyczenie_Klient". The conflict occurred in database "S18_C10", table "dbo.Wypozyczenie", column 'IdKlient'.

Completion time: 2025-02-01T17:07:04.1124309+02:00
*/

EXEC dbo.Klient_Archiwizuj @Par_IdKlient = 11;

/*
(1 row affected)

(1 row affected)

Completion time: 2025-02-01T17:07:59.1833104+02:00
*/


/*IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi                                                                                                                                                                                                                                                           IdOddzial
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------
1           Jan                            Kowalski                                 +48 123 456 789      jan.kowalski@example.com                                                                             NULL                                                                                                                                                                                                                                                            2
2           Anna                           Nowak                                    +48 987 654 321      anna.nowak@example.com                                                                               NULL                                                                                                                                                                                                                                                            2
3           Piotr                          Wisniewski                               +48 456 789 123      piotr.wisniewski@example.com                                                                         NULL                                                                                                                                                                                                                                                            2
4           Katarzyna                      Wojcik                                   +48 789 123 456      katarzyna.wojcik@example.com                                                                         NULL                                                                                                                                                                                                                                                            2
5           Marek                          Kaminski                                 +48 321 654 987      marek.kaminski@example.com                                                                           NULL                                                                                                                                                                                                                                                            2
6           Ewa                            Lewandowska                              +48 654 321 987      ewa.lewandowska@example.com                                                                          NULL                                                                                                                                                                                                                                                            2
7           Tomasz                         Dabrowski                                +48 852 369 112      tomasz.dabrowski@example.com                                                                         NULL                                                                                                                                                                                                                                                            2
8           Agnieszka                      Zielinska                                +48 951 753 852      agnieszka.zielinska@example.com                                                                      NULL                                                                                                                                                                                                                                                            2
9           Jacek                          Szymanski                                +48 357 951 486      jacek.szymanski@example.com                                                                          NULL                                                                                                                                                                                                                                                            2
10          Monika                         Wojciechowska                            +48 753 159 852      monika.wojciechowska@example.com                                                                     NULL                                                                                                                                                                                                                                                            2

(10 rows affected)


Completion time: 2025-02-01T17:08:10.7496780+02:00
*/


SELECT* FROM Klient_Kopia;
/*IdKlient    Imie                           Nazwisko                                 NrTelefonu           Email                                                                                                Uwagi
----------- ------------------------------ ---------------------------------------- -------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11          Jan                            Kowalski                                 +48 888 888 888      jan.kowalski@example.com                                                                             test

(1 row affected)


Completion time: 2025-02-01T17:09:12.3274995+02:00
*/
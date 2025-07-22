Temat: projektowanie i konfigurowanie rozproszonej bazy danych

Projekt: Wypozyczenia samochodów

1. Opracuj pisemnie krótką analizę projektu rozproszonej bazy danych (dla swojego tematu), uwzględniając poniższe elementy.

a) Przyczyny rozproszenia danych – na przykład istnienie wielu oddziałów firmy.

Wypozyczenia samochodów w trakcie rozwijania swojej działalności otwarła 2 nowe oddziały w innych miastach. Obecnie łącznie posiada 3 oddziały rozmieszczone geograficznie w: Kaliszu (siedziba główna – centrala i serwis), Ostrowie Wielkopolskim (serwis) oraz Nowych Skalmierzycach (serwis). Każdy oddział korzysta z odrębnej, sieciowej bazy danych. Połączenie tych baz w ramach jednolitego systemu rozproszonej bazy danych pozwala na uzyskanie dodatkowej funkcjonalności – zarówno dotyczącej bieżącej działalności firmy (np. obsługa wypozyczeń z uwzględnieniem dostępności samochodów w poszczególnych oddziałach) oraz przetwarzania analitycznego danych archiwalnych
(np. generowanie raportów, zestawień statystycznych).

b) Lokalizacje bazy danych – liczba, rodzaj i fizyczne rozmieszczenie (np. centrala w Warszawie, oddziały regionalne w Poznaniu i Wrocławiu); wymagane są przynajmniej 2 lokalizacje.

SQL2 Ostrów Wlk.
serwis
 
SQL1 Kalisz
centrala i serwis
 
SQL3
Nowe Skalmierzyce
serwis (oddział nieimplementowany)

c) Topologia systemu – schemat połączeń pomiędzy lokalizacjami – na przykład: każdy z każdym, gwiazda, płatek śniegu).

Ponieważ liczba oddziałów jest mała (3), zastosowano topologię typu „każdy z każdym”, która zapewnia optymalne połączenie serwerów i ich wzajemne współdziałanie. 
Sieciowe i rozproszone bazy danych – lista zadań C4


d) Schemat bazy danych w poszczególnych lokalizacjach (podział schematu globalnego bazy – pionowy lub poziomy; tabele bez podziału – replikowane).

 
Podział schematu bazy danych:

– podział poziomy (taka sama struktura tabel, potencjalnie różne dane);

– podział pionowy (różnice w strukturze tabel);

– replikacja (identyczna struktura oraz dane).

e) Procesy i przepływ danych pomiędzy lokalizacjami (np. przenoszenie klienta z jednego oddziału do drugiego; regularne kopiowanie cennika usług z centrali do oddziałów):

– ujednolicanie opisu oferty samochodów oraz ich cen poprzez przesyłanie danych z centrali w Kaliszu do pozostałych oddziałów;

– śledzenie bieżących stanów aktywności samochodów w poszczególnych oddziałach;

– kopiowanie danych klienta z jednego oddziału do drugiego;

– generowanie globalnych raportów i zestawień statystycznych – na podstawie danych zebranych ze wszystkich oddziałów.

f) Określenie, który serwer traktujemy jako bazowy (tzn. którą lokalizację traktujemy jako lokalną, a które jako zdalne).

Serwerem bazowym (lokalnym) jest centrala w Kaliszu (SQL1), natomiast serwery w Ostrowie Wielkopolskim (SQL2) oraz Nowych Skalmierzycach (SQL3) – traktowane są jako zdalne.


Temat: replikacja danych


1. Opracuj pisemnie projekt replikacji w bazie rozproszonej, zgodnie z wybranym tematem. Wykorzystaj wyniki swojej pracy nad listami zadań C4 i C5. Uwzględnij poniższe elementy:

a) określenie potrzeb replikacji – ustal, czy replikacja w bazie rozproszonej jest konieczna dla działania systemu, czy też jest wskazana ze względu na wydajność lub bezpieczeństwo;

W rozproszonej bazie danych firmy handlowo-usługowej replikacja danych jest konieczna ze względu na potrzebę ujednolicania opisu oferty produktów we wszystkich oddziałach prowadzących sprzedaż.



b) wybór danych, które mają być replikowane – określ tabele, widoki lub procedury przechowywane, które mają być powielane między lokalizacjami; zdefiniuj także ewentualne filtry (poziome lub pionowe) i transformacje danych;

Replikowane tabele: [Kategoria], [Producent], [Model], [WypozyczenieStatus].

Kopiowanie bezpośrednie bez transformacji i filtrów poziomych.


c) określenie poziomu autonomii jednostek uczestniczących w replikacji – przeanalizuj wymagany poziom spójności transakcyjnej pomiędzy lokalizacjami objętymi replikacją (od czasowej zbieżności danych do ich natychmiastowej spójności transakcyjnej);

Poziom autonomii jednostek uczestniczących w replikacji (oddziałów firmy) jest wysoki – do ich prawidłowego działania wystarcza synchronizowanie danych oferty samochodów jeden raz dziennie, rano – przed otwarciem serwisów (9:00–18:00).


d) wybór strategii, topologii i scenariusza replikacji – zależnie od wymogów aplikacji oraz dostępnej konfiguracji sprzętowej, programowej i sieciowej.

Strategia: replikacja migawkowa.

Topologia: centralny publikator połączony z dystrybutorem (SQL1); subskrybenci – serwisy w Ostrowie Wielkopolskim (SQL2) i Nowych Skalmierzycach (SQL3).

Subskrypcja: wymuszana (ang. push subscription) przez centralę w Kaliszu (SQL1).

 Scenariusz: synchronizacja wykonywana automatycznie jeden raz dziennie o godzinie 8:00.


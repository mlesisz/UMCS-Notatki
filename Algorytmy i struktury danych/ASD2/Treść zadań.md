## Janusz biznesu



Janusz planuje zrobić zakupy! Oszczędność naszego bohatera spowodowała, że zamierza bardzo dokładnie zaplanować swoją trasę. Janusz wszystkie produkty kupuje na promocjach. Niestety promocje na produkty, które chce kupić występują w różnych sklepach oraz w różne dni! Klucz do sukcesu to jak najmniejszy koszt wojaży do wybranych sklepów! Na koszt składa się czas oraz odległość. Nasz bohater wyliczył, że jedna minuta jego trasy jest warta 18 gr, zaś każdy kilometr przejechany automobilem 49 gr.

Nasz rodak niewątpliwie posiada umiejętności kartografa (przynajmniej tak uważa jego syn...), co pozwoliło na wykreślenie dokładnej mapy okolicznych sklepów. Niestety nie zna czasu i odległości pomiędzy każdym ze sklepów, jednakże jego aktualna wiedza jest wystarczająca aby połączenia między placówkami tworzyły spójną całość. Spora ilość prostych linii łączących miejsca zakupów, odległości i czas naniesione na schemat przyprawiły Janusza o ból głowy.

Napisz program, który pomoże naszemu bohaterowi zaoszczędzić możliwie największą liczbę pieniędzy na trasie dom - wybrany sklep.
WEJŚCIE

Program wczytuje liczbę naturalną V, która definiuje ile sklepów jest w okolicy (V-1). Następnie program powinien wczytać liczbę naturalną E, która jest liczbą połączeń pomiędzy sklepami. W kolejnym kroku program powinien wczytać E sekwencji A B l0 t0 l1 t1, gdzie A i B to liczby odpowiadające placówkom naniesionym na mapę, zaś l0 t0 to długość i czas na trasie z A do B, a l1 t1 z B do A. Następnie algorytm powinien wczytać wartość S będącą ilością sklepów oraz S wartości, które będą identyfikatorami sklepów, które nasz bohater odwiedzi podczas wojaży trwających S dni. Numerem 0 na schemacie Janusza jest oznaczony jego dom.

0 <= A, B, V, S, l0, t0, l1, t1 <= 30 000
0 <= E <= 1 000 000 000
0 <= V <= 30000
WYJŚCIE

Na wyjściu algorytm powinien wyświetlić średnią arytmetyczną najmniejszych możliwych kosztów z każdego dnia. Wynik powinien być podany z precyzją do trzech miejsc po przecinku.
PRZYKŁADOWE WEJŚCIE

4 5
0 1 8.0 12 5.0 11
0 2 7.0 12 4.0 11
0 3 14.0 25 11.0 20
1 3 8.0 11 4.0 11
2 3 7.0 11 7.0 11
2 1 3

PRZYKŁADOWE WYJŚCIE

14.940

## Janusz biznesu II



Podczas zakupów Janusz spotkał swojego starego znajomego Zbyszka. Zbyszek jest bardzo rozsądnym facetem i podobnie do Janusza jest bardzo oszczędny. Nasz bohater pochwalił się swoim procesem optymalizacji. Jednak nie zrobiło to żadnego wrażenia na Zbyszku. Ten już miał podobny pomysł i dodatkowo go usprawnił. Ulepszenie polegało na tym, żeby zarejestrować się w aplikacji umożliwiającej przewóz innych obywateli za pieniądze. "To nie głupi pomysł!" - pomyślał Janusz, skoro i tak przemieszcza się po mieście dlaczego nie miałby tego wykorzystać i zarobić!

Usprawnij poprzedni program tak by brał pod uwagę ewentualne zyski naszego rodaka.
WEJŚCIE

Program wczytuje liczbę naturalną V, która definiuje ile sklepów jest w okolicy. Następnie program powinien wczytać liczbę naturalną E, która jest liczbą połączeń pomiędzy sklepami, które naniósł na swój plan Janusz. W kolejnym kroku program powinien wczytać E sekwencji A B l0 t0 p0 l1 t1 p1, gdzie A i B to liczby odpowiadające placówkom naniesionym na mapę, zaś l0 t0 p0 to długość, czas i ewentualny zarobek na trasie z A do B, a l1 t1 p1 z B do A. Następnie algorytm powinien wczytać wartość S będącą ilością sklepów oraz S wartości, które będą identyfikatorami sklepów, które nasz bohater odwiedzi podczas wojaży trwających S dni. Numerem 0 na schemacie Janusza jest oznaczony jego dom.

0 <= A, B, V, S, l0, t0, p0, l1, t1, p1 <= 30 000
0 <= E <= 1 000 000 000
0 <= V <= 30000
WYJŚCIE

Na wyjściu algorytm powinien wyświetlić średnią arytmetyczną najmniejszych możliwych kosztów z każdego dnia. Wynik powinien być podany z precyzją do trzech miejsc po przecinku. Może dojść do sytuacji, gdy podróżowanie na pewnym odcinku będzie przynosiło Januszowi ciągłe profity. W takiej sytuacji należy zmusić naszego bohatera by szybko wracał do domu ze swoimi zakupami, zanim zrobi to jego ukochana, zniecierpliwiona Grażyna, wyświetlając komunikat "DO DOMU!".
PRZYKŁADOWE WEJŚCIE

4 5
0 1 8.0 12 0 5.0 11 0
0 2 7.0 12 0 4.0 11 0
0 3 14.0 25 0 11.0 20 10
1 3 8.0 11 0 4.0 11 0
2 3 7.0 11 0 7.0 11 0
2 1 3

PRZYKŁADOWE WYJŚCIE

10.250

## Organizacja zakupów



W związku z tym, że naszemu bohaterowi udało się zoptymalizować drogę na zakupy, czas na doskonalenie poruszania się po sklepie. Szukane przez naszego bohatera produkty znajdują się na konkretnych stanowiskach tj. stoisko mięsne, stoisko rybne, stoisko piekarnicze... Dodatkowo nasz rodak nie bardzo chce odwiedzać stoiska, które nie zawierają interesujących go produktów. Musi oszczędzać swój czas! Oczywiście wykluczenie nieinteresujących nas stanowisk w sklepie, nie wyklucza dotarcia do tych niezbędnych.

Stanowiska łączą różne drogi, a na nich znajdują się półki z różnymi produktami. Problemem są czające się na każdej półce promocje, które z pewnością skuszą naszego bohatera. Niesamowicie opłacalne oferty na niepotrzebne przedmioty mogłyby skłonić Janusza do nieoczekiwanych zakupów. Utożsamianych z niepotrzebnymi wydatkami. Oczywiście, czym droższy produkt na ścieżce tym zakupy stają się mniej opłacalna dla Janusza. Na szczęście taka sytuacja miałaby miejsce tylko raz, po co dwa razy kupować to samo?! Z tego powodu musi ograniczyć tego typu wydatki. Plan jest prosty odwiedzić jedynie interesujące Janusza stanowiska i ograniczyć koszty zakupu produktów promocyjnych z półek.

Niestety nasz mistrz oszczędzania posiada cały plan sklepu i nie potrafi poradzić sobie ze znalezieniem najlepszej ścieżki do wszystkich interesujących go produktów. Ponownie potrzebuje Twojej pomocy!
WEJŚCIE

Algorytm na wejściu otrzymuje liczbę M i N, M mówi o liczbie stanowisk, zaś N o ilości połączeń pomiędzy nimi. Następnie program powinien wczytać M wartości 0 lub 1. 0 jeśli stoisko nie interesuje Janusza i 1 w przeciwnym wypadku. Kolejno program powinien wczytać N sekwencji wartości A B V, gdzie A B określa numery odpowiednich stanowisk, a V to liczba całkowitą będąca dodatkowym kosztem na drodze pomiędzy nimi.

0 <= N, M, A, B, V <= 2 000 000 000
WYJŚCIE

Program powinien wypisać całkowitą ilość dodatkowych kosztów, jaką poniesie Janusz, poruszając się pomiędzy wybranymi stanowiskami.
PRZYKŁADOWE WEJŚCIE

4 6
1 1 0 1
0 2 5
1 0 4
1 2 2
1 3 1
3 0 7
3 2 3 

PRZYKŁADOWE WYJŚCIE

5

## Fachowcy



Januszowi od pewnego czasu zaczęły doskwierać niewygody mieszkania w bloku. Brak prywatności, ciasnota i sąsiedzi rozbijający kotlety o 6 rano doprowadziły naszego bohatera do poważnej decyzji jaką jest budowa domu. Postanowił, że zacznie od planów jednak na wstępie wątpliwości budzi hydraulika. Janusz ma bardzo konkretne wymagania dotyczące wydajności każdego kranu i przyłącza. Przeglądając otrzymany plan zaczął się zastanawiać czy przy odkręconym tylko jednym kranie w danym momencie jest w stanie uzyskać z niego oczekiwaną ilość wody (podawanej w swojej własnej Januszowej jednostce). Ustalenie tego nie jest jednak proste. Na planie każda rurka ma określoną wydajność oraz zawiera informację w którą stronę może płynąć woda. Numer węzła głównego przy pomocy którego woda wpływa do instalacji jest oznaczony na schemacie. Janusz wie również, że węzły do których woda wpływa ale nie wypływa są przyłączami wyjściowymi. Dla każdego z nich musi sprawdzić czy maksymalny przepływ wody jest co najmniej taki jak zakłada.
Wejście:

W pierwszej linii program wczytuje trzy liczby naturalne V, E oraz S. Pierwsza z nich definiuje ilość węzłów na planie, druga ilość połączeń między nimi natomiast ostatnia określa węzeł początkowy. W kolejnym kroku program powinien wczytać E opisów połączeń między węzłami składających się z trzech liczb naturalnych A, B oraz W. Pierwsze dwie liczby to numery węzłów które łączy trasa z A do B, natomiast W określa jej wydajność. Węzły są numerowane od 0.

Należy wykorzystać wbudowaną funkcję unsigned long zapytajJanusza(unsigned id) aby sprawdzić jaka jest oczekiwana minimalna wydajność testowanego węzła wyjściowego.
Wyjście:

Na wyjściu program powinien zwrócić informację czy wydajność każdego z węzłów wyjściowych jest co najmniej taka jak zakłada Janusz. Każda linia wyjścia rozpoczynana jest od numeru węzła. Jeżeli własność jest spełniona to dodawana jest wiadomość „OK”. W przeciwnym przypadku wyświetlana jest informacja „NIE”, oraz ustalony maksymalny przepływ. Informacje powinny być wyświetlane w kolejności malejącej numerów węzłów.

0 <= V <= 25000

0 <= E <= 10000000

1 <= W <= 25000000
Przykładowe wejście:

6 8 0
0 1 2
0 2 4
0 3 3
0 4 3
2 3 5
1 4 2
2 5 4
4 5 4

Przykładowe wyjście:

5 NIE 8
3 OK

Funkcja w przykładzie jest zdefiniowana następująco:

unsigned long zapytajJanusza(unsigned id) {
	unsigned long value = 0;
	switch( id ) {
	case 3:
		value = 7;
		break;
	case 5:
		value = 9;
		break;
	}
	return value;
}

## Poważny gracz

Janusz od zawsze uważał się za specjalistę w absolutnie wszystkim. Oczywiście kiedy ktokolwiek próbował praktycznie zweryfikować jego wiedzę przypominał sobie, że zostawił mleko na gazie. Teraz jednak pojawił się prawdziwy problem. Jego szwagier wyzwał go na pojedynek w grze dekoder. Zasady są bardzo proste. Plansza wygląda jak drzewo gdzie w każdym węźle przechowywany jest fragment hasła oraz cyfra. Gracz buduje je wykonując serię insertów. Gracz dostaje liczbę i wyszukuje węzeł zgodny z tym numerem. Jeżeli udało mu się go znaleźć to wypisuje części hasła zawarte w nim aż do korzenia usuwając wykorzystane węzły. Jeżeli usuwany węzeł posiada dwóch potomków zastępowany jest zawsze swoim następnikiem. Gracz który w określonym czasie ułoży największą liczbę haseł wygrywa. Janusz spróbował w domu wykonać kilka rund. Niestety nie poszło mu najlepiej. Postanowił zatem, że spróbuje załatwić szwagra sposobem. Potrzebuje tylko programu który zasymuluje kroki gry.
Wejście:

W pierwszej linii wejścia program otrzymuje dwie liczby n i m oznaczające kolejno ilość węzłów w drzewie oraz ilość wyszukań. Następnie w n liniach znajdują się pary składające się z liczby a będącej kluczem w drzewie i ciągu znaków b będącego przechowywaną wartością. Pierwszy element jest korzeniem drzewa. W kolejnym kroku, w m liniach program otrzymuje liczbę x będącą poszukiwanym kluczem węzła.
Wyjście:

Na wyjściu program powinien wypisać kod od znalezionego węzła do korzenia. Jeżeli nie udało się znaleźć węzła o odpowiednim kluczu na standardowym wyjściu powinien pojawić się komunikat NIE.

1 ≤ n ≤ 500000

1 ≤ m < n

1 ≤ a, x ≤ 750000
Przykładowe wejście:

9 4
10 kota
5 ma
15 Dana
3 Te
8 Ala
11 st
12 Ostatni
18 testowa
4 xyz
8 20 3 12

Przykładowe wyjście:

Alamakota
NIE
Test
Ostatni

## Klienci

Janusz awansował w pracy. Obecnie otrzymał posadę handlowca. Jego zadaniem jest utrzymywanie kontaktów z klientami i sprzedaż produktów. Janusz codziennie odwiedza jednego klienta. Rano otrzymuje od kierownika informację w jakiej nieprzekraczalnej odległości od firmy powinien szukać kolejnego zlecenia. Dzięki temu dyspozytor może optymalnie rozdzielać pracę handlowców w całym kraju. Dodatkowo każdy klient ma swój priorytet. Oznacza to, że Janusz powinien znaleźć klienta znajdującego się jak najdalej od firmy nie przekraczając maksymalnej odległości. Jeżeli w tej samej odległości znajduje się więcej niż jeden klient to Janusz wybiera tego z najwyższym priorytetem. Jeżeli więcej niż jeden klient ma ten sam priorytet wybierany jest ten który czeka najdłużej. Czasami zdarza się tak, że w zakładanej odległości nie ma żadnego oczekującego klienta. Wówczas Janusz zostaje w biurze. Oczywiście zlecenia są jednorazowe. Manualne wyszukiwanie celu podróży zajmuje wszystkim pracownikom sporo cennego czasu. Można to usprawnić pisząc prosty program. Pomóż handlowcom i napisz program który pomoże w wyborze zleceń.
Wejście:

W pierwszej linii program wczytuje liczbę naturalną N określającą ilość komend programu. Następnie program wczytuje n komend działających w następujący sposób:

* A o n p – dodanie klienta n w odległości o od firmy z priorytetem p

* F o – wyszukanie klienta w odległości nie większej niż o. Jeżeli w tej samej odległości jest więcej niż jeden klient wybierany jest ten o najwyższym priorytecie.
Wyjście:

Na wyjściu dla każdej operacji F program powinien zwrócić nazwę wybranego klienta. Jeżeli w zakładanej odległości nie ma żadnego oczekującego klienta wyświetlany jest komunikat „BRAK”.

0 <= N <= 500000
Przykładowe wejście:

10
A 4.3 klient1 5.1
A 3.8 klient2 6
A 5 klient3 2.5
F 4.5
A 3.8 klient4 6.5
F 4
A 9.1 klient5 2
F 4
F 9
F 1

Przykładowe wyjście:

klient1
klient4
klient2
klient3
BRAK

Uwaga:
Program powinien wykorzystywać samodzielną implementację drzew czerwono czarnych.

## Optymalizacja

Janusz dowiedział się, że w firmie szykują się zmiany. Opracowany niedawno system wybierania klientów, do których jeżdżą handlowcy, wymaga poprawek. Zarząd postanowił, że będą po prostu wysyłać pracowników do konkretnych miast. Co więcej, okazuje się, że nie zawsze wszystko da się załatwić podczas jednego spotkania. Oznacza to, że niektórych klientów trzeba będzie odwiedzić więcej niż raz. W obrębie danego miasta zawsze wybierany jest klient o najwyższym priorytecie. Może jednak zdarzyć się sytuacja, gdzie więcej niż jeden klient ma taki sam priorytet. Wówczas decyduje większa ilość pozostałych odwiedzeń, wymaganych do załatwienia sprawy. Jeżeli zarówno priorytet jak i pozostała ilość odwiedzeń jest równa, wybierany jest ten klient, który najdłużej oczekuje na swoją kolej. Czasami w podanym mieście nie ma oczekującego klienta. Wtedy pracownik zostaje w biurze i zajmuje się innymi zadaniami. Zlecenie jest uważane za zrealizowane po odwiedzeniu klienta wymaganą ilość razy. Co ważne, pracownicy znacznie częściej wysyłani są do dużych miast niż na prowincję. Mnogość warunków spowodowała u Janusza potworną migrenę. Pomóż pracownikom raz jeszcze i napisz program, który zautomatyzuje proces wyznaczania klientów.
Wejście:

W pierwszej linii program wczytuje liczbę naturalną N określającą ilość komend programu. Następnie program wczytuje n komend działających w następujący sposób:

* A m n p i – dodanie klienta n w mieście m z priorytetem p oraz wymaganą ilością odwiedzeń i

* F m – wyszukanie klienta w mieście m. Jeżeli w tej samej odległości jest więcej niż jeden klient, wybierany jest ten o najwyższym priorytecie. Dla klientów o równym priorytecie decyduje większa ilość pozostałych odwiedzeń.
Wyjście:

Na wyjściu dla każdej operacji F program powinien zwrócić nazwę wybranego klienta. Jeżeli w podanym mieście nie ma żadnego oczekującego klienta, wyświetlany jest komunikat „BRAK”.

0 < N <= 500000
Przykładowe wejście:

10
A Krakow klient1 3.6 2
A Warszawa klient2 6 1
A Lublin klient3 4 1
F Krakow
A Krakow klient4 2 3
A Lublin klient5 4 1
F Krakow
F Poznan
F Krakow
F Lublin

Przykładowe wyjście:

klient1
klient1
BRAK
klient4
klient3

Uwaga:
Program powinien wykorzystywać samodzielną implementację drzew splay.

## Lista przebojów



Janusz dobry mąż i ojciec postanowił zabrać swoją całą rodzinę na wycieczkę. Wymyślił, że pojadą na spływ kajakami nad Wieprzem w miejscowości Zwierzyniec. Niestety zanim wyruszyli powstał pewien spór pomiędzy członkami rodziny. Nie mogli ustalić listy utworów, które będą im towarzyszyć podczas trasy. Każdy notował wybrane przez siebie utwory na kartce przygotowanej przez Janusza. Niestety dochodziło do sytuacji, gdy jeden członek rodziny skreślał utwory innego, co wzmacniało spór. I tak niektóre utwory były usuwane i dodawane po kilka razy..., a jak pamiętamy Janusz jest bardzo oszczędny i ciągłe marnowanie papieru na kolejne listy utworów doprowadziło go do szewskiej pasji. W związku z powyższym postanowił poprosić Cię o pomoc. Twoim zadaniem jest stworzyć program, który pozwoli modyfikować listę przebojów.

Należy zastosować B-drzewa, dzięki którym wszystkie dane o utworach łatwo zostaną zapisane na dysku twardym. Ponadto Janusz zasugerował, żeby utwory automatycznie ustawiały się w kolejności od najpopularniejszego do tych mniej popularnych. Wskaźnik popularności reprezentowany jest przez unikalne miejsce na światowej liście przebojów. Nasz bohater aby utrudnić innym ciągłe usuwanie utworów poprosił, aby napisany przez Ciebie program wyszukiwał utworów po ich popularności a nie po nazwie.
WEJŚCIE

Algorytm na wejściu otrzymuje liczbę naturalną N, która mówi o liczbie operacji naszego algorytmu. Operacje dzielimy na A, R oraz S:
A - jest to operacja dodania utworu do naszej listy. W tej operacji algorytm powinien wczytać sekwencję wartości X S, gdzie X jest liczbą naturalną i wskazuje popularność utworu, a S to jednowyrazowa nazwa utworu.
R - jest to operacja usunięcia utworu o wskazanej popularności. W tej operacji algorytm powinien wczytać jedną liczbę naturalną, będącą popularnością utworu.
S - jest to operacja sprawdzania, czy utwór o wskazanej popularności znajduje się na liście. W tej operacji algorytm powinien wczytać jedną liczbę naturalną, będącą popularnością utworu.
0 <= N, popularność <= 2 000 000 000

WYJŚCIE
Dla każdej operacji S algorytm powinien wyświetlić odpowiedź:
- jeśli znalazł utwór o danej popularności, powinien wyświetlić nazwę utworu,
- jeśli nie znalazł utworu spełniającego wymagań popularności, powinien wyświetlić '-'.
- 
WYMAGANIA
Rozwiązanie powinno wykorzystywać samodzielną implementację B-drzew, gdzie parametr T charakterystyczny dla B-drzewa zawiera się w przedziale [10,20].
PRZYKŁADOWE WEJŚCIE

7
A 11 Utwor1
A 311 Utwor2
S 11
A 12 Utwor3
R 11
S 11
S 12

PRZYKŁADOWE WYJŚCIE

Utwor1
-
Utwor3

## Wyszukiwarka piosenek



Janusz doszedł do wniosku, że utrudnienia poszukiwania utworów może być bardzo uciążliwe podczas drogi. W związku z tym wpadł na pomysł, że trzeba to wszystko usprawnić. Nasz bohater pozostawia to zadanie Tobie.

Należy stworzyć kolejny system, który pozwala w sprawny sposób przeszukiwać stworzoną listę przebojów. Janusz chciałby mieć program, który pozwoli na znajdowanie wszystkich utworów, których nazwa zaczyna się od pewnych liter. Ułatwi to naszemu bohaterowi przeglądanie i odtwarzanie wybranych utworów.
WEJŚCIE

Algorytm na wejściu otrzymuje liczbę naturalną N, która mówi o liczbie operacji naszego algorytmu. Operacje dzielimy na A oraz S:

A - jest to operacja dodania utworu do naszej listy. W tej operacji algorytm powinien wczytać jednowyrazową nazwę utworu. Zakładamy, że nazwa składa się jedynie z małych liter.

S - jest to operacja sprawdzania, czy istnieją utwory o wskazanym prefiksie lub nazwie.
WYJŚCIE

Dla każdej operacji S algorytm powinien wyświetlić odpowiedź:

- jeśli znalazł utwory o danym prefiksie, powinien wyświetlić nazwę wszystkich utworów w kolejności alfabetycznej,

- jeśli nie znalazł żadnego utworu spełniającego wymagania, powinien wyświetlić '-'.

0 <= N <= 2 000 000 000
PRZYKŁADOWE WEJŚCIE

6
A utwo
A utwor
S utwor
S utwo
A utworr
S uz

PRZYKŁADOWE WYJŚCIE

utwor
utwo
utwor
-

WYMAGANIA
Rozwiązanie powinno wykorzystywać samodzielną implementację drzew Trie.

## Biblioteka



Pierwszym punktem wycieczki jest Muzeum Lubelskie w Lublinie. Znajduje się tam biblioteka, która zajmuje się prowadzeniem całokształtu spraw związanych z gromadzeniem, przechowywaniem, ewidencjonowaniem, opracowywaniem i udostępnianiem księgozbioru związanego z działalnością statutową Muzeum.

Jako, że Janusz rzadko czyta literaturę, a jeszcze rzadziej odwiedza takie miejsca jak biblioteka nie jest w stanie poradzić sobie ze zlokalizowaniem "interesujących" go książek i czasopism. Księgozbiór główny zlokalizowany jest w dwóch pomieszczeniach magazynowych. Każdy egzemplarz zbioru ma swoje miejsce tj. alejka, numer regału itd..

Napisz program, który ułatwi znajdowanie interesujących naszego bohatera czasopism.
WEJŚCIE

Algorytm na wejściu otrzymuje liczbę naturalną N, która mówi o liczbie operacji naszego algorytmu. Operacje dzielimy na A oraz S:
A - jest to operacja dodania położenia utworu literackiego o podanym tytule do biblioteki. W tej operacji algorytm powinien wczytać jednowyrazową nazwę dzieła oraz jego miejsce w zbiorze.
S - jest to operacja odczytania położenia dzieła o podanej nazwie.
WYJŚCIE

Dla każdej operacji S algorytm powinien wyświetlić odpowiedź:
- jeśli znalazł podane dzieło, powinien wyświetlić jego położenie,
- jeśli nie znalazł żadnego utworu literackiego o takiej nazwie, powinien wyświetlić '-'.

Długość nazwy i określenia położenia to maksymalnie 25 znaków. W bibliotece nie ma powtarzających się pozycji literackich.
1 <= N <= 100000
PRZYKŁADOWE WEJŚCIE

7
A Encyklopedia_PWN A3rE12
A Encyklopedia_Powszechna A3rE13
S Encyklopedia_PWN 
A Polski_Slownik A12rS13
S Slownik_Synonimow
S Polski_Slownik 
S Historia_Polski

PRZYKŁADOWE WYJŚCIE

A3rE12
-
A12rS13
-

WYMAGANIA
Program powinien wykorzystywać samodzielnie zaimplementowaną tablicę z hashowaniem.

## Kolizje



Janusz dowiedział się z gazety, że lotnisko Chopina w Warszawie boryka się z nie lada problemem. Olbrzymie natężenie ruchu powietrznego powoduje zamęt wśród kontrolerów lotu. W zawiązku z tym zaczęto obawiać się kolizji samolotów. Człowiek nie zawsze jest w stanie zobaczyć, które maszyny na mapie znajdują się najbliżej siebie. Nasz bohater wkrótce leci na wakacje, więc bardzo go zaniepokoiła ta wiadomość. Zaczął zastanawiać się nad oprogramowaniem, które będzie wyszukiwało maszyny znajdujące się najbliżej siebie na mapie. Jeżeli dwa samoloty znajdują się zbyt blisko uruchamiany jest alarm. Co ważne raz znaleziona para jest wyłączana z kolejnych poszukiwań. Jeżeli w tej samej odległości znajduje się więcej niż jedna para, alarm jest wyświetlany w pierwszej kolejności dla tej, która zawiera samolot o niższym numerze identyfikacyjnym. Jeżeli ten samolot ma więcej dopasowań w tej samej odległości to również jako pierwszy rozpatrywany jest lot o niższym numerze. Pomóż Januszowi i napisz oprogramowanie wspomagające kontrolerów.
Wejście:

W pierwszej linii wejścia program otrzymuje liczbę naturalną N określającą liczbę samolotów na mapie oraz zmiennoprzecinkową L określającą odległość kolizyjną. Następnie w N liniach program otrzymuje trzy liczby naturalne I, X oraz Y, gdzie pierwsza z nich jest unikalnym numerem identyfikacyjnym lotu, natomiast pozostałe współrzędnymi na mapie.
Wyjście:

Na wyjściu program powinien wypisać pary numerów lotów których odległość między sobą nie przekracza odległości L, w kolejności od samolotów znajdujących się najbliżej siebie. Pierwszy numer w parze zawsze musi być mniejszy.

0 < N <= 50000
0 <= I <= 100000
0 <= X <= 2000000000
0 <= Y <= 2000000000
Przykładowe wejście:

6 2.5
14 30 31
202 3 3
989 32 29
101 2 3
325 8 11
497 7 13

Przykładowe wyjście:

101 202
325 497

## Ukryta sekwencja

Pioter szuka sposobu na łatwy zarobek i próbował już wielu rzeczy. Teraz zainteresowały go gry losowe tj. LOTTO. Uważa, że wszystko jest tam ustawione! By wygrać duże pieniądze w kumulacji należy odgadnąć zasady funkcjonowania systemu. Te zasady syn naszego bohatera usłyszał od swojego kolegi, w postaci bardzo ciekawej nowiny. Niestety nie do końca rozumie o co w niej chodzi!

CIEKAWA NOWINA KOLEGI PIOTERA - SEBY:

"Liczby podzielone są na pewne okresy. Okres jest sekwencją wielu liczb z zakresu od 0 do 100. W każdym okresie co najmniej dwa razy pojawia się pewna subsekwencja liczb - X. Suma dwóch poprzednich miejsca wystąpienia subsekwencji mówi o tym, gdzie subsekwencja pojawi się po raz kolejny w danym okresie. Pierwsza pozycja subsekwencji wykraczająca poza zakres okresu, pomniejszona o ilość elementów w okresie, będzie indeksem wystąpienia tej subsekwencji w kolejnym okresie liczb."

Pomóż Pioterowi odkryć pierwsze wystąpienie magicznej subsekwencji X w następnym okresie.
WEJŚCIE

Program wczytuje liczbę naturalną V, będącą ilością liczb w aktualnym okresie. Następnie program powinien wczytać V liczb naturalnych. W kolejnym kroku algorytm powinien wczytać liczbę naturalną P, a na koniec P liczb naturalnych reprezentujących subsekwencję X.

0 <= liczby w sekwencji <= 100
0 <= V, P, N <= 2 000 000 000
WYJŚCIE

Wyświetl pozycję pierwszego wystąpienia subsekwencji w kolejnym okresie. Zakładając, że sekwencje numerowane są od 0.
PRZYKŁADOWE WEJŚCIE

16
1 1 1 2 3 88 99 24 1 2 3 1 2 3 99 39
2
2 3

PRZYKŁADOWE WYJŚCIE

5

WYMAGANIA
Zadanie powinno być samodzielną implementacją algorytmu Rabina-Karpa.

## Gdzie jest Grażyna



Grażyna wyczytała w gazecie, że kuchnia to najbardziej prawdopodobne miejsce, gdzie można zastać statystyczną kobietę. Naszej bohaterce nie bardzo podoba się to stwierdzenie. W końcu uważa siebie za nowoczesną reprezentantkę tej płci, nie potrzebuje opinii innych, sama wie najlepiej, ile jest warta, gdzie spędza czas... no i ma smartfon! Doszła do wniosku, że osobiście zweryfikuje tą tezę. Chce sprawdzić z jakim prawdopodobieństwem można znaleźć ją w wybranych pomieszczeniach zacisza domowego, w określonym czasie. Dodatkowo ułatwi to rodzinie znalezienie kobiety, gdy będą mieli do niej jakąś bardzo ważną sprawę!

Napisz program, który obliczy prawdopodobieństwo znalezienie naszej bohaterki w określonych godzinach dla przedstawionych poniżej pomieszczeń:
0 - kuchnia,
1 - ogród,
2 - sypialnia,
3 - pokój rodzinny,
4 - łazienka,
5 - balkon.
WEJŚCIE

Program na wejście otrzymuje dwie godziny w formacie HH:mm, które mówią o przedziale czasowym do zweryfikowania, a następnie przyjmuje numer pokoju.

0 < HH <= 24
0 <= mm < 60
WYJŚCIE

Należy wypisać jakie jest prawdopodobieństwo pojawienia się Grażyny, w wybranym pomieszczeniu w danym przedziale czasowy. Wynik powinien być podany z dokładnością do dwóch miejsc po przecinku.
PRZYKŁADOWE WEJŚCIE

8:00
22:00
0

PRZYKŁADOWE WYJŚCIE

0.50

FUNKCJA PODAJĄCA GDZIE JEST GRAŻYNA W DANEJ GODZINIE

int Grazyna(int HH, int mm){
	if(HH >= 8 && HH < 15) return 0;
	else if(HH >= 15 && HH < 22) return 1;
	return 2;
}

WYMAGANIA
Zadanie powinno być rozwiązane metodą Monte Carlo.

## Ale upał

Januszowi w ostatnich dniach strasznie doskwierają upały. Jako człowiek wyjątkowo oszczędny postanowił ograniczyć zużycie prądu. Właśnie dlatego nie korzysta z wentylatorów ani klimatyzacji. Postanowił połączyć przyjemne z pożytecznym. Kupił zestaw swoich ulubionych napojów chłodzących (bezalkoholowych rzecz jasna). Chce je utrzymywać w optymalnej temperaturze. Postanowił, że wykorzysta do tego stare akwarium. Wypełnił je częściowo lodowatą wodą i wkłada do niego butelki. Janusz często sięga po napoje i odkłada je z powrotem skutkiem czego nie wszystkie butelki są pełne. Pojemność akwarium nie jest jednak nieskończona. W pewnym momencie woda się przeleje. Janusz boi się, że Grażyna zrobi wtedy straszną awanturę. Głowa rodziny ma mistrzowskie oko jednak niezbyt tęgą głowę. Jest w stanie łatwo stwierdzić ile centymetrów od dna znajduje się napój w butelce jednak w żaden sposób nie wie jak przeliczyć to na objętość. Utrudniają mu to również nieregularne kształty butelki. Z pomocą przyszedł mu producent napoju i opisał matematyczną funkcją jej kształt. Jest to połowa jej przekroju. Pomóż naszemu bohaterowi oszacować po której butelce woda w akwarium się przeleje.
Wejście:

W pierwszej linii wejścia program otrzymuje trzy liczby naturalne x, y oraz z będące rozmiarami akwarium w cm. Następnie wczytywana jest wartość p będąca stopniem wypełnienia akwarium wodą. W kolejnym kroku program wczytuje liczbę n a potem n liczb zmiennoprzecinkowych j opisujących wypełnienie butelki. Zakładamy, że butelka ma pomijalnie cienkie ścianki i jest pomijalnie lekka. Do sprawdzenia promienia butelki w dowolnej odległości od podstawy wykorzystaj funkcję wbudowaną double butelka(double cm). Podstawa butelki zawsze znajduje się w punkcie 0.
Wyjście:

Na wyjściu program powinien wypisać po której butelce akwarium się przepełni. Butelki są numerowane od 1. Jeżeli nie dojdzie do przelania wody wyświetlany jest komunikat "NIE".

0 < x, y, z < 100

0 < p < 1

0 < n <= 150
Przykładowe wejście:

30 30 20
0.9
5
2.1
3.0
4.1
5.7
1.1

Przykładowe wyjście:

3

Funkcja w przykładzie jest zdefiniowana następująco

double butelka(double cm) {
	return 10 - (cm-2) * (cm-2);
}

Uwaga:
Program powinien wykorzystywać samodzielnie zaimplementowane całkowanie numeryczne.

## Kto ma gorzej?



Pieter ostatnio pracuje nad ważnym dla siebie problemem. Zamawia z pewnego popularnego chińskiego portalu figurki kolekcjonerskie. Ponieważ dostawa idzie długo a za zakupy hurtowe jest znaczna zniżka Pieter postanowił zamówić od razu cały kontener figurek dla siebie i swoich kolegów (po paczce figurek każdego rodzaju). Każdy rodzaj figurek występuje w dwóch rodzajach ,,dużym’’ i ,,małym’’, a każdy kolega Pietera ma dostać trzy figurki wybranych przez siebie rodzajów i aby było sprawiedliwie nikt nie może dostać samych ,,dużych’’ ani samych ,,małłych’’ figurek.   Teraz Pieter siedzi nad listą wyborów swoich kolegów i myśli, które figurki zamówić ,,małe’’ a które ,,duże’ tak żeby nikt z kolegów nie dostał samych ,,małych’’ ani samych ,,dużych’’ figurek (Pieter kupuje po jednej paczce każdego rodzaju figurek, a więc dla każdego rodzaju figurek musi zdecydować czy ten rodzaj figurek zamawia w ,,dużym’’ czy ,,małym’’ rozmiarze).

Pieter nie za bardzo lubi rozwiązywać trudne problemy więc chodzi po domu podenerwowany.

   - Co ty masz za problemy młody, - powiedział Janusz - ożenisz się to dopiero będziesz miał problemy. Twoja matka kazała mi podzielić swoje koleżanki na trzy grupy tak żeby w jednej grupie nie znalazły się koleżanki, które są w posiadaniu takiego samego elementu garderoby. Ponieważ wszystkie koleżanki Twojej matki kupują ubrania  w naszym ulubionym dyskoncie, to wiadomo, że nie da się ich podzielić na dwie grupy.
   - A po co matka chce podzielić swoje koleżanki i dlaczego akurat na trzy grupy?- zapytał Pieter.
   - Co ty wiesz o życiu Pieter? Przecież Grażyny, które przypadkiem nałożą na imprezę taką samą część garderoby, dogryzają sobie wzajemnie przez cały wieczór i psują humory wszystkim. A wiesz przecież, że zbliżają się imieniny Twojej matki i chcielibyśmy, żeby w tym roku obyło się bez nieprzyjemnych incydentów. Twoja matka wymyśliła więc, że urządzi imieniny na trzy raty.
   - A dlaczego nie cztery?
   - A co ja wygrałem na loterii, żeby cztery razy urządzać imieniny Twojej matki?
   - Coś mi się wydaje, że mój problem jest jednak trudniejszy.
   - Co ty gadasz! Syn kolegi szwagra, ten w okularach, potrafi udowodnić, że Twój problem nie jest trudniejszy od mojego.

Polecenie:
Udowodnij, że istnieje wielomianowa redukcja z problemu Pietera do problemu Janusza.
Uwagi do zadania:

Osoby które chcą przystąpić do obrony dowodu, muszą przesłać jako rozwiązanie tego zadania program wyświetlający na standardowym wyjściu komunikat "Chce bronic" i zaznaczyć je do oceny.

## Racjonalny wybór

Janusz spoglądał z zadumą na podjazd domu obok, gdzie właśnie wjeżdżał nowy nabytek jego ulubionego sąsiada Władysława - maksymalnie 5-letnia Toyota.
- Spójrz, Pioter - rzekł do swego pierworodnego. - Takiemu to teraz dobrze. Będzie woził swoją Halinkę i dzieci takim cudeńkiem. Nam też by się zdało już zmienić Passata.
- Tato, co za problem? Jedźmy do komisu i poszukajmy czegoś.
- Synu… coś Ty taki narwany. To trzeba usiąść i na spokojnie.
- Dobrze, więc pozwól, że ja przejrzę ogłoszenia w internecie i wybiorę coś odpowiedniego. Jaki byś chciał samochód? Citroena? Skodę?
- Oj, Pioter, jak Ty życia jeszcze nie znasz. Najlepsze samochody to te, których koła zrobiły najmniej obrotów od czasu wyjechania z salonu.
- Czyli musimy uwzględnić przebieg samochodu i wielkość kół? A co, jeśli licznik był cofany?
- Pioter, nie mędrkuj! To nielegalne!
Chłopak zabrał się do pracy. Postanowił przewertować najpopularniejszą stronę z ogłoszeniami i przekazać ojcu listę 3 najlepszych dostępnych samochodów wraz z liczbą wykonanych przez nie pełnych obrotów kół.

Wejście:
Na wejściu program otrzymuje liczbę ogłoszeń n. W kolejnych liniach znajduje się n opisów ogłoszeń. Na każdy opis składa się nazwa samochodu w pierwszej linii opisu oraz dwie liczby p i d w drugiej linii, gdzie p jest liczbą zmiennoprzecinkową i oznacza przebieg samochodu w km, a d jest liczbą całkowitą i oznacza średnicę koła w calach.

Wyjście:
Na wyjściu program ma wypisać 3 nazwy samochodów o najmniejszej liczbie pełnych obrotów kół wraz z tą liczbą. Dane należy wypisać rosnąco względem liczby obrotów. Dla równej liczby obrotów należy najpierw wypisać dane samochodu, którego nazwa jest wcześniejsza w porządku alfabetycznym.

0 ≤ p ≤ 1000000
1 ≤ d ≤ 1000000
3 ≤ n ≤ 1000000

Należy przyjąć, że π=3.141593
Przykład:
Wejście:

5
Opel Antara
1234.65 12
Toyota Auris
3509.57 20
Citroen C5
9990.8 40
Kia Sportage
99999.12 400
Fiat Panda
3525.74 33

Wyjście:

Opel Antara
1289374
Fiat Panda
1338914
Toyota Auris
2199076

## Do poloneza

Piotr, gdy tylko przekroczył próg domu usłyszał głos rodzica.
- Pioter! Podejdź, no. Będziesz miał bojowe zadanie.
Chłopak posłusznie podreptał za głosem do kuchni, gdzie zastał ojca ślęczącego nad stosem tabel.
- Twoja siostra Andżela będzie miała w tym roku w szkole bal na zakończenie ósmej klasy. Jak wiesz jestem w trójce klasowej. Zgadnij kogo dyrektorka poprosiła o podobieranie dziewczynek i chłopców w pary do odtańczenia poloneza?
- Ciebie, tato?
- Synek, ja Ci wróżę z tą Twoją dedukcją świetlaną przyszłość. Pani dyrektor chciała uporządkować ich malejąco pod względem średniej ocen, odległości miejsca zamieszkania od szkoły i miesiąca urodzin. Tylko jeszcze nie zdecydowała o kolejności kryteriów. To się okaże tuż przed balem. Dlatego mi, Pioter, pomożesz. Ja tu już trochę poparowałem. W każdym wierszu masz po kolei: dziewczynka i trzy wartości (średnia, odległość, miesiąc urodzenia), a dalej chłopiec i znowu trzy wartości. Napiszesz mi program, który ustawi mi oddzielnie dziewczynki i chłopców w dobrej kolejności i podobiera ich po kolei w pary.
- X23ae7k? - przeczytał Piotr. - Jest takie imię?
- Pioter, nie wygłupiaj się, to kody przypisane uczniom. Przecież pani dyrektor nie mogła mi przekazać prawdziwych imion i nazwisk. RODO, mówi Ci to coś?
Piotr przez krótką chwilę zastanawiał się czy dobrze zrobił przyznając się ojcu do swoich umiejętności programistycznych, ale po krótkiej refleksji zabrał się do pracy.
Wejście:

W pierwszej linii wejścia znajduje się liczba całkowita n. W drugiej linii wejścia znajdują się trzy litery oddzielone spacjami: 's', 'd' i 'm', a ich kolejność decyduje o kolejności uporządkowania dzieci. W kolejnych n liniach są wiersze opisujące kolejne pary uczniów szkoły. Każda linia składa się z opisu dwóch uczniów: dziewczynki i chłopca. Na opis ucznia składa się kolejno jednowyrazowy napis kod oznaczający kod ucznia, jednej liczby zmiennoprzecinkowej s oznaczającej średnią, dwóch liczb całkowitych d i m, oznaczajacych kolejno odległość od miejsca zamieszkania w metrach oraz numer miesiąca urodzenia ucznia. Miesiące numerowane są od 1.
1 ≤ n ≤ 1000000
Wyjście:

Na wyjściu program powinien wypisać uporządkowane listy dziewczynek i chłopców w parach według podanej kolejności kryteriów. Para powinna być wyświetlona w postaci: kod1 kod2. Całą listę należy wyświetlić w jednej linii. W przypadku dwóch uczniów, których wszystkie odpowiadające wartości są równe, należy zachować kolejność wystąpienia na liście.
Przykład:
Wejście:

5
m s d
XXX1 3.5 345 12 YYY1 3.5 400 1 
XXX2 4.5 23 2 YYY2 2.3 400 1 
XXX3 3.5 120 12 YYY3 2.3 500 1 
XXX4 5.1 323 3 YYY4 2.3 600 1 
XXX5 5.1 4000 5 YYY5 3.5 400 1 

Wyjście:

XXX1 YYY1 XXX3 YYY5 XXX5 YYY4 XXX4 YYY3 XXX2 YYY2

## Ciężka praca

Janusz kilka dni temu znalazł swoją pracę marzeń. Jest kontrolerem maszyny numerującej samochody w fabryce. Jego zadaniem jest nadzorowanie urządzenia. Niestety nawet kierownik nie docenił pracowitości naszego bohatera. Wczoraj podczas nocnej zmiany Janusz zasnął na stanowisku pracy, nie dopilnował urządzenia przez co doszło do awarii. Maszyna nie działa a kolejka w serwisie jest bardzo długa. Szef mimo wszystko postanowił dać Januszowi jeszcze jedną szansę, jednak będzie musiał całą pracę wykonać ręcznie. Technik wyjaśnił jak działa urządzenie.
- Słuchaj no kolego. Maszynka składa się z zestawu okrągłych dysków. Na każdym dysku są stemple. Każdy stempel ma swoją sumę kontrolną. Manipulator łapie taki dysk i obraca wybierając odpowiedni stempel do znakowania. Sposób w jaki to robi opisuje sekwencja sterująca. Dostajesz informację o ile dysków przesunąć manipulator i o ile stempli obrócić nowo wybrany dysk. Przy każdej zmianie stanu dysków wyliczana jest suma kontrolna całego numeru. Po prostu dodajesz te sumy z wybranych stempli. Jak już ją wyliczysz to sprawdzasz czy pasuje do jakiegoś numeru na nadwoziu. Jeżeli się z którymś zgadza to wybijasz go na aucie i zdejmujesz wykorzystane stemple. Numer jest konkatenacją wszystkich znaków na obecnie wybranych stemplach. Musisz pamiętać, żeby po usunięciu stempla z dysku ustawić na nim następny z godnie z tym w jakiej kolejności zostały zamontowane na początku. Jeżeli opróżnisz cały dysk ze stempli to również go zdejmujesz. To proste.
Po powrocie do domu Janusz zawołał syna Piotra.
- Pioter! Szybko, chodź tutaj!
- Co się stało tato?
- Szef kazał mi wyznaczyć właściwe numery do aut. Wyjaśnił mi to ale nie mam pojęcia o co mu chodzi. Dał mi jakąś rozpiskę, na której jest napisane, jak się to robi. Próbowałem coś liczyć na kartce, ale to zajmuje całe wieki. Powtórzę Ci zatem prawdę życiową, którą mój dziadek przekazał mojemu ojcu, a on przekazał ją mi. Zapamiętaj to sobie na całe życie. W pracy najważniejsze jest żeby zarobić, ale się nie narobić. Weź no ty ten opis, zanieś go tym studentom informatyki drugiego roku UMCS, żeby napisali mi program, który wyznaczy numery do aut.
Ponieważ Piotrek to posłuszne dziecko, szybko pobiegł na uniwersytet i przekazał poniższe wytyczne.
Wejście:

W pierwszej linii wejścia program otrzymuje liczbę n określającą ilość list ze stemplami. W kolejnych n liniach program otrzymuje n opisów zawartości dysku. Każdy opis składa się z liczby m określającej początkową liczbę stempli na dysku a następnie w m liniach pary składające się z ciągu znaków s oraz liczby całkowitej c. Następnie program otrzymuje liczbę l po czym l numerów kontrolnych samochodów w kolejności rosnącej. W dalszym kroku program otrzymuję sekwencję sterującą rozpoczynając od liczby h a potem h par liczb całkowitych x i y gdzie x określa o ile dysków przesunąć manipulator a y o ile stempli obrócić dysk.

1 ≤ n ≤ 5000
1 ≤ m ≤ 1000
1 ≤ c ≤ 1000
1 ≤ l ≤ 5000
1 ≤ h ≤ 10000

-10000 ≤ x ≤ 10000

-10000 ≤ y ≤ 10000
Wyjście:

Na wyjściu program powinien wyświetlić listę par składającą się z sumy kontrolnej nadwozia oraz numeru seryjnego do którego udało się dopasować numer. Pary powinny zostać wyświetlone w kolejności w jakiej zostały znalezione.
Przykład 1:
Wejście:

3
3
X1 2
X2 3
X3 8
4
Y1 1
Y2 6
Y3 5
Y4 3
3
Z1 1
Z2 6
Z3 12
2
19 20
5
2 2 2 1 -1 1 2 1 2 1

Wyjście:

20 X1Y2Z3
19 X3Y3Z2

Przykład 2:
Wejście:

3
3
X1 2
X2 3
X3 8
4
Y1 1
Y2 6
Y3 5
Y4 3
3
Z1 1
Z2 6
Z3 12
4
3
4
15
25
3
1 1
-2 2
1 -1

Wyjście:

4 X1Y1Z1
15 X2Y2Z2
25 X3Y3Z3
3 Y4

## Przeładowany program

Janusz, jako modelowy wręcz ojciec spędza ostatnio całe wieczory z córką Andżelą, na rozwiązywaniu pracy domowej z matematyki. Nie od dziś wiadomo, że nauczyciele przesadzają z ilością zadań. Ostatnio uczennica codziennie przynosi do domu listy na których jest kilkadziesiąt równań do rozwiązania. Janusz nie jest jednak orłem z matematyki. Tę cechę odziedziczyła po nim córka. Mimo, że zwykle siedzą do późnych godzin wieczornych to często okazuje się, że w wynikach są błędy. Muszą je wówczas poprawiać. Do tego zadania są podchwytliwe i czasami zawierają błędy w ustawieniu nawiasów. To wszystko jednak nie jest jeszcze najgorsze. Już wkrótce w telewizji zacznie się nowy sezon ulubionego serialu Janusza, w związku z czym nie będzie miał czasu na pracę z Andżelą. Wiadomo, są w życiu rzeczy ważne i ważniejsze. Bohater wpadł zatem na genialny pomysł. Wystarczy stworzyć program który z listy równań wybierze te w których nawiasy są ustawione poprawnie i poda ich wyniki. Nie ma to jak tzw. “gotowiec”.

Wejście:

W pierwszej linii wejścia program otrzymuje liczbę n opisującą ilość równań do rozwiązania. Kolejne n linii zawiera równania r. Może się ono składać z liczb całkowitych, działań ‘+’, ‘-‘, ‘*’, ‘/’ oraz nawiasów ‘()’, ‘[]’, ‘{}’.

1 ≤ n ≤ 10000
Wyjście:

Na wyjściu program powinien wyświetlić wyniki równań których nawiasy są ustawione poprawnie. Jeżeli w równaniu jest błąd program powinien wyświetlić informację BLAD. Nawiasowanie jest uznawane za błędne wtedy kiedy z którejś strony brakuje nawiasu lub lewy nie zgadza się z prawym.

Przykład:
Wejście:

4
[(2+4)-8]*9
](16+8)-4
(3+4)*9
[(1+8)*4]+9-6

Wyjście:

-18
BLAD
63
39

## Obywatelska postawa

Miasto w którym mieszka Janusz od pewnego czasu boryka się z problemem wandali. Demolują wszystko co stanie na ich drodze. W nocy ich łupem padł passat Janusza. Nasz bohater szybko zgłosił to wszędzie gdzie tylko się dało. Niestety wszystkie organa ścigania są zajęte innymi ważniejszymi sprawami. To przelało czarę goryczy. Janusz pobiegł do ratusza porozmawiać z burmistrzem i dowiedzieć się dlaczego w tak dużym mieście nie ma jeszcze monitoringu.

- Panie Januszu, jesteśmy tylko małym biednym miastem. Pozyskanie funduszy na ten cel nie jest proste. Zwłaszcza, że mamy teraz inne ważniejsze wydatki, takie jak budowa pomnika operatorów wózków widłowych. Mamy co prawda kamery które otrzymaliśmy z województwa ale trzeba je jeszcze odpowiednio rozmieścić. Firma projektowa jest jednak bardzo droga.

- Znajdzie się na to rada, ale najpierw opracujmy reguły według których kamery powinny być rozmieszczone.

Janusz z burmistrzem zaczął przygotowywać wytyczne do rozmieszczenia kamer. Wiadomo, że miasto zbudowane jest na planie gwiazdy. Oznacza to, że z dowolnego punktu A do dowolnego punktu B można dotrzeć tylko jedną trasą. Przede wszystkim kamery powinny zostać rozmieszczone na najbardziej ruchliwych skrzyżowaniach, czyli takich w których zbiega się najwięcej dróg. Ustalili zatem ile minimalnie dróg powinno się zbiegać na skrzyżowaniu na którym zostanie zainstalowany monitoring. Każde monitorowane skrzyżowanie powinno oddzielać jedno skrzyżowanie bez kamery. Nie może jednak wystąpić sytuacja w której więcej niż trzy następujące po sobie skrzyżowania nie są monitorowane. Wówczas nawet jeżeli ilość dróg składających się na skrzyżowanie jest mniejsza niż ustalono kamera i tak zostanie na nim zainstalowana. Pierwsza kamera musi zostać umieszczona w centrum miasta, czyli w miejscu w którym stoi ratusz. To właśnie z tego miejsca powinno rozpocząć się rozmieszczanie kamer w głąb miasta. Jeżeli poruszając się w głąb miasta napotkamy skrzyżowanie spełniające warunki to od razu jest ono oznaczane do umieszczenia kamery. Burmistrza wciąż gryzło jednak jedno pytanie.

- Panie Januszu, cały czas zastanawiam się kto nam przygotuje mapę rozmieszczenia kamer. Przecież nie mamy na to funduszy.

- Jak to kto? Za darmo mogą nam to zrobić tylko studenci.
Wejście:

W pierwszej linii program otrzymuje dwie liczby całkowite n i m, określające liczbę skrzyżowań w mieście oraz minimalną ilość dróg które powinny zbiegać się na monitorowanym skrzyżowaniu. Skrzyżowania numerowane są od 1 do n. Ratusz zawsze znajduje się na skrzyżowaniu numer 1. W kolejnych n-1 liniach program otrzymuje parę liczb całkowitych a i b które reprezentują drogę łączącą dwa skrzyżowania o numerach a i b podawane warstwami gdzie a jest ojcem natomiast b synem.

1 ≤ n ≤ 250000
Wyjście:

Na wyjściu program powinien wyświetlić numery skrzyżowań na których powinny zostać umieszczone kamery zgodnie z wytycznymi podanymi w zadaniu w kolejności rosnącej. Skrzyżowania należy rozpatrywać w kolejności preorder.
Przykład:
Wejście:

19 3
1 2
1 3
1 4
2 5
3 6
4 7
5 8
5 9
5 10
6 18
6 19
7 17
18 14
18 15
18 16
19 11
19 12
19 13

Wyjście:

1 5 6

## Zielony wygrywa

Janusz nie sądził, że współczesna młodzieżowa rozrywka zainteresuje go na tyle, by miał spędzić przy niej godziny. A jednak, gdy Piotr pokazał mu swoją nową interaktywną grę planszową „Zielony wygrywa” z zielono-czerwonym pionkiem w odstawkę poszło polerowanie samochodu, sąsiedzkie intrygi i polskie seriale. Na planszy gry widoczne są pola połączone jednokierunkowymi drogami. W każdym ruchu gracz może przesunąć swojego pionka o jedno pole. Pionek może kilkakrotnie przejść przez dane pole. Po każdym ruchu pionek zmienia kolor z zielonego na czerwony lub z czerwonego na zielony. Na początku gry pionek ustawiany jest w losowym miejscu i przybiera kolor zielony. Gra kończy się, gdy poruszenie pionka nie jest możliwe (nie ma żadnej drogi wychodzącej z pola, na którym jest pionek). Gracz wygrywa jeśli na końcu gry pionek ma kolor zielony.

Każda partia gry jest unikalna, bo plansza za każdym razem generuje się na nowo. Tak jest, nadchodzą czasy elektronicznych planszówek!

Na podstawie opisu planszy i wybranego pola startowego spróbuj ocenić, czy Janusz może wygrać daną partię. Możliwe jest, że startując z wybranego pola nie da się wygrać partii, ale można nie dopuścić do przegranej poprzez zapętlenie się na drodze. Taką sytuację nazywamy remisem.
Wejście:

Na wejściu program otrzymuje liczbę naturalną t, oznaczającą liczbę partii, jakie Janusz danego dnia rozegra. Następnie podanych jest t zestawów danych. Każdy zestaw składa się z trzech liczb naturalnych n, m oraz s oznaczających liczbę pól, liczbę dróg pomiędzy polami i numer pola, z którego rozpoczyna się gra.
W kolejnych m liniach występują pary liczb naturalnych x i y – które informują, że pionek z pola nr x można przesunąć na pole nr y. Należy przyjąć, że nie pojawią się wielokrotnie te same połączenia ani pętle (czyli połączenia które zaczynają się i kończą w tym samym polu).
Pola numerowane są od 0.
1 ≤ t ≤ 10
1 ≤ n ≤ 100000
0 ≤ m ≤ 2*n
0 ≤ x,y < n
Wyjście:

Na wyjściu dla każdego testu program ma wypisać informację NIE, jeżeli nie ma możliwości, by Janusz wygrał partię, REMIS, jeżeli nie da się wygrać partii, ale można doprowadzić do remisu lub TAK, jeżeli Janusz może wygrać grę. W przypadku wygranej należy w drugiej linii wyjścia dla danego testu wypisać numery pól, na które kolejno należy przesunąć pionek. Należy podać najkrótsze rozwiązanie. W przypadku ścieżek równej długości należy wybrać pierwszą leksykograficznie.
Przykład:
Wejście:

3
6 7 3
0 1
1 5
2 0
2 1
3 2
3 4
4 0
4 3 0
0 1
1 2
2 3
2 2 0
0 1
1 0

Wyjście:

TAK
3 2 0 1 5
NIE
REMIS

## Zdrada 

- Janusz, co cię trapi? - spytała zaniepokojona żona Grażyna. Jej małżonek najwyraźniej zmagał się z czymś trudnym.
- Zdrada, Grażyna. Tyle ci powiem. Nasz pierworodny schował przede mną "Zielony wygrywa" w swoim sejfie i ustawił bardzo skomplikowany kod.
- Czy to ma coś wspólnego z tym, że zgubiłeś już dwa pionki z zestawu?
- Et tu Brute? - spytał żałośnie Janusz. - Pioter powiedział, że jeśli złamię szyfr z pomocą jego wskazówek, to mogę z powrotem zabrać grę.
- A jakie to wskazówki?
- Wypisał mi wszystkie możliwe trójki następujących po sobie liczb z szyfru. Powiedział, że być może na tej podstawie uda mi się odtworzyć cały kod. Dla n-liczbowego kodu mam n-2 takich trójek. Ale nie mam zielonego pojęcia jak je poukładać.
- Oj, Janusz... Mówi Ci coś nazwisko Euler? - spytała z lekkim politowaniem Grażyna.
- 
Wejście
Na wejściu znajduje się liczba naturalna t oznaczającą liczbę testów. Dla każdego testu program otrzymuje liczbę naturalną n, która oznacza długość kodu. W kolejnych n-2 liniach program dostaje po 3 liczby naturalne x, y, z.
1≤t≤10
3≤n≤1000000
0≤x,y,z<1000

Wyjście
Na wyjściu program ma wypisać kod, który można odtworzyć z tak podanych trójek lub "NIE", jeśli nie da się odtworzyć kodu. Należy podać odpowiedź pierwszą leksykograficznie.

Przykład
Wejście

3
8
5 2 3
5 7 8
2 3 5
3 5 2
3 5 7
1 3 5
4
3 5 2
2 3 7
4
1 2 1
2 1 2

Wyjście

1 3 5 2 3 5 7 8
NIE
1 2 1 2

## Choinka binarna

Życie Janusza i jego rodziny było ściśle związane z trybem pracy hipermarketów. Oznacza to, że ostatni weekend obfitował w mnogość zakupów. Święta tuż tuż, więc Janusz postanowił zakupić nową choinkę i lampki. W promocji akurat były choinki binarne. Ciocia Jadzia miała podobną i bardzo ją sobie chwaliła.

Choinka binarna to rodzaj choinki, którą można sobie złożyć według własnego uznania. Składają się na nią różnej długości gałęzie i złącza. Do każdego złącza od dołu można podpiąć dwie gałęzie - jedną na lewo, drugą na prawo - oraz jedną gałąź od góry. Najwyższe złącze nie ma gałęzi wchodzącej od góry.

Janusz miał n gałęzi i złożył choinkę w taki sposób, żeby nie zostawiać wolnych miejsc w złączach, dopóki nie skończą mu się gałęzie. Teraz zastanawia się nad sensownym powieszeniem lampki choinkowej o długości k. Początek i koniec sznura lampek da się zaczepić tylko w złączach, a sam sznur można kłaść wzdłuż gałęzi. Pan domu musi teraz policzyć ile ma możliwości powieszenia lampek na swojej choince tak, by wykorzystać całą ich długość (Janusz, by założyć lampki jak najefektywniej nie zawraca sznurem po gałęziach, których już użył).
Wejście

W pierwszej linii wejścia jest liczba naturalna t, oznaczająca liczbę testów.
Każdy test składa się z dwóch liczb naturalnych n oraz k, które oznaczają kolejno liczbę gałęzi oraz długość lampek choinkowych. W kolejnej linii znajduje się n liczb naturalnych oznaczających długości kolejnych gałęzi dopinanych do drzewa. Gałęzie są dopinane od góry warstwami.

1 ≤ t ≤ 10
1 < n ≤ 1000000
1 ≤ k < 1000
Wyjście

Dla każdego testu należy wypisać liczbę naturalną oznaczającą liczbę możliwości powieszenia na choince lampek o długości k.
Przykład
Wejście:

3
6 4
1 1 3 2 1 2
4 2
1 1 1 1
5 8
3 5 2 6 3

Wyjście:

3
4
3

## Telewizory

Janusz jest nadzwyczaj niezdecydowanym człowiekiem jeśli chodzi o wybór kanału w telewizji. Najchętniej oglądałby jednocześnie wszystkie interesujące go programy, niestety w domu nie ma akurat żadnego odbiornika telewizyjnego. Na szczęście naprzeciwko domu otworzyli właśnie wypożyczalnię telewizorów. Janusz uznał, że to idealny moment, by popracować nad tężyzną fizyczną syna i gdy zaczynał się w telewizji program, który chciał oglądać wysyłał Piotra po odbiornik. Jednak nie był w stanie oglądać dwóch programów w tym samym czasie, więc gdy interesujący go program nakładał się na to, co już było emitowane Piotr szedł po kolejny telewizor.

Janusz ma n programów, które chce obejrzeć. Każdy z nich zaczyna się w minucie t1 i kończy w minucie t2 włącznie. Wypożyczalnia pobiera pewną opłatę c zł za wypożyczenie telewizora w pierwszej minucie oraz opłatę d zł za każdą kolejną minutę oglądania na danym odbiorniku (co oznacza, że za obejrzenie programu trwającego od t1 do t2 wypożyczalnia liczy sobie c+d*(t2-t1) zł). Janusz po włączeniu telewizora nie mógł go wyłączyć dopóki odbiornik nie został oddany.

Wiemy również, że Janusz nie lubi przepłacać, dlatego musi obliczyć minimalny koszt, jakim będzie w stanie obejrzeć wszystkie zaplanowane programy.
Wejście

Na wejściu program otrzymuje liczbę t, która jest liczbą zestawów danych.
Następnie podanych jest t zestawów danych. Każdy zestaw składa się z trzech liczb naturalnych n, c oraz d, które oznaczają odpowiednio liczbę programów, które chce zobaczyć Janusz, opłatę za pierwszą minutę wypożyczenia telewizora i opłatę za każdą dodatkową. W kolejnych n liniach są pary liczb naturalnych t1 i t2, które informują o czasie rozpoczęcia i zakończenia każdego z programów.

1 ≤ t ≤ 10
1 ≤ n ≤ 100000
0 ≤ d < c ≤ 1000
t1 ≤ t2
Wyjście

Na wyjściu dla każdego testu należy podać minimalny koszt obejrzenia wszystkich programów.
Przykład
Wejście:

3
5 3 2
0 1
9 10
4 8
1 3
3 9
3 4 2
0 0
1 1
2 2
2 2 1
1 1
10 10

Wyjście:

41
8
4

## Szlachetny uczynek

 Janusz postanowił spełnić jakiś dobry uczynek. Dołączył więc do ekipy Szlachetnej Paczki, by rozwozić przesyłki potrzebującym rodzinom. Zanim jednak nasz bohater wyjechał w trasę musiał skompletować k paczek przemierzając magazyn, którego rozkład był niewytłumaczalnie skomplikowany. W magazynie znajdowało się n punktów odbioru. Do magazynu wjeżdżało się pojazdem dostawczym w punkcie startowym o numerze 0 i wyjeżdżało w pewnym punkcie końcowym o numerze s (które również były punktami odbioru). Punkty wydawały paczki w sposób nieprzerwany, ale z każdego punktu można było pobrać dokładnie jedną paczkę podczas jednego podjazdu samochodu (za wyjątkiem punktu 0, który przy pierwszym podjeździe nie wydawał paczek). Pomiędzy punktami można było się przemieszczać tylko wytyczonymi jednokierunkowymi trasami. Janusz mając przed sobą mapę magazynu z zaznaczonymi punktami i trasami pomiędzy nimi musi się zastanowić ile ma możliwości objazdu punktów, by zebrać dokładnie k paczek. Zakładamy, że jeśli Janusz dotrze do któregoś z punktów odbioru, to musi pobrać dokładnie jedną paczkę.
Wejście

Na wejściu program otrzymuje liczbę naturalną t, oznaczającą liczbę zestawów danych. Następnie podanych jest t zestawów danych. Każdy zestaw składa się z czterech liczb naturalnych n, m, s oraz k oznaczających liczbę punktów odbioru, liczbę przejazdów pomiędzy punktami, numer punktu końcowego oraz liczbę paczek.
W kolejnych m liniach występują pary liczb naturalnych x i y, które informują o połączeniu z punktu x do punktu y. Należy przyjąć, że nie ma wielokrotnych połączeń.
1 ≤ t ≤ 10
1 ≤ k < 1000
1 ≤ n ≤ 10000
0 ≤ x,y < n
Wyjście

Na wyjściu dla każdego testu należy wypisać liczbę naturalną oznaczającą liczbę potencjalnych dróg.
Przykład
Wejście:

1
4 5 3 2
0 1
0 2
0 3
1 3
2 3

Wyjście:

2

## Co na obiad?



Janusz od zawsze był wielkim koneserem polskiej kuchni. Drugie danie w jego domu składało się obowiązkowo z ziemniaków, kotleta i jakiegoś rodzaju szeroko pojętej surówki. Pan domu jednak z przykrością zauważył, że dieta taka kiepsko wpływa na jego wytrenowany mięsień piwny przekształcając go efektywnie w słoniową ciążę spożywczą. Postanowił więc zrobić listę n najczęściej jedzonych produktów wraz z ich kalorycznością i zastanowić się które z nich powinien ze sobą zestawić, by w porze obiadu zjeść dokładnie k kalorii (zakładamy, że dany produkt może być wykorzystany podczas obiadu co najwyżej raz).

Janusz swoje przemyślenia przekazał żonie, ale to jak Grażyna zareagowała na instruowanie jej jak ma gotować przemilczymy.
Wejście

Na wejściu program otrzymuje liczbę naturalną t, oznaczającą liczbę testów. Następnie podanych jest t zestawów danych. Na jeden zestaw danych składa się liczba naturalna n, która oznacza liczbę produktów. Następnie podanych jest n liczb naturalnych dodatnich, które informują o liczbie kalorii kolejnych produktów. W ostatniej linii testu podana jest liczba naturalna dodatnia k - liczba kalorii, którą pragnie spożyć Janusz.
1 ≤ t ≤ 10
1 ≤ n ≤ 1000
Wyjście

Na wyjściu należy dla każdego testu wypisać liczbę naturalną informującą na ile sposobów można użyć produktów z listy.
Przykład
Wejście:

2
6 80 40 40 120 160 80 
160 
3 100 110 120 
130

Wyjście:

6
0

## Kryzysowa sytuacja

Janusz jest powszechnie znany ze swojego zaangażowania w działalność charytatywną. Trafił do sztabu organizującego wysyłkę zapasów wody źródlanej do odległego kraju dotkniętego suszą. Firma produkująca wodę dostarczyła do sztabu partię która jest nieco wybrakowana. W niektórych skrzynkach brakuje butelek lub nie są napełnione w całości. Operacja musi zostać przeprowadzona jak najszybciej ponieważ sytuacja jest kryzysowa. Nie ma czasu na przepakowywanie pojedynczych butelek. Trzeba wybrać te skrzynki w których jest w sumie jak najwięcej wody. Ważnym limitem jest pojemność ładowni samolotu, który może zabrać tylko określoną ilość skrzynek. Operacja jest zagrożona ponieważ ręczne sortowanie zajmuje zbyt dużo czasu. Na szczęście firma która dostarczyła wodę przekazała również raport odnośnie stanu napełnienia butelek w każdej ze skrzynek. Janusz postanowił wspomóc się techniką. Przecież wystarczy napisać program który wyznaczy skrzynki które należy wysłać …
Wejście:

W pierwszej linii program otrzymuje liczby naturalne n, m i p oznaczające odpowiednio liczbę dostarczonych skrzynek, ilość butelek w każdej z nich oraz pojemność ładowni samolotu. W kolejnych n liniach program otrzyma m elementowy opis każdej ze skrzynek który może się składać z liczb zmiennoprzecinkowych od 0 do 1 podawanych z precyzją do trzech cyfr po przecinku.
Wyjście:

Na wyjściu program powinien wypisać p skrzynek rozpoczynając od sumarycznie najbardziej zapełnionej. W przypadku dwóch skrzynek których stopień napełnienia jest identyczny decyduje kolejność wprowadzania.

1 ≤ n ≤ 50000

1 ≤ m ≤ 50

1 ≤ p ≤ n
Przykład:
Wejście:

6 5 3
1 0 0.6 0.8 1
1 1 1 1 1
0 0 0 0 0.1
0.5 0.5 0.5 0.5 0
0.8 0.7 0.6 0.5 0.4
0.4 0.5 0.6 0.7 0.8

Wyjście:

1 1 1 1 1
1 0 0.6 0.8 1
0.8 0.7 0.6 0.5 0.4

## Czas to pieniądz

Na osiedlu Janusza w ostatnich dniach został otwarty bardzo specyficzny sklep. Oferuje towary najpopularniejszych marek w bardzo atrakcyjnych cenach. Okazuje się jednak, że obowiązują w nim zasady rodem z minionej epoki. Każdy klient który podchodzi do sklepowej lady może kupić tylko jeden produkt. Oczywiście w kolejce można stawać wiele razy. Co więcej klienci którzy mają bardziej zasobny portfel podchodzą do lady jako pierwsi. Jeżeli nowo przybyły klient ma tyle samo pieniędzy co któryś z już czekających w kolejce to ustawia się tuż za nim. Dzień wcześniej na witrynie sklepowej zawsze jest wywieszana kartka z informacją jaki asortyment będzie dostępny w sklepie. Każdy produkt na liście ma swój unikalny numer oraz cenę. Klienci jednak nie wiedzą ile sztuk danego przedmiotu będzie czekało w sklepie. Oznacza to, że klient może stać w kolejce bardzo długo i ostatecznie kiedy nadejdzie jego kolej to może okazać się, że danego produktu nie ma już na stanie sklepu. Hasłem przewodnim klientów jest „nie ważne czy potrzebne ważne, że w promocji”. Dlatego każdy klient ma listę zakupów z której próbuje kupić najbardziej pożądane towary. Wiadomo, nawet jeżeli nie ma tej jednej upragnionej rzeczy to szkoda by było stracić poświęcony czas. Pozostaje tylko liczyć, że uda się kupić cokolwiek z posiadanej listy. Ponieważ Janusz na całym osiedlu uważany jest za prawdziwego męża stanu, sfrustrowani sytuacją klienci sklepu zwrócili się do niego z prośbą żeby zaradził coś na wielogodzinne kolejki. Po chwili zastanowienia przyszła mu do głowy genialna myśl. A gdyby tak napisać algorytm który zasymuluje działanie kolejki?
Wejście:

Na wejściu program otrzymuje liczby naturalne n oraz m oznaczające kolejno liczbę produktów w sklepie oraz liczbę klientów w kolejce. W kolejnych n liniach program otrzymuje opis produktów w sklepie składający się z dwóch liczb naturalnych l będącą opisem ilości danego towaru w magazynie oraz c będącą ceną produktu. Produkty numerowane są od 0. W kolejnych m liniach program otrzymuje opis każdego z klientów w kolejności w której przychodzą do kolejki, gdzie w pierwszej linii podane są dwie liczby naturalne p oraz k. Pierwsza wartość to początkowa zasobność portfela klienta a druga to ilość przedmiotów na liście zakupowej. W kolejnej linii program otrzymuje k numerów produktów które klient chce kupić zaczynając od najbardziej pożądanego.
Wyjście:

Na wyjściu program powinien wypisać produkty które kupił dany klient w takiej samej kolejności w jakiej trafiali do kolejki na początku działania programu. Jeżeli klientowi nie udało się kupić niczego wyświetlany jest znak ‘-’.

1 ≤ n ≤ 50000

1 ≤ m ≤ 25000

1 ≤ k ≤ 200
Przykład:
Wejście:

5 4
2 2
1 3
3 3
6 6
2 3
15 3
1 0 3
20 2
1 4
10 2
3 4
8 2
1 1

Wyjście:

0 3
1 4
3 4
-

## Gra o wysoką stawkę 



Przechadzając się po parku Janusz spotkał mędrca który poprosił go o drobne (na jedzenie oczywiście). Ponieważ szła z nim również córka Andżela głupio było nic nie dać. Wiadomo, Janusz biedny ale gest ma. Wrzucił zatem kilka drobniaków jednak gdy miał już odejść mędrzec złapał go za rękę, podziękował i wręczył mu starą książkę dodając tylko „oto klucz do sekretu osiedla”. Janusza przeszył dreszcz, jednak nie mówiąc nic więcej wrócił do domu. Ponieważ mieszka tutaj nie od dziś wiedział o jaki sekret chodzi. Od zarania dziejów krążyła legenda o wielkim skarbie który gdzieś na terenie osiedla w pradawnych czasach ukrył niejaki prasebiks. Nikt jednak do tej pory go nie odnalazł. Janusz nie rozumiał jak zwykła książka ma mu pomóc w odnalezieniu skarbu. Zaczął wertować opasły tom aż na ostatniej stronie znalazł napisane odręcznie zdanie „alfabet kluczem twym” oraz dziwny ciąg cyfr. Studiując wiele nocy cyfry wpadł na niesamowite odkrycie. Wystarczy wszystkie wyrazy ustawić alfabetycznie i wybrać te wskazywane przez liczby na końcu książki. Coś jedna wciąż nie dawało mu spokoju. Zdanie które uzyskiwał nie miało sensu. Zauważył, że na okładce znajduje się jeszcze jedna wskazówka. Ukryta w rogu mała dodatkowa cyfra. Może wystarczyło odrzucić słowa dłuższe niż ta liczba, pomyślał drapiąc się po głowie. Chyba warto spróbować, przecież fortuna już na niego czeka …
Wejście:

W pierwszej linii program otrzymuje liczbę naturalną n oznaczającą liczbę wersów w książce. Następnie w n liniach podane są kolejne wersy książki. Ostatnia linia wejścia rozpoczyna się od dwóch liczb naturalnych s i m, gdzie pierwsza z nich oznacza maksymalną długość słowa w tekście wynikowym a m liczbę słów które będą wyszukiwane w książce. Następnie podanych jest m liczb naturalnych oznaczających numer wyrazu wybierany w kolejności alfabetycznej. Wyrazy w książce są numerowane od 0. Wielkość liter nie ma znaczenia. Znaki interpunkcyjne nie liczą się jako słowa ani nie są jego częścią.
Wyjście:

Na wyjściu program powinien wypisać wybrane słowa spełniające warunek w kolejności poszukiwania. Wszystkie wielkie litery w słowach składających się na tekst wynikowy powinny zostać zamienione na małe.

1 ≤ n ≤ 25000
Przykład:
Wejście:

3
Halina krzatajac sie po kuchni zbila talerz. Zastawa
w szafce stala sie niekompletna. Janusz ponownie
wpadł w furie.
6 5 13 4 14 5 11

Wyjście:

w kuchni w szafce

UWAGA! Program powinien zawierać samodzielną implementację algorytmu ,,magiczne piątki''.

## Dusza Janusza

 Któż duszy Janusza prywatność narusza
Gdy nowa promocja we Biedronce rusza
Bo znam ci ja takich jak ta menda Nowak
Na naszym kablu pluskwa podsłuchowa

Ty Pioter posłuchaj, nie jesteśmy w lesie
Bo ty żeś studiował na UMCSie
I RSA zapniesz za moim przewodem
Nie będziem się dzielić promocją ze wrzodem

I spoczęła dusza Janusza przed meczem
Lecz to nasz problem najwyżej odwlecze
I dusza Janusza wielce się frasuje
I Pioter dla tate dziś sieć przekopuje
Z nadzieją że nie ma w chińskich alfabetach
Symbolu by pojąć Riemann'owe dzeta
Wejście

Na wejściu program otrzymuje liczbę naturalną t, oznaczającą liczbę zapytań do programu deszyfrującego. W kolejnych t liniach znajduje się t dużych liczb naturalnych x, które Janusz musi odszyfrować.
Należy wykorzystać wbudowaną funkcję string n() oraz string d(), by poznać pierwszą część klucza publicznego i klucz prywatny. Klucze również są dużymi liczbami i podane są w formie napisu.
1 ≤ t ≤ 10
1 ≤ x ≤ 5^1000
Wyjście

Na wyjściu należy dla każdego zapytania wyświetlić odszyfrowaną daną.
Przykład *)
Wejście:

2
113
1337

Wyjście:

126
106

Uwaga! Należy samodzielnie zaimplementować obsługę dużych liczb.

*) Funkcje w pierwszym przykładzie zdefiniowane są jako:

string n() { return "143"; }
string d() { return "103"; }

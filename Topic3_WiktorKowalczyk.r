# install.packages("tidyverse")
library(tidyverse)

# zaleznosc pomiedzy pojemnoscia silnika a spalaniem w miescie
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty))

# zaleznosc pomiedzy pojemnoscia silnika a spalaniem w trasie
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

# Co stanie sie jeseli uzyjemy tylko samej funkcji ggplot(data = mpg)?
# Otrzymamy pusty wykres, na ktory mozemy nastepnie nakldac kolejne warstwy.

#-------------------------------------------------------------------------------------
# Cwiczenia 1.

# 1. Co widzimy po wywolaniu polecenia ggplot(data = mpg)
# Otrzymamy pusty wykres, na ktory mozemy nakladac kolejne warstwy.

# 2. Ile wierszy i kolumn znajduje sie w zbiorze danych mtcars?
dim(mtcars)
# [1] 32 11
# 32 rzedy 
# 11 kolumn

# 3. Czym jest zmienna drv z ramki danych mpg?
?mtcars
# drv to zmienna kategoryczn, oznaczajaca rodzaj napedu samochodu
# f = front-wheel drive, r = rear wheel drive, 4 = 4wd

# 4. Wykonaj wykresy zaleznosci pomiedzy zmiennymi cty i cyl oraz hwy i cyl 
ggplot(data = mpg) + geom_point(mapping = aes(x = cty, y = cyl))
ggplot(data = mpg) + geom_point(mapping = aes(x = hwy, y = cyl))

# 5. Wykonaj wykres punktowy zaleznosci pomiedzy class i drv. Co widzimy?
ggplot(data = mpg) + geom_point(mapping = aes(x = class, y = drv))
# wykres przedstawia dostepnosc napedu samochodu dla roznych typow nadwozia


ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Jakie wnioski mozemy wyciagnac na podstawie przygotowanego wykresu?
# Zastosowanie kolorow umozliwia zaobserwowanie, ze nietypowe punkty to auta typu 2seater.

# Przeskaluj zmienna class na estetyke alpha, rozmiar (size) oraz ksztalt (shape). 
# Co ciekawego widzimy?

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# Warning message:
#   Using alpha for a discrete variable is not advised. 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
# Warning message:
#   Using size for a discrete variable is not advised. 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# Warning messages:
# 1: The shape palette can deal with a maximum of 6 discrete values because more than 6
# becomes difficult to discriminate; you have 7. Consider specifying shapes manually if you
# must have them. 
# 2: Removed 62 rows containing missing values (geom_point). 


# Czy x i y tez sa estetyka Jezeli tak to gdzie jest legenda?
# Tak, legende mozemy utworzyc poprzez dodanie kolejnych warstw. Np. xlab("displ"), ylab("hwy")

# Co stanie sie jezeli umiescimy ktoras z poznanych estetyk poza funkcja aes? 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = class)
# Error in rep(value[[k]], length.out = n) : 
#   attempt to replicate an object of type 'builtin'
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), alpha = class)
# Error in rep(value[[k]], length.out = n) : 
#   attempt to replicate an object of type 'builtin'
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), size = class)
# Error in rep(value[[k]], length.out = n) : 
#   attempt to replicate an object of type 'builtin'
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), shape = class)
# Error in rep(value[[k]], length.out = n) : 
#   attempt to replicate an object of type 'builtin'
# W kazdym przypadku otrzymamy blad

# A co jezeli zamiast nazwy klasy uzyjemy np. nazwy koloru?
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "red")
# Wszystkie punkty beda mialy jeden kolor.


#-------------------------------------------------------------------------------------
# Cwiczenia 2.

# 1.W ktorym miejscu tego kodu znajduje sie blad? Dlaczego punkty nie sa zielone?

ggplot(data = mpg) + geom_point(mapping = aes(x = displ,y=cty, color="green"))
# punkty sa czerwone 

# wlasciwe usytuowanie nawiasu okraglego rozwiazuje problem:
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y=cty), color = "green")

# 2. Ktore zmienne ze zbioru mpg sa kategorialne? Ktore zmienne sa ciagle? 
# (Wskazowka: wpisz ? mpg, aby przeczytac dokumentacje tego zbioru danych).

?mpg
# zmienne kategorialne: manufacturer, model, year, trans, drv, fl, class
# zmienne ciagle: displ, cty, hwy, cyl
# trudno powiedziec: year (rocznik powinnien byc rozumiany jako zmienna ciagla, 
# ale w tym zbiorze danych rocznik przyjmuje dwie wartosci: 1999 oraz 2008)

# 3.Zmapuj zmienna ciagla na estetyke color, size i shape. 
# Na czym polega roznica w zachowaniu tych estetyk w przypadku zmiennych kategorialnych i ciaglych?

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty, color = displ))
# Wykres jest tworzony
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty, size = displ))
# Wykres jest tworzony
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty, shape = displ))
# Error: A continuous variable can not be mapped to shape
# Wykres nie jest tworzony, poniewaz ksztalty nie maja kolejnosci

# 4.Co sie stanie, jesli zmapujesz te sama zmienna na wiele estetyk?
# Mozna przedstawiac te sama zmienna za pomoca wielu estetyk.
# Jezli zastosuje sie te sama estetyke wiele razy, 
# ggplot wezmie pod uwage tylko zmienna zastosowana po raz pierwszy i zwroci ostrzezenie.

# 5. Do czego sluzy estetyka stroke? Z jakimi ksztaltami mozna jej uzywac 
# (Wskazowka: skorzystaj z polecenia ?geom_point).
# Stroke kontroluje szerokosc granic estetyk, ktore je maja np. shape
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty, stroke = displ), shape = 21)

# 6. Co sie stanie, jesli zmapujesz estetyke na cos innego niz nazwa zmiennej, 
# jak na przyklad aes(color = displ < 4)?
# Zostanie wyswielony wykres, ktory jest wynikiem wyrazenia 
ggplot(data = mpg) + geom_point(aes(x = displ, y = cty, colour = displ < 4))


#---------------------------- PANELE ----------------------------#

# panel zaleznosci dla zmiennej kategorialnej
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty)) +
  facet_wrap(~ class, nrow = 3)

# panel zaleznosci miedzy dwoma zmiennymi
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


#-------------------------------------------------------------------------------------
# Cwiczenia 3.

# 1. Co sie stanie jesli podzielimy wykres na panele uzywajac zmiennej ciaglej? 
# Otrzyma sie wykres z jedna kolumne lub rzedem dla kazdej unikatowej zmiennej.

# 2. Co oznaczaja puste komorki na wykresie:

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

# Puste komorki w panelu oznaczaja, ze nie bylo rzedow z ta kombinacja wartosci w wizualizowanej ramce danych.

# Jaka jest zaleznosc wgledem tego wykresu:

ggplot(data = mpg)+ geom_point(mapping = aes(x = drv, y = cyl))

# Wykres jest zestawieniem wystepowania zaleznosci w ramce danych. 
# Kropka oznacz, ze takie samochody istnieja, a jej brak oznacz brak aut o takich parametrach.

# 3. Jakie wykresy powstana po uruchomieniu polecenia ponizej? Do czego sluzy znak "."?

# Znak "." jest symbolem zastepczym, dzieki ktoremu mozliwe jest otrzymanie wykresu z panelem 
# w postaci rzedow lub kolumn.  

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
# drv jest zobrazowane w postaci rzedow

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
# cyl jest zobrazowane w postaci kolumn

# 4. Jakie korzysci daje uzywanie paneli zamiast estetyk?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# Uzywanie paneli zamiast estetyk poprawia czytelnosc wykresu, 
# w przypadku kiedy trudno jest operowac bardzo wieloma unikatowymi kolorami lub ksztaltami.

# 5. Do czego sluc argument nrow ? Ncol ? Jakie inne opcje kontroluja uklad poszczegolnych paneli?

# W facet_wrap, nrow i ncol kontroluja odpowiednio ilosc rzedow i kolumn w panelu.
# W facet_grid, nrow i ncol sa okreslane przez zmienne wziete do utworzenia panelu. 



# Porownajmy 2 wykresy:
# 1. punkty 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) 

# 2. linia gladka dla wszystkich aut
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy)) 

# modyfikacja 2. linia gladka dla typu napedu
ggplot(data = mpg) + geom_smooth(mapping = aes ( x = displ, y = hwy, linetype = drv)) 

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv))+
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))
# 'geom_smooth()' using method = 'loess' and formula 'y ~ x'

# unikanie powtarzania
ggplot(data = mpg, mapping = aes (x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth()

# wykorzystanie roznych estetyk
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv, shape = drv, linetype = drv))+
  geom_point() +
  geom_smooth()

# mapowania mozna tez przeslaniac:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(mapping = aes(color = drv))

# zestaw danych do rysowania
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "suv"), se = FALSE)


#-------------------------------------------------------------------------------------
# Cwiczenia 4.

# 1. Jakiej geometrii uzyjesz, aby narysowac wykres liniowy?    geom_area()
#    Wykres pudelkowy?                                          geom_boxplot()
#    Histogram?                                                 geom_histogram()
#    Wykres warstwowy?                                          geom_area()

# 2. Sprobuj przewidziec dzialanie polecenia ponizej. 
#    nastepnie sprawdz czy miales racje uruchamiajac je.
ggplot(data = mpg, mapping = aes( x = displ, y = hwy, color = drv))+
  geom_point() +
  geom_smooth(se = FALSE)
# Wykres bedzie przedstawial zaleznosc miedzy displ a hwy, na osi X displ, a na osi Y hwy. 
# Na wykresie bedzie widoczny zbior punktow podzielonych kolorystycznie na rodzaj napedu (drv).
# Dla kazdego rodzaju napedu zobaczymy linie dopasowan do punktow bez przedzilu ufnosci.

# 3. Do czego sluzy kod show.legend = FALSE?
# Kod show.legend pozwala okreslic, czy dana geometria zostanie uzyta w legendzie. 
# To argument, ktory przyjmuje wartosci TRUE (uwzgledniaj) albo FALSE (nie uwzgledniaj).

# 4. Do czego sluzy argument se w funkcji geom_smooth()?
# Argument se pozwala okreslic, czy zostanie wyswitlony przedzial ufnosci do dopasowanej linii.

# 5.Czy te dwa wykresy sa inne? Dlaczego?
ggplot(data = mpg , mapping = aes( x = displ, y = hwy))+
  geom_point() +
  geom_smooth()

# Podany kod pozwala wygenerowac tylko jeden wykres

# 6. Odtworz kod R potrzebny do wygenerowania nastepujacych wykresow:

# Wykres numer 1:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + 
  geom_smooth(se = FALSE)

# Wykres numer 2:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group=drv)) +
  geom_point() + 
  geom_smooth(se = FALSE)

# Wykres numer 3:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(color = drv) + 
  geom_smooth(se = FALSE)

# Wykres numer 4:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(se = FALSE)

# Wykres numer 5:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) 

# Wykres numer 6:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping  = aes(fill = drv), shape = 21, stroke = 1.5, colour = "white", size = 2)


ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )


#-------------------------------------------------------------------------------------
# Cwiczenia 5.

# 1. Ktora domyslna funkcja geometryczna jest zwiazana z funkcja stat_summary()? 

#    stat_summary jest zwiazana z funkcja geom_pointrange

#    Jak mozna przepisac wczesniejszy wykres, aby skorzystac z funkcji geometrycznej 
#    zamiast z przeksztalcenia statystycznego?

ggplot(diamonds) +
  geom_pointrange(aes(cut, depth, ymin = depth, ymax = depth))

# 2. Do czego sluzy funkcja geom_col()? Czym rozni sie od funkcji geom_bar()?

#    Funkcja geom_bar() tworzy dwie zmienne: count i prop, 
#    aby nastepnie przedstawia wynik count on osi Y. 
#    Funkcja geom_col nie zmienia danych i dzieki niej 
#    dowolnej zmiennej ze zbioru X mozna przyporzadkowac odpowiadajaca zmienna ze zbioru Y.
     
# 3. Wiekszosc funkcji geometrycznych i przeksztalcen statystycznych tworzy pary, 
#    ktore niemal zawsze sa uzywane wspolnie. 
#    Przeczytaj dokumentacje i wykonaj liste tych par. Co maja ze soba wspolnego?

# The following tables contain the geoms and stats in https://ggplot2.tidyverse.org/reference/.

# The following tables lists the pairs of geoms and stats that are almost always used in concert.
  # | geom                | stat                |
  # |---------------------|---------------------|
  # | 'geom_bar()'        | 'stat_count()'      |
  # | 'geom_bin2d()'      | 'stat_bin_2d()'     |
  # | 'geom_boxplot()'    | 'stat_boxplot()'    |
  # | 'geom_contour()'    | 'stat_contour()'    |
  # | 'geom_count()'      | 'stat_sum()'        |
  # | 'geom_density()'    | 'stat_density()'    |
  # | 'geom_density_2d()' | 'stat_density_2d()' |
  # | 'geom_hex()'        | 'stat_hex()'        |
  # | 'geom_freqpoly()'   | 'stat_bin()'        |
  # | 'geom_histogram()'  | 'stat_bin()'        |
  # | 'geom_qq_line()'    | 'stat_qq_line()'    |
  # | 'geom_qq()'         | 'stat_qq()'         |
  # | 'geom_quantile()'   | 'stat_quantile()'   |
  # | 'geom_smooth()'     | 'stat_smooth()'     |
  # | 'geom_violin()'     | 'stat_violin()'     |
  # | 'geom_sf()'         | 'stat_sf()'         |

# 4. Jakie zmienne oblicza funkcja stat_smooth()? Jakie parametry steruja jej zachowaniem?

#    Funkcja stat_smooth() oblicza nastepujace zmienne:
#    A) 'y': przewidywana wartosc na podstawie zmiennej x
#    B) 'ymin': najnizsza wartosc przedzialu ufnosci
#    C) 'ymax': najwyzsza wartosc przedzialu ufnosci
#    D) 'se': blad standardowy

# stat_smooth(mapping = NULL, data = NULL, geom = "smooth",
#             position = "identity", ..., method = "auto", formula = y ~ x,
#             se = TRUE, n = 80, span = 0.75, fullrange = FALSE,
#             level = 0.95, method.args = list(), na.rm = FALSE,
#             show.legend = NA, inherit.aes = TRUE)

# Parametry kontrolujace zachowanie stat_smooth to:
#   A) 'method': character vector, e.g. "auto", "lm", "glm", "gam", "loess" 
#                or a function, e.g. MASS::rlm or mgcv::gam, base::lm, or base::loess.
#   B) 'formula' uzyta do obliczenia przedzialu ufnosci
#   C) 'na.rm'okresla co zrobic z brakujacymi wartosciami

# 5. Na naszym wykresie slupkowym proporcji musielismy skorzystac z zapisu group = 1.
#    Dlaczego? Innymi slowy, na czym polega problem z ponizszymi wykresami?

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop..))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

#    ..prop.. ustala proporcje dla grup w zbiorze danych. 
#   Jesli ...prop... nie jest wyszczegolniona to chcemy, aby dane byly rozumiane jako jedna grupa.
#   Problem z powyzszymi wykresami polega na tym, ze proporcje sa obliczane w obrebie grupy.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

# uzycie estetyki fill wymaga znormalizowania zliczec dla danego ciecia 
# wzgledem wszystkich rodzajow diamentow 
# => umozliwi to utworzenie slupka o wysokosci proporcjonalnej do ilosci diamentow

ggplot(data = diamonds) + 
  geom_bar(aes(x = cut, y = ..count.. / sum(..count..), fill = color))



#-------------------------------------------------------------------------------------
# Cwiczenia 6.

# 1.Na czym polega problem z tym wykresem? Jak mozna go poprawic?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy )) + geom_point()

# Problem z powyzszym wykresem punktowym polega na nakladaniu sie na siebie punktow 
# o identycznych wartosciach spalanie w miescie i w trasie cty i hwy.
# Wykres mozna poprawic poprzez zastosowanie argumentu position = "jitter" w funkcji geom_points()
# dzieki czemu uzyskamy informacje ile samochodow mialo takie wartosci

ggplot(data = mpg, mapping = aes(x = cty, y = hwy )) + geom_point(position = "jitter")

# 2.Jakie parametry funkcji geom_jitter() steruja poziomem fluktuacji? 

# Nastepujace parametry funkcji geom_jitter() kontroluja poziom fluktuacji:
# A) 'width' kontroluje stopien pionowego przesuniecia
# B) 'height' kontroluje stopien poziomego przesuniecia

# 3.Porownaj ze soba funkcje geom_jitter() i geom_count().

# geom_jitter() sprawia, ze punkty o takich samych wspolrzednych na wykresie nie pokrywaja sie.
# Cel ten jest osiagniety poprzez dodanie wariacji do polozania punktow 
# Nalezy pamietac, ze punkty nieznacznie zmieniaja swoje wspolrzedne.

# geom_count() sprawia, ze punkty o takich samych wspolrzednych na wykresie nie pokrywaja sie 
# Cel ten jest osiagniety poprzez zmiane rozmiaru punktow. 
# Wielkosc uzalezniona jest od ilosci punktow.

# 4.Jakie jest domyslne dopasowanie polozenia dla geom_boxplot()? 
#   Utworz odpowiednie wizualizacje zestawu danych mpg.

# Domyslne polozenie dla geom_boxplot() to dodge2.

ggplot(data = mpg, aes(x = drv, y = hwy, colour = class)) +
  geom_boxplot(position = "dodge2")

ggplot(data = mpg, aes(x = drv, y = hwy, colour = class)) +
  geom_boxplot(position = "identity")



#-------------------------------------------------------------------------------------
# Cwiczenia 7.

# 1. Przeksztalc skumulowany wykres slupkowy w wykres kolowy za pomoca funkcji coord_polar().

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar()

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") # theta = okresla ilosc obserwacji


# 2. Do czego sluzy funkcja labs()? Przeczytaj dokumentacje.

# Funkcja labs() umozliwia dodanie tytulu wykresu, opis osi wspolrzednych, itp.

# 3. Patrzac na ponizszy wykres, czego mozesz sie dowiedziec o zaleznosci miedzy miastem (cty) a
#    wydajnosci zuzycia paliwa na autostradzie (hwy)? Dlaczego wazne jest
#    wywolanie coord_fixed()? Do czego sluzy funkcja geom_abline()?

# Funkcja coord_fixed() zapewnia, ze linia utworzona przez geom_abline() jest nachylona 
# pod katem 45 stopni. 
# Umozliwia to porownanie zuzycia paliwa przy spalaniu w miesci i na autostradzie.

# 4. Opisz, krotko wykres pudelkowy.

?geom_boxplot

# Wykres pudelkowy umozliwia kompaktowe przedstawieni rozkladu zmiennej ciaglej 
# poprzez zwizualizowanie 5 roznych informacji statystycznych:
# mediany, 25% i 75% kwantylu, najnizszej i najwyzszej wartosci.
# Wykres wizualizuje rowniez wszystkie wartosci odstajace.

# 5. Pobierz historyczne dzienne dane wybranej spolki gieldowej ze strony: https://stooq.pl/
#    ( plik csv) a nastepnie wyswietl wykres pudelkowy 
#    ( os OX - rok, os OY - cena akcji na zamknieciu) tak jak w przykladzie ponizej
#1. Napisz funkcję sprawdzająca czy 1 liczba jest podzielna przez druga użyj - %%

podzial <- function(liczba1, liczba2) {
  if (liczba1 %% liczba2 == 0) {
    print("Pierwsza liczba jest podzielna przez druga")}
  else {
    print("Pierwsza liczba jest niepodzielna przez druga")}
}

podzial(10, 2)
podzial(13, 7)
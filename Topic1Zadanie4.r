#4. Napisz funkcje, ktora pobiera sciezkeKatalogu, nazweKolumny, jakaFunkcje, DlaIluPlikow i liczy: 
#   mean, median, min, max w zalesnozci od podanej nazwy funkcji w argumencie, 
#   z katologu, ktory podalismy i z tylu plikow ilu podalismy dla wybranej nazwy kolumny. 
  
# UWAGA: w podanych plikach R pobierajac komorki nazwane liczbami R wstawi przed nazwy X. 
# Funkcje przetestuj dla katalogu smogKrakow.zip. 
# Wykonujac obliczenia pomin brakujace wartosci.

liczZplikow <- function(sciezkeKatalogu = "~/Desktop/Big Data/R cwiczenia/SmogKrk",
                        nazwaKolumny = "3_pm10", 
                        jakaFunkcja = mean, 
                        DlaIluPlikow = 1) {
  pliki <- c(list.files(sciezkeKatalogu))
  for (plik in c(1:DlaIluPlikow)){
    dane <- data.frame(read.csv(paste(sciezkeKatalogu, pliki[plik], sep='/'), 
                                header = TRUE, 
                                check.names = FALSE, 
                                sep = ',', 
                                na.strings = c("")))
    kolumna <- na.omit(c(as.numeric(unlist(dane[[paste("X", nazwaKolumny, sep = "")]]))))
    wynik <- jakaFunkcja(kolumna)
    cat(wynik, "\n")
  }
}


liczZplikow(sciezkeKatalogu = "~/Desktop/Big Data/R cwiczenia/SmogKrk", 
            nazwaKolumny = '3_pm10', 
            jakaFunkcja = median, 
            DlaIluPlikow = 12)
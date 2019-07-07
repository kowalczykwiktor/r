#2. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona dla 2 wektorów o tej samej długości. 
#Wczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. W komentarzu napisz co oznacza wynik.

wsp_korelacji_Pearsona <- function(wektor1, wektor2) {
  wsp <- cov(wektor1, wektor2, method = "pearson")/(sd(wektor1)*sd(wektor2))
  cat("Wspo??czynnik korelacji Pearsona wynosi: ", wsp)
}

# alternatywa na podstawie wzoru

wsp_korelacji_Pearsona <- function(wektor1, wektor2) {
  sr_wektor1 <- mean(wektor1)
  sr_wektor2 <- mean(wektor2)
  wsp = sum((wektor1 - sr_wektor1) * (wektor2 - sr_wektor2))/
    (sqrt(sum((wektor1 - sr_wektor1)**2))*(sqrt(sum((wektor2 - sr_wektor2)**2))))
  cat("Wspolczynnik korelacji Pearsona wynosi: ", wsp)
}

setwd("C:/Users/pd2866/Documents")

dane <- read.csv("dane.csv", header = TRUE, sep = ";")

wsp_korelacji_Pearsona(dane$waga, dane$wzrost)

# Wspolczynnik korelacji Pearsona wynosi:  0.9793459

plot(dane$waga, dane$wzrost)

# Instnie silna pozytywna korelacja miedzy danymi wzrost i waga
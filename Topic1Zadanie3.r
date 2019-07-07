#3. Napisz funkcje zwracajaca ramke danych z danych podanych przez uzytkownika 
# stworzDataFrame <- function(ile=1) W pierwszym wierszu uzytkownik podaje nazwy kolumn. 
# W kolejnych wierszach zawartosc wierszy ramki danych 
# (tyle wierszy ile podalismy w argumencie ile. ile=1 oznacza, ze gdy uzytkownik nie poda zadnej wartosci 
# jako parametr, domyslna wartosci? bedzie 1)

stworzDataFrame <- function(ile = 1) {
  nazwy <- c(unlist(strsplit(readline(prompt = "Podaj nazwy kolumn oddzielone przecinkami "), split = ',')))
  tmp <- c(unlist(strsplit(readline("Podaj elementy wiersza: "), split=',')))
  ramkaDanych <- rbind.data.frame(tmp, stringsAsFactors = FALSE)
  if (ile > 1) {
    for (wiersz in c(2:ile)){
      tmp = c(unlist(strsplit(readline("Podaj elementy kolejnego wiersza: "), split=',')))
      ramkaDanych <- rbind(ramkaDanych, tmp)
    }
    }
  colnames(ramkaDanych) <- nazwy
  ramkaDanych
  }  
  
stworzDataFrame(ile = 3)
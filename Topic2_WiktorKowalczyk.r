
#Zadanie 1
#Utworz funkcje:
#rankAccount <- function(dataFrame,colName,groupName,valueSort,num)
#ktora bedzie zwracala dla danej tabeli(dataFrame) num wierszy posiadajace najwieksze wartosci(sortowanie po kolumnie valueSort)
#dla wybranej grupy(konkretna wartosc komorki , np. "NAUCZYCIEL) z kolumny(colName) np. occupation-zawod.

numer <- c(1:27)
wzrost <- sample(140:200, 27) 
grupa1 <- rep("spawacze", 10)
grupa2 <- rep("nauczyciele", 17)
zawody <- c(grupa1, grupa2)
pozycja <- shuffle(c(grupa1, grupa2))
grupy <- zawody[order(pozycja)]

df <- data.frame(numer, wzrost, grupy)
df
# function
rankAccount <- function(dataFrame, colName, groupName, valueSort, num) {
  sorted <- dataFrame[order(-valueSort), ]
  result <- head(sorted[which(sorted[[colName]] == groupName), ], num)
  result
}
#TEST
(rankAccount(df, "grupy", 'nauczyciele', wzrost, 5))


#Zadanie 2
#Tak jak w #1 tylko z uzyciem #datachunku.

rankAccount <- function(colName, groupName, valueSort, num, chunkSize, plik) {
  con <- file(description = plik, open = "r")   
  porcjaDanych <- read.table(con, nrows = chunkSize, skip = 0, header = TRUE, sep = ",", fill = TRUE)
  nazwyKolumn <- names(porcjaDanych)
  dane = data.frame()
  repeat {
    print(porcjaDanych)
    porcja <- rbind.data.frame(dane, porcjaDanych)
    dane <- porcja[order(-porcja[[valueSort]]),] 
    dane <- head(dane[which(dane[[colName]]==groupName),], num)
    if (nrow(porcjaDanych) != chunkSize) {
      break
    }
    porcjaDanych <- read.table(con, nrows = chunkSize, skip = 0, header = FALSE, sep = ",", fill = TRUE, col.names = nazwyKolumn)
  }
  close(con)
  porcja <- rbind.data.frame(dane, porcjaDanych)
  dane <- porcja[order(-porcja[[valueSort]]),] 
  dane <- head(dane[which(dane[[colName]]==groupName),], num)
}

(rankAccount('Zawod', 'Szewc', 'Wzrost', 5, 5, "./wynik.csv" ))


#Zadanie 3
##SPRAWIDZIC CZY DA SIE ZROBIC TO SAMO W SQLITE dla takich wartosci jak: tabelaZbazyDanych, occupation, nauczyciel, saldo
  
dbCon <- dbConnect(SQLite(), bazaDanych)
zapytanie <- dbBind(dbSendQuery(dbCon, "SELECT * FROM ? where ? = ? sort by ? DESC LIMIT ? "),  
                    list(tabelaZbazyDanych, occupation,  nauczyciel, saldo, num))

wynik <- dbFetch(zapytanie)
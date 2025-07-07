#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 6 – semestr letni 2020/2021
#
# Celem zajęć jest zapoznanie się z możliwościami narzędzia awk.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego wywołania
# programu `awk` z odpowiednimi argumentami.
# 
#

#
# Zadanie 7.
# Przy pomocy narzędzia awk, obliczyć średnią z wyników dla studentów, mając
# do dostęp do uzyskanych przez nich punktów – dane zapisane w pliku CSV.
# Zakładamy, iż w ciagu semestru odbyły się 4 testy (pola od 4 do 7), które
# liczymy z wagą 1, oraz egzamin końcowy, który liczymy z wagą 2. Jako wynik
# proszę zwrócić numer indeksu (3 kolumna, 11 znaków) i obliczoną średnią,
# każda para w nowej linii. Pamiętać o pominięciu nagłówka!
#
# Plik do przetworzenia to `dodatkowe/grades.csv`, zmodyfikowana wersja
# pliku ze strony: https://people.sc.fsu.edu/~jburkardt/data/csv/csv.html
#


# FS ustawiamy separator pól – przecinek + spacja

# gsub to funkcja, która globalnie zamienia (podmienia) tekst w danym polu l
# gsub(wzorzec, zamiennik, zmienna)
#    wzorzec – czego szukamy (np. " " = spacja, "\"" = cudzysłów),
#    zamiennik – na co to zamienić (np. "" = usuń),
#    zmienna – w której zmiennej/polu ma się to dziać (np. $3 albo tekst).

awk 'BEGIN { FS = ", "}
    {  
        if ( NR != 1 ){
            gsub("\"", "", $3);                                         # Usuwamy cudzysłowy z numeru indeksu (pole 3)
            gsub(" ", "", $3);                                          # Usuwamy spacje z numeru indeksu, jeśli jakieś się pojawiły
            AVG = ($4 + $5 + $6 + $7 + 2 * $8) / 6;                     # Obliczamy średnią, Testy 1-4 (pola 4 do 7) mają wagę 1, Egzamin końcowy (pole 8) ma wagę 2
            print $3, AVG;                                              # Wypisujemy numer indeksu i średnią
        }
    }' dodatkowe/grades.csv

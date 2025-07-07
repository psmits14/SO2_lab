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
# programu awk z odpowiednimi argumentami.
# 
#

#
# Zadanie 8.
#
# Plik dodatkowe/lipsum.txt zawiera przykładowy tekst z generatora
# http://lipsum.pl/. Używając programu awk, proszę przygotować narzędzie,
# które rozbije tekst w podanym pliku wejściowym w taki sposób, aby każda
# linia miała mniej niż 80 znaków (przy czym staramy się zmakymalizować
# liczbę znaków w każdej linii jak to możliwe). Jako wynik programu wyświetlić
# tekst po przekształceniu.
#

# split(tekst_do_podziału, tablica_docelowa, separator)
# $0	cały bieżący wiersz (linia z pliku/tekstu)
# tab	nazwa tablicy, do której zapiszesz dane
# " "	separator – tu: spacja

awk 'BEGIN {TO_PRINT = ""}
    {                                                                   # Dla każdej linii w pliku wejściowym:
        split($0, tab, " ");                                            # Rozbijamy bieżącą linię ($0) na tablicę tab, gdzie każdy element to jedno słowo (oddzielone spacją)

        for(key = 1; key < length(tab) + 1; key++){                     # Iterujemy po wszystkich słowach w tej linii
            if(length(TO_PRINT) + length(tab[key]) + 1 < 80){           # Sprawdzamy, czy po dodaniu nowego słowa do linii nie przekroczymy 80 znaków
                if (key == 1){                                          # Jeśli jesteśmy na początku nowej linii (pierwsze słowo), nie dodajemy spacji
                    TO_PRINT = TO_PRINT tab[key];
                }else{
                    TO_PRINT = TO_PRINT " " tab[key];                   # Jeśli nie — dodajemy spację i słowo
                }
            }else{
                print TO_PRINT;                                         # Jeśli długość przekroczyłaby 80, to wypisujemy aktualną linię
                TO_PRINT = tab[key];                                    # I zaczynamy nową linię od bieżącego słowa
            }
        }

        print TO_PRINT;                                                 # Po zakończeniu przetwarzania tej linii — wypisz resztę
    }' dodatkowe/lipsum.txt


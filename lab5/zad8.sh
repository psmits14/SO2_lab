#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 5 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w pracy z mechanizmem łącz
# nienazwanych, wykorzystując przy tym szereg podstawowych narzędzi
# do przetwarzania danych tekstowych.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
#

#
# Zadanie 8.
# W ilu plikach źródłowych pakietu coreutils występuje linia, której jedyną
# zawartością jest #include <stdio.h> (i nic poza tym w ramach tej linii).
# Jako wynik proszę zwrócić tylko i wyłącznie liczbę odpowiednich plików.
# Źródła znajdują się w katalogu coreutils-8.32.
#


# grep -r przeszukuje rekursywnie wszystkie podkatalogi i pliki.
# -l - wypisz tylko nazwy plików, które zawierają dopasowaną linię.
# '^#include <stdio.h>$':
#   - ^     — początek linii
#   - #include <stdio.h> — dokładny tekst
#   - $     — koniec linii

grep -r -l '^#include <stdio.h>$' coreutils-8.32 | wc -l
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
# Zadanie 7.
# Odnaleźć w pliku dodatkowe/ps-aux proces, który zużywa najwięcej czasu
# procesora (trzecia kolumna). Jako wynik zwrócić numer procesu (druga kolumna)
# oraz po spacji pełną nazwę procesu (wszystko od 11 kolumny do końca wiersza).
#

# tail -n+2 - wyświetl wszystkie linie od drugiej (włącznie) do końca pliku (pomijamy nazwy kolumn)
# tr -s ' ' — zamienia wielokrotne spacje na pojedyncze -s squeeze

# cut -d ' ' -f 2,3,11-
# -d ' ' — używa spacji jako separatora kolumn.
# -f 2,3,11- — wybiera:
#      2. kolumnę: PID (numer procesu),
#      3. kolumnę: użycie CPU,
#      od kolumny 11 do końca: pełna nazwa uruchomionego polecenia.

# sort -r -n -k2
#  -k2 sortuje dane według drugiej kolumny (czyli zużycia CPU),
#  -n — sortowanie numeryczne,
#  -r — w odwrotnej kolejności (najpierw największe wartości).

# cut -d ' ' -f 1,3-:
# - wycina PID (1. kolumna),
# - pomija zużycie CPU (2. kolumna),
# - 3- — oznacza: od kolumny 3 do końca (czyli pełna nazwa procesu).

# head -n 1 — wybiera tylko pierwszą linię z posortowanego wyniku,  czyli ten jeden proces, który używa najwięcej CPU.

tail -n+2 dodatkowe/ps-aux | tr -s ' ' | cut -d ' ' -f 2,3,11- | sort -r -n -k2 | cut -d ' ' -f 1,3- | head -n 1;
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
# Zadanie 3.
# Proszę przygotować w narzędziu awk prosty program, który będzie analizował
# składnię pliku CSV i zwróci numery linii, zawierające błędną liczbę pól.
# Zakładamy, że pierwszą linijką w pliku jest nagłówek z nazwami pól i jest
# on zawsze poprawny (czyli wyznacza nam żądaną liczbę pól). Każdy numer
# problematycznej linii zwrócić w osobnym wierszu standardowego wyjścia.
#
# Plik do przetworzenia to `dodatkowe/cities.csv`, zmodyfikowana wersja
# pliku ze strony: https://people.sc.fsu.edu/~jburkardt/data/csv/csv.html
#

# Uruchamiamy program `awk` i ustawiamy separator pól na przecinek
# Dla pierwszej linii pliku (nagłówka) zpamiętujemy liczbę pól jako poprawną fields (NF = Number of Fields)
# Dla pozostałych linii: jeśli liczba pól jest inna niż w nagłówku wypisujemy numer tej linii (NR = Number of Record, czyli nr wiersza)

awk -F "," 'NR == 1 {fields = NF} NF != fields {print NR}' dodatkowe/cities.csv
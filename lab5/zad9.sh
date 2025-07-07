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
# Zadanie 9.
# Określić jaka jest najpopularniejsza nazwa pliku wśród źródeł coreutils,
# czyli jaka nazwa występuje najczęściej. Jako wynik zwrócić tylko samą nazwę.
# Źródła znajdują się w katalogu coreutils-8.32.
#

# Szukamy wszystkich zwykłych plików (-type f) wewnątrz katalogu coreutils-8.32
# find przeszukuje rekursywnie wszystkie podkatalogi, -exec basename {} \; — dla każdego pliku zwraca tylko samą nazwę (bez ścieżki)
# uniq -c liczy, ile razy każda nazwa pliku się powtarza, # Wypluwa coś takiego: 1 Makefile  3 getopt.c  3 getopt.h
# sort -n -r — sortuje wyniki numerycznie i malejąco, najczęściej występujące pliki trafią na górę.
# head -n 1 — bierzemy pierwszy wynik.
# tr -s ' ' — usuwa nadmiarowe spacje (przekształca je w pojedyncze), żeby cut działało ok
# cut -d ' ' -f3 — dzieli linię po spacjach i wybiera trzecie pole, czyli samą nazwę pliku, bo  5 local.mk

find coreutils-8.32 -type f -exec basename {} \; | sort | uniq -c | sort -n  -r | head -n 1 | tr -s ' ' | cut -d ' ' -f3
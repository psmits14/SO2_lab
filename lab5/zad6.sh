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
# Zadanie 6.
# Plik `dodatkowe/ss-tulpn` zawiera wynik przykładowego uruchomienia komendy
# `ss -tulpn` – proszę na jego podstawie określić numery portów, na których
# jakiś proces nasłuchuje na połączenia przychodzące z zewnątrz w sieci IPv4*.
# Wyświetlić same numery portów, każdy w nowej linii.
# (* – chodzi o wpisy, zawierające adres 0.0.0.0 w kolumnie 5).
#

# tr -s ' ' — zamienia wielokrotne spacje na pojedyncze -s squeeze
# cut -d ' ' -f5 dzieli każdą linię na kolumny według pojedynczej spacji jako separatora i wybiera kolumnę nr 5, czyli „adres lokalny”,
# `grep "0.0.0.0"` filtruje tylko te linie, które zawierają `0.0.0.0`
# `cut -d ':' -f2` dzieli dane na części po dwukropku i wybiera drugą część, czyli numer portu — np. z `0.0.0.0:80` zostanie tylko `80`.

cat dodatkowe/ss-tulpn | tr -s ' ' | cut -d ' ' -f5 | grep "0.0.0.0"  | cut -d ':' -f2 | sort -u

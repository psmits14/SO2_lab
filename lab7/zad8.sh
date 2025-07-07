#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 7 – semestr letni 2020/2021
#
# Celem zajęć jest zapoznanie się z wyrażeniami regularnymi, wykorzystując
# przy tym narzędzia awk i grep oraz wszystkie inne, poznane na zajęciach.
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
# Przetworzyć zawartość pliku `dodatkowe/sensors.txt` i wyświetlić całą jego
# zawartość, ale podmieniając w locie zapisane tam wartości temperatur ze skali
# Celsjusza na Fehrenheita: T[°F] = T[°C] * 9/5 + 32.
#


awk '
{
    for (i = 2; i <= NF; i++) {                                                  # Pętla po wszystkich polach od drugiego do ostatniego
        if ($i ~ /[0-9]+\.?[0-9]*°C/) {                                             # Jeśli (~) pole zawiera liczbę (ew. z kropką) zakończoną znakiem °C

            sub(/[0-9]+\.?[0-9]*°C/, sprintf("%.1f°F", ($i * 9 / 5) + 32), $i)          # sub(...) — zamienia pierwsze wystąpienie wzorca w polu $i
                                                                                        # Wyrażenie: [0-9]+\.?[0-9]*°C  — dopasowuje temperatury typu 25°C, 12.5°C, 0.0°C
                                                                                        # sprintf("%.1f°F", ...) — oblicza temperaturę w °F i formatuje do jednego miejsca po przecinku
        }
    }

    print                       # Po przerobieniu linii — wypisz ją
}
' dodatkowe/sensors.txt

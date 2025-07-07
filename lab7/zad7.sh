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
# Zadanie 7.
# Przeanalizować zawartość pliku `dodatkowe/kant.txt` i wyodrębnić z niego
# możliwe dane kontaktowe – obecne tam adresy e-mail oraz numery telefonów.
# Numery telefonów mogą być rozdzielone pomocniczymi separatorami, dodanymi
# dla czytelności, a także być poprzedzone kodami kraju – należy je wtedy
# także wyodrębnić.
#

# Szukamy adresów e-mail
# Wyrażenie regularne:
# [a-zA-Z0-9._%+-]+     — lokalna część adresu (np. imie.nazwisko+info)
# @                     — dosłowny znak małpy
# [a-zA-Z0-9.-]+        — nazwa domeny (np. gmail, pwr.edu)
# \.                    — dosłowna kropka
# [a-zA-Z]{2,}          — końcówka domeny (np. pl, com, org)

grep -oP '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' dodatkowe/kant.txt

# Szukamy numerów telefonów (np. +48 123-456-789 lub 123456789)
# \+?                   — opcjonalny znak plus na początku (np. +48)
# \d                    — cyfra (pierwsza cyfra numeru)
# [\d\-\s]{6,}          — co najmniej 6 znaków: cyfry, myślniki lub spacje
# \d                    — kończy się cyfrą (żeby nie skończyć np. na spacji)
grep -oP '(\+?\d[\d\-\s]{6,}\d)' dodatkowe/kant.txt

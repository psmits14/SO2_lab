#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 4 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w pracy z programem `find`,
# wykorzystując przy tym wiedzę na temat struktury systemu plików itd.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego
# wywołania programu `find` z odpowiednimi argumentami.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#
# Punkt startowy powinien stanowić katalog ze źródłami: linux-5.11.13/
#

#
# Zadanie 10.
# Wyszukać pliki o nazwach `core.c` oraz `irq.c`, które nie są związane
# z architekturą `mips` (wyłączamy katalog o tej nazwie z poszukiwań)
# i mają rozmiar co najwyżej 1kiB – chyba, że są to pliki związane z obsługą
# sieci Bluetooth (znajdują się gdzieś wewnątrz katalogu o nazwie `bluetooth`),
# to interesują nas takie, które mają przynajmniej 30kiB. Jako wynik proszę
# wyświetlić po prostu ścieżki do takich plików.
#

# Szukamy plików core.c lub irq.c...
# ...które NIE znajdują się w katalogu mips i mają rozmiar mniejszy niż 1024 bajty
# LUB znajdują się gdzieś w katalogu bluetooth i mają rozmiar większy niż 30 KiB.

# find linux    pliki o nazwie core.c i irq.c   warunek 1 lub warunek 2
#   Nawiasy \(...\) służą do grupowania warunków
#   iname – dopasowuje nazwę pliku ignorujac wielkie/małe litery 
#   path - sprawdzenie ścieżki, np -path "*/mips/*" dopasowuje ścieżki zawierające folder mips (np. arch/mips/file.c).
#   c oznacza bajty (c jak char = 1 bajt),

find linux-5.11.13 \( -iname "core.c" -or -iname "irq.c" \) \( \( ! -path "*/mips/*" -size -1024c \) -or \( -path "*/bluetooth/*" -size +30720c  \) \)


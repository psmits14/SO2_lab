#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3 – semestr letni 2020/2021
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
#
# Przygotowane rozwiązania nie muszą być całkowicie uniwersalne. Zakładamy,
# że ogólna struktura katalogów się nie zmienia (nie będzie już więcej/mniej
# poziomów podkatalogów), jednakże same nazwy i zawartości plików (o ile
# nie są podane wprost w treści zadań) mogą być dowolne i ulegać zmianie,
# a przygotowane rozwiązania nadal powinny działać.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 1.
# Utworzyć w katalogu `ddd` dowiązanie twarde o nazwie `pierwszy`
# do pliku `podstawa` z katalogu `aaa`. Nie tworzyć dowiązania,
# jeśli jakikolwiek plik o nazwie `pierwszy` już istnieje w `ddd`.
#


[ -e ddd/pierwszy ] || ln aaa/podstawa ddd/pierwszy    # || — jeśli poprzednie polecenie zwróci false wykonae się to po prawej

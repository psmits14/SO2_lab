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
# Zadanie 5.
# Odnaleźć w pliku `dodatkowe/service.py` nazwy zdefiniowanych funkcji i metod.
# Definicja rozpoczyna się od słowa kluczowego `def`, po którym następuje
# co najmniej jedna spacja, a następnie podana jest nazwa, złożona z małych
# liter i znaków podkreślenia. Za nazwą ewentualnie może wystąpić dowolna
# liczba spacji, a później pojawia się nawias otwierający i lista argumentów.
# Zwrócić same unikalne nazwy, bez nawiasów, każdą nazwę w nowej linii.


# Używamy grep z opcją -oP:
# -o — wypisuje tylko dopasowaną część tekstu (nie całe linie)
# -P — używa składni wyrażeń regularnych PCRE (bardziej zaawansowane niż domyślne)
#
# Wyrażenie:
# def[ ]{1,}      — szukamy słowa 'def' i co najmniej jednej spacji
# [a-z|_]*        — dopasowuje ciąg małych liter i/lub podkreśleń
# [ ]*            — opcjonalne spacje po nazwie
# (.*)            — dopasowuje resztę linii (czyli nawiasy i argumenty)

# sed "s/def[ ]*//g" Usuwamy fragment 'def' i spacje po nim – zostaje sama nazwa funkcji z nawiasami

# sed "s/[ ]*(.*$//g" Usuwamy wszystko od pierwszego nawiasu do końca – zostaje tylko sama nazwa funkcji/metody

# s/CO_ZNAJDŹ/CO_WSTAW/ZNAK_FLAGA
# s - substytucja
# g - global próbujemy zastosować zamianę wielokrotnie w jednej linii.

grep -oP 'def[ ]{1,}[a-z|_]*[ ]*(.*)' dodatkowe/service.py | sed "s/def[ ]*//g" | sed "s/[ ]*(.*$//g" | sort -u

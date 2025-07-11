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
# Zadanie 1.
# Z pliku `dodatkowe/lipsum.txt` proszę wyodrębnić słowa, które mogą być
# imionami – to znaczy zaczynają się wielką literą. Każde słowo zwrócić
# w nowej linii, bez powtórzeń, bez żadnych znaków innych niż litery.
#

# grep -o wypisuje tylko fragmenty dopasowane do wyrażenia regularnego
# \b[A-Z][a-z]*\b
#   \b         — granica słowa (żeby dopasować całe słowo, a nie jego część) word boundary
#   [A-Z]      — jedna wielka litera na początku słowa (np. A, B, C...)
#   [a-z]*     — zero lub więcej małych liter (np. nna, dam, lex)
#   \b         — granica końca słowa

grep -o '\b[A-Z][a-z]*\b' dodatkowe/lipsum.txt | sort | uniq

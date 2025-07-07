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
# Zadanie 10.
# Proszę opracować uproszczony konwerter plików z formatu JSON do formatu XML
# i przetworzyć nim plik `dodatkowe/simple.json`. Zakładamy, że wejście stanowi
# zawsze pojedyncza linia, klucze i wartości to proste łańcuchy znaków, złożone
# z liter lub cyfr, pomiędzy cudzysłowami, które są rozdzielone jednym znakiem
# dwukropka i co najmniej jedną spacją, a całe pary klucz-wartość są oddzielone
# od siebie jednym przecinkiem i co najmniej jedną spacją.
#
# Przykład przetworzenia: {"klucz": "wartość"} -> <klucz>wartość</klucz>.
#
# Proszę obsłużyć tworzenie samodomykającego się znacznika (<klucz />), kiedy
# wartość stanowi pusty łańcuch "", a także proszę obsłużyć zagnieżdżenie
# kolejnego zbioru kluczy i wartości.
#


awk '
BEGIN {
    output = ""           # Łańcuch wynikowy z XML-em
    stack_size = 0        # Rozmiar stosu do śledzenia zagnieżdżeń tagów
}

{
    # Przetwarzamy całą linię JSON-a – zakładamy, że jest w jednej linii
    for (i = 1; i <= NF; i++) {
        word = $i                             # Bieżące "słowo" (token oddzielony spacją)
        next_word = (i < NF) ? $(i+1) : ""    # Kolejne słowo (jeśli istnieje)
        rest = word                           # Kopia tokena do analizy

        # Jeśli dopasowano fragment w stylu {"klucz": lub "klucz":
        if (match(rest, /\{?"[^"]+":/)) {
            match_text = substr(rest, RSTART, RLENGTH)       # Wyciągnij dopasowany fragment, restart - zwraca gdzie zaczal sie ten fragment, rlenght- jak byl dlugi
            gsub(/[\{"":]/, "", match_text)                   # Usuń znaki {, ", :, }

            # Jeśli kolejna wartość to "", czyli pusta wartość – wstawiamy znacznik samodomykający
            if (match(next_word, /"",/)) {
                output = output "<" match_text " />"
            }
            else {
                # Jeśli to nie jest pusta wartość, otwieramy znacznik i zapamiętujemy go na stosie
                stack[++stack_size] = match_text
                output = output "<" match_text ">"
            }
        }

        # Jeśli napotkano wartość w stylu "wartość", "x"}, itp.
        else if (match(rest, /"([^"]+)"}?,?/)) {
            match_text = substr(rest, RSTART, RLENGTH)     # Wyciągnij wartość
            gsub(/["},]/, "", match_text)                  # Usuń znaki " , }

            output = output match_text                     # Dodaj tekst wartości do XML

            # Jeśli po wartości pojawia się przecinek lub zamykająca klamra – zamykamy znacznik
            while (match(word, /[,}]/)) {
                if (stack_size > 0) {
                    output = output "</" stack[stack_size] ">"    # Dodaj zamykający tag
                    delete stack[stack_size]                      # Usuń z wirtualnego stosu
                    stack_size--
                }
                sub(/[,}]/, "", word)     # Usuwamy jeden przecinek/zamykającą klamrę, jeśli były wielokrotne
            }
        }
    }
}

END {
    print output      # Wydrukuj cały przekształcony XML
}
' dodatkowe/simple.json
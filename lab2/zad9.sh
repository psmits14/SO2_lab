#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2 – semestr letni 2020/2021
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
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
# Zadanie 9.
# W katalogu `zasoby` w `ddd` utworzyć plik `tajne hasła`, który zawierać
# będzie połączoną treść wszystkich plików z katalogu `ccc` (oraz jego
# podkatalogów) – ale tylko takich, które potrafimy przeczytać. Niech każda
# nowa zawartość będzie poprzedzona jakimś wyróżniającym się nagłówkiem
# z nazwą pliku z którego ona pochodzi. Upewnić się także, że w trakcie
# procesu nie zgłoszą nam się problemy z dostępem do plików (to znaczy,
# że na pewno możemy je przeczytać).
#


#!/bin/bash

# Ścieżki do katalogów i pliku wynikowego
CCC_DIR="ccc"
OUTPUT_DIR="ddd/zasoby"
OUTPUT_FILE="$OUTPUT_DIR/tajne hasła"

# Tworzenie katalogu "zasoby", jeśli nie istnieje
mkdir -p "$OUTPUT_DIR"

# Tworzenie pustego pliku wynikowego
> "$OUTPUT_FILE"

# Przeszukiwanie katalogu "ccc" w poszukiwaniu czytelnych plików
echo "Generowanie pliku tajne hasła..."

# Szukamy wszystkich zwykłych plików w katalogu CCC_DIR, do których mamy prawo odczytu (-readable).
# Dla każdego takiego pliku wykonujemy pętlę while.
# - find "$CCC_DIR" -type f -readable : znajduje tylko czytelne pliki (pomija katalogi i pliki niedostępne).
# - read -r FILE                      : wczytuje każdy plik (linia po linii) do zmiennej FILE, bez interpretowania \ jako znaku specjalnego.
# Dzięki temu możemy wykonać operacje na każdym znalezionym pliku osobno.
find "$CCC_DIR" -type f -readable | while read -r FILE; do
    echo "========== $FILE ==========" >> "$OUTPUT_FILE"
    cat "$FILE" >> "$OUTPUT_FILE"
    echo -e "\n" >> "$OUTPUT_FILE"
done

echo "Plik $OUTPUT_FILE został utworzony."

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
# Zadanie 6.
# Odnaleźć w katalogu `bbb` plik, którego zawartość pokrywa się z zawartością
# pliku `bardzo tajna treść` (jest on w katalogu `ddd`) i skopiować znaleziony
# plik do katalogu `ddd`, jeśli jeszcze go tam nie ma.
#

# Ścieżki do katalogów i pliku referencyjnego
SOURCE_DIR="bbb"
DEST_DIR="ddd"
REFERENCE_FILE="$DEST_DIR/bardzo tajna treść"

# Sprawdzenie, czy plik referencyjny istnieje
if [ ! -f "$REFERENCE_FILE" ]; then
    echo "Plik referencyjny nie istnieje: $REFERENCE_FILE"
    exit 1
fi

# Przeszukiwanie katalogu `bbb` w poszukiwaniu pliku o identycznej treści
# - find "$SOURCE_DIR" -type f           : przeszukuje katalog i zwraca tylko zwykłe pliki (nie foldery).
# - -exec cmp -s "$REFERENCE_FILE" {} \; : dla każdego znalezionego pliku porównuje go z plikiem wzorcowym
#                                         ({} to miejsce, w które wstawiana jest ścieżka pliku).
#                                         cmp -s działa w trybie "silent" — nie wypisuje nic, tylko sprawdza, czy pliki są identyczne.
# - -print                              : jeśli pliki są identyczne, wypisuje ich ścieżkę.
FOUND_FILE=$(find "$SOURCE_DIR" -type f -exec cmp -s "$REFERENCE_FILE" {} \; -print)

# Jeśli znaleziono taki plik, kopiujemy go do `ddd`, jeśli jeszcze tam nie istnieje
if [ -n "$FOUND_FILE" ]; then   #czy zmienna niepusta
    BASENAME=$(basename "$FOUND_FILE")
    DEST_FILE="$DEST_DIR/$BASENAME"
    
    if [ ! -f "$DEST_FILE" ]; then
        cp "$FOUND_FILE" "$DEST_DIR"
        echo "Plik $FOUND_FILE został skopiowany do $DEST_DIR"
    else
        echo "Plik o takiej nazwie już istnieje w $DEST_DIR, nie kopiuję."
    fi
else
    echo "Nie znaleziono pliku o takiej samej zawartości w katalogu $SOURCE_DIR."
fi

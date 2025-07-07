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
# Zadanie 4.
# Utworzyć w katalogu `ddd` plik o nazwie `całość`, który będzie zawierał
# połączoną zawartość wszystkich plików zwykłych z katalogu `aaa`.
# Jeżeli plik `całość` istnieje, to należy nadpisać jego zawartość.
# Kolejność łączenia plików nie ma znaczenia.
#


# Definiujemy katalogi i plik wynikowy
SRC_DIR="aaa"
DEST_DIR="ddd"
OUTPUT_FILE="$DEST_DIR/całość"

# Sprawdzamy, czy katalog źródłowy istnieje
if [ ! -d "$SRC_DIR" ]; then
    echo "Katalog '$SRC_DIR' nie istnieje. Brak plików do połączenia."
    exit 1
fi

# Sprawdzamy, czy katalog docelowy istnieje, jeśli nie – tworzymy go
if [ ! -d "$DEST_DIR" ]; then
    echo "Katalog '$DEST_DIR' nie istnieje. Tworzę katalog."
    mkdir "$DEST_DIR"
fi

# Tworzymy (lub nadpisujemy) plik `całość`
> "$OUTPUT_FILE"  # Czyści plik, jeśli istnieje

# Iterujemy po plikach w `aaa` i łączymy ich zawartość do `całość`
for PLIK in "$SRC_DIR"/*; do
    if [ -f "$PLIK" ]; then  # Sprawdzamy, czy to plik (nie katalog)
        cat "$PLIK" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"  # Dodajemy nową linię między plikami
    fi
done

echo "Połączono wszystkie pliki z '$SRC_DIR' w '$OUTPUT_FILE'."

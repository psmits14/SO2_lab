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
# Zadanie 3.
# Skopiować wszystkie możliwe pliki z katalogu `aaa` do katalogu `ddd`,
# upewniając się, że nie nadpiszemy żadnego istniejącego pliku w `ddd`.
#


# Definiujemy katalogi źródłowy i docelowy
SRC_DIR="aaa"
DEST_DIR="ddd"

# Sprawdzamy, czy katalog źródłowy istnieje
if [ ! -d "$SRC_DIR" ]; then
    echo "Katalog '$SRC_DIR' nie istnieje. Nie ma czego kopiować."
    exit 1
fi

# Sprawdzamy, czy katalog docelowy istnieje, jeśli nie – tworzymy go
if [ ! -d "$DEST_DIR" ]; then
    echo "Katalog '$DEST_DIR' nie istnieje. Tworzę katalog."
    mkdir "$DEST_DIR"
fi

# Kopiowanie plików, ale tylko jeśli nie istnieją już w katalogu docelowym
for PLIK in "$SRC_DIR"/*; do
    if [ -f "$PLIK" ]; then  # Sprawdzamy, czy to plik
        DEST_PLIK="$DEST_DIR/${PLIK##*/}"  # Pobieramy tylko nazwę pliku bez ścieżki, Usuwa wszystko do ostatniego ukośnika /, łącznie z tym ukośnikiem.

        if [ -e "$DEST_PLIK" ]; then
            echo "Plik '$DEST_PLIK' już istnieje. Pomijam."
        else
            echo "Kopiuję '$PLIK' do '$DEST_DIR'."
            cp "$PLIK" "$DEST_DIR/"
        fi
    fi
done

echo "Kopiowanie zakończone."

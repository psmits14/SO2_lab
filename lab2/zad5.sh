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
# Zadanie 5.
# Utworzyć katalog o nazwie `głęboki` wewnątrz katalogu `ddd` i skopiować
# do niego wszystkie pliki zwyczajne (żadnych folderów!) znajdujące się
# w katalogu `bbb` i ewentualnych jego podkatalogach.
# Zakładamy, że katalog `głęboki` mógł już wcześniej istnieć – w takim
# przypadku nie należy tworzyć go na nowo, ale upewnić się, że podczas
# kopiowania nie nadpiszemy żadnych istniejących w nim plików!
#


# Definiujemy katalogi źródłowy i docelowy
SRC_DIR="bbb"
DEST_DIR="ddd/głęboki"

# Sprawdzamy, czy katalog źródłowy `bbb` istnieje
if [ ! -d "$SRC_DIR" ]; then
    echo "Katalog '$SRC_DIR' nie istnieje. Brak plików do skopiowania."
    exit 1
fi

# Tworzymy katalog docelowy `głęboki`, jeśli nie istnieje
if [ ! -d "$DEST_DIR" ]; then
    echo "Katalog '$DEST_DIR' nie istnieje. Tworzę go."
    mkdir -p "$DEST_DIR"
fi

# Znajdujemy wszystkie pliki zwyczajne w `bbb` i jego podkatalogach
find "$SRC_DIR" -type f | while read -r PLIK; do
    NAZWA_PLIKU="${PLIK##*/}"  # Pobieramy samą nazwę pliku bez ścieżki, ##./ Usuwa wszystko do ostatniego ukośnika /, łącznie z tym ukośnikiem.
    DEST_PLIK="$DEST_DIR/$NAZWA_PLIKU"

    # Sprawdzamy, czy plik już istnieje w katalogu docelowym
    if [ -e "$DEST_PLIK" ]; then
        echo "Plik '$NAZWA_PLIKU' już istnieje w '$DEST_DIR'. Pomijam."
    else
        echo "Kopiuję '$PLIK' do '$DEST_DIR'."
        cp "$PLIK" "$DEST_DIR/"
    fi
done

echo "Kopiowanie zakończone."

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
# Zadanie 7.
# Wyszukać w katalogu `bbb` i jego podkatalogach wszystkie pliki zwyczajne
# (nie katalogi!), które są w systemie plików oznaczone jako wykonywalne.
# Utworzyć w katalogu `ddd` plik `ostrzeżenie`, w którym pojawi się informacja
# "Uważaj na te pliki:" oraz lista znalezionych plików (każdy w nowej linii).
#


#!/usr/bin/env bash

# Definiujemy katalogi i plik wyjściowy
SRC_DIR="bbb"
DEST_DIR="ddd"
OUTPUT_FILE="$DEST_DIR/ostrzeżenie"

# Sprawdzamy, czy katalog źródłowy istnieje
if [ ! -d "$SRC_DIR" ]; then
    echo "Katalog '$SRC_DIR' nie istnieje. Brak plików do sprawdzenia."
    exit 1
fi

# Sprawdzamy, czy katalog docelowy istnieje, jeśli nie – tworzymy go
if [ ! -d "$DEST_DIR" ]; then
    echo "Katalog '$DEST_DIR' nie istnieje. Tworzę katalog."
    mkdir "$DEST_DIR"
fi

# Tworzymy lub nadpisujemy plik ostrzeżenie
echo "Uważaj na te pliki:" > "$OUTPUT_FILE"

# Przeszukujemy katalog `bbb` i jego podkatalogi za pomocą pętli `for`
for PLIK in $(ls -R "$SRC_DIR"); do
    FULL_PATH="$SRC_DIR/$PLIK"

    if [ -f "$FULL_PATH" ] && [ -x "$FULL_PATH" ]; then  # Sprawdzamy, czy plik istnieje i jest wykonywalny
        echo "$FULL_PATH" >> "$OUTPUT_FILE"
    fi
done

echo "Lista plików wykonywalnych została zapisana w '$OUTPUT_FILE'."

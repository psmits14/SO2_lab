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
# Zadanie 8.
# Utworzyć kopię zapasową wszystkich ważnych plików z katalogów `aaa` i `bbb`
# wewnątrz katalogu `zapasy` w `ddd`. Ważne pliki to takie, które zostały
# zabezpieczone przed modyfikacją (czyli nie mamy prawa zapisu do nich).
# Zachować strukturę plików – czyli w katalogu `zapasy` mają powstać katalogi
# `aaa`, `bbb` i wszelkie potrzebne ich podkatalogi.
#

#!/bin/bash

# Źródłowe katalogi
SRC_DIRS=("aaa" "bbb")

# Katalog docelowy na kopie zapasowe
DEST_ROOT="ddd/zapasy"

# Przechodzimy przez każdy katalog źródłowy
for SRC in "${SRC_DIRS[@]}"; do
  # Szukamy wszystkich plików w sposób rekursywny
  for FILE in $(find "$SRC" -type f); do
    # Sprawdzamy, czy plik NIE jest zapisywalny
    if [ ! -w "$FILE" ]; then
      # Wyciągamy ścieżkę względną pliku względem katalogu źródłowego
      REL_PATH="${FILE#$SRC/}"
      # Tworzymy pełną ścieżkę do katalogu docelowego.
      DEST_DIR="$DEST_ROOT/$SRC/$(dirname "$REL_PATH")" 
      # Tworzymy katalog docelowy, jeśli jeszcze nie istnieje
      mkdir -p "$DEST_DIR"
      # Kopiujemy plik
      cp "$FILE" "$DEST_DIR/"
    fi
  done
done




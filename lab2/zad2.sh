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
# Zadanie 2.
# Zweryfikować istnienie i zawartość pliku `drugi` z katalogu `ddd`.
# Plik powinien zawierać napis `Ala ma kota.`. Jeśli czegoś brakuje
# to odpowiedni plik stworzyć lub nadpisać istniejący.
#


# Definiujemy ścieżkę do pliku
PLIK="ddd/drugi"
OCZEKIWANA_TRESC="Ala ma kota."

# Sprawdzamy, czy plik istnieje
if [ -f "$PLIK" ]; then
    # Wczytujemy zawartość pliku
    ZAWARTOSC=$(cat "$PLIK")

    # Sprawdzamy, czy zawartość zgadza się z oczekiwaną
    if [ "$ZAWARTOSC" == "$OCZEKIWANA_TRESC" ]; then
        echo "Plik '$PLIK' istnieje i zawiera poprawną treść."
    else
        echo "Plik '$PLIK' istnieje, ale ma niepoprawną treść. Nadpisuję."
        echo "$OCZEKIWANA_TRESC" > "$PLIK"
    fi
else
    echo "Plik '$PLIK' nie istnieje. Tworzę i zapisuję poprawną treść."
    echo "$OCZEKIWANA_TRESC" > "$PLIK"
fi


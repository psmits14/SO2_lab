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
# Zadanie 10.
# Stworzyć zestaw nowych plików w katalogu `zasoby` w `ddd`. Nazwy plików
# do utworzenia zostały podane w kilku plikach `nazwy-1`, `nazwy-2`, itd.,
# które również znajdują się w katalogu `ddd`. Zawartość tworzonych plików
# powinna stanowić liczba, mówiąca ile razy dana nazwa została powtórzona
# w plikach źródłowych `nazwa-...` – to znaczy, domyślnie nowo tworzone pliki
# mają mieć jako zawartość zero (0), jeśli dana nazwa się powtórzy (plik już
# istnieje) to zwiększamy tę wartość na jeden, dwa, itd.
# Zadbać o to, aby każde uruchomienie skryptu miało ten sam efekt – czyli
# aby po drugim uruchomieniu nadal istniały pliki o wartości zero.
# Upewnić się przy tym, że nie usuniemy/nadpiszemy niczego, co było pierwotnie
# w katalogu `zasoby` (możemy zmodyfikować tylko pliki, które podano w plikach
# źródłowych `nazwa-...`; każda nazwa to osobna linia w tych plikach).
#


# Katalog źródłowy z plikami nazw
NAZWY_DIR="ddd"
# Katalog, w którym mają powstać nowe pliki
ZASOBY_DIR="ddd/zasoby"

# Upewnij się, że katalog zasobów istnieje
mkdir -p "$ZASOBY_DIR"

# Zmienna tymczasowa: przechowuje wszystkie nazwy z plików `nazwy-*`
ALL_NAMES=$(cat "$NAZWY_DIR"/nazwy-*)

# Przetwarzamy wszystkie unikalne nazwy
# Dla każdej unikalnej nazwy:
#   - liczymy, ile razy się pojawiła w plikach `nazwy-*`
#   - tworzymy odpowiedni plik w `zasoby`, jeśli jeszcze nie istnieje

# Przechodzimy przez wszystkie unikalne nazwy z plików `nazwy-*`
# - echo "$ALL_NAMES"        : wypisuje wszystkie nazwy zebrane wcześniej (mogą się powtarzać)
# - sort                     : sortuje nazwy alfabetycznie (potrzebne do poprawnego działania uniq)
# - uniq                     : usuwa powtarzające się nazwy, zostawiając tylko unikalne
# - while read -r NAME; do   : rozpoczyna pętlę – dla każdej unikalnej nazwy wykonujemy dalsze operacje
echo "$ALL_NAMES" | sort | uniq | while read -r NAME; do

  # Liczymy, ile razy dana nazwa (zmienna $NAME) wystąpiła we wszystkich liniach ALL_NAMES
  # - grep -Fx "$NAME"        : znajduje dokładnie pasujące linie (cała linia = nazwa), filtruje: przepuszcza tylko te linie, które dokładnie odpowiadają nazwie.
  #   -F : traktuje nazwę dosłownie (bez wyrażeń regularnych)
  #   -x : dopasowanie musi obejmować całą linię (nie tylko fragment)
  # - wc -l                   : liczy, ile takich linii (czyli wystąpień) było, wordcount linie 
  # Wynik zapisujemy do zmiennej COUNT
  COUNT=$(echo "$ALL_NAMES" | grep -Fx "$NAME" | wc -l)

  FILE_PATH="$ZASOBY_DIR/$NAME"

  # Jeśli plik już istnieje – nic nie rób
  if [ ! -f "$FILE_PATH" ]; then
    # Tworzymy nowy plik z odpowiednią zawartością (domyślnie: 0)
    VALUE=$((COUNT - 1))
    echo "$VALUE" > "$FILE_PATH"
  fi
done




#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3 – semestr letni 2020/2021
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
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
# Wyszukać w katalogu `ccc` wszystkie dowiązania, które wskazują na konkretną
# podaną ścieżkę – pierwszy i jedyny argument skryptu. Wyświetlić nazwy tych
# pasujących dowiązań (tylko same nazwy plików dowiązań), każdą nazwę w nowej
# linii. Nie interesuje nas, czy te dowiązania są poprawne (czyli czy istnieje
# jakiś element pod wskazywaną ścieżką). Nie wyświetlać nic ponadto!
# Zakończyć skrypt z błędem (komenda: exit 1) jeśli nie podano argumentu.
#
# Przykład uruchomienia: ./zad9.sh '../aaa/echo'
#


if [ $# -ne 1 ]; then
  exit 1
fi

target_path="$1"

# Przechodzimy po plikach w katalogu ccc
for link in ccc/*; do
  # Sprawdzamy, czy to dowiązanie symboliczne
  if [ -L "$link" ]; then
    # Odczytujemy, dokąd prowadzi dowiązanie
    link_target=$(readlink "$link")

    # Jeśli wskazuje na szukaną ścieżkę – wypisujemy jego nazwę
    if [ "$link_target" = "$target_path" ]; then
      basename "$link"
    fi
  fi
done


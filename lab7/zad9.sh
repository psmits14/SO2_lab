#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 7 – semestr letni 2020/2021
#
# Celem zajęć jest zapoznanie się z wyrażeniami regularnymi, wykorzystując
# przy tym narzędzia awk i grep oraz wszystkie inne, poznane na zajęciach.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
#
#
# Zadanie 9.
# Proszę wyświetlić komentarze z bieżącego pliku z zadaniami ($0), wstawiając
# znaki niełamliwej spacji języka HTML (&nbsp;) za wszystkimi pojedynczymi
# literami w tekście.
#


awk --re-interval 'BEGIN{RS = "\n"}
{
    if (match($0, /^#/)){                   ##--re-interval, aby działał operator określenia powtórzeń {} 
                                            # match($0, /^#/) — sprawdzamy, czy linia zaczyna się od "#", czyli jest komentarzem
        split($0, tab, " ")                  # split($0, tab, " ") — dzielimy linię na tablicę `tab`, rozdzielając po spacji

        for (key = 0; key < length(tab); key++){

            if (length(tab[key]) == 1 && match(tab[key], /[a-zA-Z]/ ) ){        # Jeśli długość elementu wynosi 1 i jest to pojedyncza litera
                tab[key] = tab[key] "&nbsp;";
                printf "%s", tab[key];
                
            }else if (key < length(tab)-1 && key != 0){     # normalne slowo 
                printf "%s ", tab[key];
                
            }else if (key == length(tab)-1 ){   #jesli to ostatnie slowo, wypisz je razem z \n
                printf "%s\n", tab[key];
            }
        }
    }
}' $0

# README - Rozwiązania zadań laboratoryjnych z Systemów Operacyjnych 2

## Opis repozytorium

To repozytorium zawiera rozwiązania zadań laboratoryjnych z przedmiotu **Systemy Operacyjne 2**, realizowanych w semestrze letnim 2024/2025 na Wydziale Informatyki i Telekomunikacji Politechniki Wrocławskiej. Zajęcia prowadził **mgr inż. Mateusz Gniewkowski** ([strona prowadzącego](https://gniewkowski.wroclaw.pl/)).

Wszystkie rozwiązania zostały zaimplementowane w **Bashu** w środowisku Linux.

## Struktura repozytorium

Repozytorium jest podzielone na sekcje odpowiadające poszczególnym laboratoriom:

```
.
├── lab2/          # Podstawy skryptów powłoki Bash
├── lab3/          # Operacje na dowiązaniach
├── lab4/          # Program find
├── lab5/          # Przetwarzanie potokowe
├── lab6/          # Program awk
└── lab7/          # Wyrażenia regularne
```

Każdy katalog zawiera:
- Rozwiązania zadań w formie skryptów Bash
- Ewentualne pliki pomocnicze

## Tematyka laboratoriów

1. **Wprowadzenie** - organizacja zajęć, zasady zaliczenia
2. **Podstawy skryptów Bash** - podstawowe komendy, zmienne, przekierowania
3. **Operacje na dowiązaniach** - dowiązania twarde i miękkie, programy `ln`, `readlink`
4. **Program find** - wyszukiwanie plików, wyrażenia, akcje
5. **Przetwarzanie potokowe** - potoki, programy `sort`, `uniq`, `grep`, `cut`
6. **Program awk** - przetwarzanie tekstu, wzorce, akcje, zmienne
7. **Wyrażenia regularne** - podstawowe operatory, zastosowanie w `grep` i `awk`

## Wymagania

Do uruchomienia rozwiązań potrzebne jest:
- System Linux lub emulator (np. WSL2 dla Windows)
- Powłoka Bash (wersja 4.x lub nowsza)
- Podstawowe narzędzia GNU (find, awk, grep itp.)

## Jak korzystać

1. Sklonuj repozytorium:
   ```bash
   git clone https://github.com/twoja_nazwa/systemy-operacyjne-2-lab.git
   ```

2. Przejdź do katalogu z wybranym laboratorium:
   ```bash
   cd systemy-operacyjne-2-lab/labX
   ```

3. Nadaj uprawnienia wykonania skryptom:
   ```bash
   chmod +x *.sh
   ```

4. Uruchom wybrany skrypt:
   ```bash
   ./nazwa_skryptu.sh
   ```

## Autor
Patrycja Smits

# 🍅 Pomodoro Bar

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Natywna aplikacja **macOS w pasku menu**, która przenosi **metodę Pomodoro** do Twojego paska menu.
Dodajesz zadania, ustawiasz ich czas trwania, startujesz odliczanie w górnym pasku,
a przerwami zajmuje się aplikacja — z powiadomieniami.

Zbudowana w czystym **AppKit (Swift)**, zero zależności. Bez ikony w Docku — dyskretnie siedzi
w pasku menu.

## Funkcje

- 🍅 **Timer w pasku menu** — odlicza w dół od końca sesji (np. `🍅 24:59`); pomidor **delikatnie pulsuje**, gdy timer działa, a przy pauzie pokazuje **⏸**
- 🖼️ **Karta statusu** — zaokrąglona, wyśrodkowana karta na górze menu pokazuje Skupienie / Zostało / Minęło / Pomodoro oraz przycisk 📝 Pokaż changelog
- 📊 **Okno statystyk** — osobne okno z przełącznikiem **Dzień / Tydzień / Miesiąc** i listą zadań z czasem (każda ukończona sesja jest zapisywana)
- 📝 **Changelog (Apple Notes)** — „📝 Pokaż changelog” w menu otwiera i zaznacza notatkę aktywnego zadania w Notatkach (folder „🍅 Pomodoro”) i dopisuje pogrubiony **separator z datą i godziną** (---- 15.08.2026 22:40) przy każdym otwarciu; jedna notatka na zadanie, edycja w Notatkach (wymagane jednorazowe zezwolenie Automatyzacja)
- ✅ **Zadania z własnym czasem** — nazwa, minuty i opcjonalny **opis / notatka**
- 🎯 **Limit sesji na zadanie** — ustawiasz, ile pomodoros potrzebuje zadanie (0 = bez limitu); postęp widać w nagłówku (`· pomodoro 2/4`), a po osiągnięciu limitu zadanie dostaje ✅ (auto-stop, bez przerwy)
- 📝 **Popup z opisem zadania** — wybranie zadania z notatką otwiera okienko z planem (znika samo po 12 s)
- ▶️ **Start / Pauza / Wznów / Stop** — pełna kontrola sesji
- ⚡ **Szybkie zadanie** — input w menu: wpisujesz nazwę, ustawiasz minuty i klikasz Start (bez okna dialogowego)
- 🕘 **Ostatnie zadania** — 10 ostatnio używanych do wyboru jednym kliknięciem
- 📅 **Codzienna rutyna** — każde zadanie można oznaczyć jako dzienne TODO (checkbox w oknie zadania); niezrobione pokazują się **pogrubione na czerwono z TODO** we własnej sekcji, zieloneją ✅ automatycznie po ¼ czasu zadania i resetują się codziennie
- 🚀 **Uruchamianie przy logowaniu** — opcjonalnie, jedno kliknięcie w Ustawieniach
- 🔗 **About → GitHub** — kliknięcie informacji o aplikacji otwiera repozytorium
- ⏱️ **Wydłużanie sesji** — przyciski stepper `− 5 min +` / `− 10 min +` (przy pracy zmieniają czas zadania, przy przerwie tylko bieżącą przerwę)
- ☕ **Przerwy na Twoich zasadach** — po każdym pomodoro aplikacja pyta: **przerwa / nowe zadanie / kontynuuj** (długa przerwa automatycznie co 4.)
- 🔔 **Dźwięki i powiadomienia** — dedykowany dzwonek na koniec każdej sesji (przełącznik w Ustawieniach) oraz powiadomienia systemowe
- 🌐 **6 języków** — Polski · English · Español · Français · العربية · Italiano (wykrywany automatycznie, do zmiany w Ustawieniach)
- 💾 **W pełni lokalnie** — zadania, notatki i ustawienia zapisują się między restartami
- 🚫 Bez ikony w Docku, bez kont, bez śledzenia

## Metoda Pomodoro

**Metoda Pomodoro** to technika zarządzania czasem opracowana przez **Francesco Cirillo**
pod koniec lat 80. Nazwa pochodzi od włoskiego słowa *pomodoro* (pomidor) — Cirillo używał
kuchennego minutnika w kształcie pomidora podczas nauki.

### Jak działa

1. **Wybierz jedno zadanie** i poświęć mu całą uwagę.
2. **Pracuj w skupionym sprincie** — tradycyjnie **25 minut**, czyli jedno *pomodoro*.
3. **Zrób krótką przerwę** — **5 minut** — odpocznij oczy, rozciągnij się, napij wody.
4. **Powtarzaj.** Po każdych **4 pomodoro** zrób **dłuższą przerwę** — **15–30 minut**.

### Dlaczego to działa

- **Czas staje się widoczny** — tykający timer zamienia „kiedyś się wezmę" w konkretny, skończony sprint.
- **Mniej prokrastynacji** — łatwiej zacząć, gdy zobowiązujesz się tylko do 25 minut.
- **Uczy skupienia** — odliczanie łagodnie pilnuje przed rozpraszaczami: „telefon sprawdzę po tym pomodoro".
- **Przerwy są w planie** — regularny odpoczynek trzyma głowę świeżą i chroni przed wypaleniem.
- **Duże zadania się kurczą** — krótkie, ograniczone interwały sprawiają, że nawet duże czy nudne zadania są do przejścia.

### W tej aplikacji

- Każde **zadanie ma własny czas** (1–480 min, domyślnie 25) — zmieści się i 50-minutowe zanurzenie, i 10-minutowy szybki task.
- Timer **odlicza w dół** w pasku menu; na zero aplikacja pyta, co dalej: **☕ przerwa** (5 min, 15 min co 4.), **📋 nowe zadanie** albo **▶ kontynuuj** to samo zadanie.
- Po przerwie automatycznie wraca do pracy. Możesz pominąć przerwę (`✋ Zakończ przerwę`) albo zatrzymać wszystko (`⏹ Stop`).
- Kończy Ci się czas? Kliknij steppery `− 5 min +` / `− 10 min +` — czas zadania się wydłuża, a odliczanie dopasowuje.

## Wymagania

- macOS 13 lub nowszy (Apple Silicon lub Intel)
- Budowa ze źródła: Xcode Command Line Tools (`xcode-select --install`)

## Instalacja

Pobierz zip z ostatniego release'a ze strony [Releases](https://github.com/essmos/PomodoroBar/releases),
rozpakuj i przeciągnij `PomodoroBar.app` do folderu Aplikacje.

> **Ostrzeżenie przy pierwszym uruchomieniu — „Apple nie mogło zweryfikować..."** jest
> normalne. Aplikacja jest **podpisana ad-hoc** (bez płatnego Apple Developer ID — dla
> prywatności, bez danych osobowych w sygnaturze), więc macOS nie może potwierdzić
> dewelopera. Aplikacja jest bezpieczna i w 100 % lokalna. Jak ją otworzyć:
>
> 1. Kliknij `PomodoroBar.app` prawym przyciskiem → **Otwórz** → **Otwórz** (jednorazowo), albo
> 2. Ustawienia systemowe → Prywatność i bezpieczeństwo → **Otwórz mimo to**, albo
> 3. Terminal: `xattr -dr com.apple.quarantine PomodoroBar.app`

**Autostart:** w aplikacji zaznacz ⚙️ Ustawienia → 🚀 Uruchamiaj przy logowaniu (macOS wymaga, by aplikacja leżała w folderze /Applications).

## Budowa ze źródła

```bash
./build.sh
# tworzy PomodoroBar.app oraz dist/PomodoroBar-v1.5.0.zip
```

## Obsługa

Kliknij ikonę 🍅 w pasku menu:

| Element menu | Działanie |
|---|---|
| 🍅 **Skupienie: *zadanie*** | Nagłówek — aktywne zadanie (lub trwająca przerwa) |
| **Zostało: 24:59 / 25:00** | Odliczanie i docelowy czas sesji |
| **Minęło: 00:01** | Czas od startu sesji |
| ⚡ **Szybkie zadanie** | Input w menu: nazwa + minuty + ▶ Start — tworzy zadanie i od razu startuje |
| ▶ **Start / ⏸ Pauza** | Start, pauza, wznowienie timera |
| ⏹ **Stop** | Zatrzymanie i zerowanie sesji |
| ✋ **Zakończ przerwę** | Pominięcie bieżącej przerwy (widoczne podczas przerwy) |
| ⏱️ **− 5 min +** / **− 10 min +** | Przyciski stepper — wydłuż/skróć sesję (klikasz wielokrotnie, menu zostaje otwarte) |
| 🕘 **Ostatnie:** | 10 ostatnio używanych zadań — klik = focus |
| 📅 **Codzienna rutyna** | Zadania rutyny, oddzielone belkami. Niezrobione: **pogrubione na czerwono TODO**. Zrobione: **zielone ✅** (automatycznie po ¼ czasu). Klik = focus zadania. Reset co dzień |
| ⚙️ **Ustawienia** | Czas pracy / przerw, **język**, 🚀 **Uruchamiaj przy logowaniu**, 🔔 **Dźwięki na koniec sesji** |
| 📋 **Zadania** | Wszystkie zadania — klik = focus (✓). Zarządzanie na dole: „➕ Dodaj zadanie…", „✏️ Edytuj wybrane…", „🗑 Usuń wybrane…" |
| 🍅 **Pomodoro Bar · v1.5.0** | Klik = otwarcie repozytorium GitHub |


### Szybkie zadanie

Wpisz nazwę w pole ⚡ na górze menu, ustaw minuty i kliknij **▶ Start** — zadanie tworzy się, dostaje focus i timer od razu startuje. Idealne do krótkich lub rzadko powtarzających się zadań.

### Codzienna rutyna

Zaznacz **„To moja codzienna rutyna"** przy dodawaniu/edycji zadania. Zadania rutyny mają własną sekcję między belkami: **pogrubione na czerwono `⬜ TODO`** gdy niezrobione, **zielone `✅`** gdy zrobione. Zielenieją automatycznie po przepracowaniu **¼ czasu zadania** i resetują się codziennie. Zadania rutyny zostają też na liście zadań ze znaczkiem 📅.

### Notatki do zadań

Przy dodawaniu lub edycji zadania możesz wpisać **opis / notatkę** — szczegóły, linki,
listę kroków, cokolwiek chcesz zapamiętać. Zadania z notatką mają znaczek `📝`. Wybranie
takiego zadania otwiera **popup** z notatką na 12 sekund; najechanie myszką pokazuje ją
jako tooltip.

## Języki

Polski · English · Español · Français · العربية · Italiano

Aplikacja sama dopasowuje język do systemu. Zmiana ręczna: **Ustawienia → Język**.

## Prywatność

W 100 % lokalnie. Zadania, notatki i ustawienia są przechowywane na Twoim Macu (UserDefaults).
Bez kont, bez śledzenia, bez dostępu do sieci.

## Licencja

[MIT](LICENSE) © 2025 essmos

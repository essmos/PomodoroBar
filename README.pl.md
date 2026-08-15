# 🍅 Pomodoro Bar

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Natywna aplikacja **macOS w pasku menu**, która przenosi **metodę Pomodoro** do Twojego paska menu.
Dodajesz zadania, ustawiasz ich czas trwania, startujesz odliczanie w górnym pasku,
a przerwami zajmuje się aplikacja — z powiadomieniami.

Zbudowana w czystym **AppKit (Swift)**, zero zależności. Bez ikony w Docku — dyskretnie siedzi
w pasku menu.

## Funkcje

- 🍅 **Timer w pasku menu** — odlicza w dół od końca sesji (np. `🍅 24:59`)
- ✅ **Zadania z własnym czasem** — nazwa, minuty i opcjonalny **opis / notatka**
- 📝 **Popup z opisem zadania** — wybranie zadania z notatką otwiera okienko z planem (znika samo po 12 s)
- ▶️ **Start / Pauza / Wznów / Stop** — pełna kontrola sesji
- 🕘 **Ostatnie zadania** — 10 ostatnio używanych do wyboru jednym kliknięciem
- ⏱️ **Wydłużanie sesji** — przyciski `+5 / +10 / −5 / −10 min` (przy pracy zmieniają czas zadania, przy przerwie tylko bieżącą przerwę)
- ☕ **Automatyczne przerwy** — krótka po każdym pomodoro, długa po co 4. (obie odliczane w dół, z powiadomieniami)
- 🔔 **Powiadomienia systemowe** — koniec pomodoro i przerwy (beep, gdy powiadomienia wyłączone)
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
- Timer **odlicza w dół** w pasku menu; na zero aplikacja powiadamia i **sama włącza przerwę** (5 min krótką, 15 min długą co 4. pomodoro).
- Po przerwie automatycznie wraca do pracy. Możesz pominąć przerwę (`✋ Zakończ przerwę`) albo zatrzymać wszystko (`⏹ Stop`).
- Kończy Ci się czas? Kliknij `+5 / +10 min` — czas zadania się wydłuża, a odliczanie dopasowuje.

## Wymagania

- macOS 13 lub nowszy (Apple Silicon lub Intel)
- Budowa ze źródła: Xcode Command Line Tools (`xcode-select --install`)

## Instalacja

Pobierz zip z ostatniego release'a ze strony [Releases](https://github.com/essmos/PomodoroBar/releases),
rozpakuj i przeciągnij `PomodoroBar.app` do folderu Aplikacje.

> Aplikacja jest podpisana ad-hoc (bez notaryzacji). Jeśli macOS zablokuje ją przy pierwszym
> otwarciu: kliknij prawym przyciskiem → **Otwórz**, albo uruchom
> `xattr -dr com.apple.quarantine PomodoroBar.app`.

**Autostart:** Ustawienia systemowe → Ogólne → Elementy logowania → dodaj `PomodoroBar.app`.

## Budowa ze źródła

```bash
./build.sh
# tworzy PomodoroBar.app oraz dist/PomodoroBar-v1.2.0.zip
```

## Obsługa

Kliknij ikonę 🍅 w pasku menu:

| Element menu | Działanie |
|---|---|
| 🍅 **Skupienie: *zadanie*** | Nagłówek — aktywne zadanie (lub trwająca przerwa) |
| **Zostało: 24:59 / 25:00** | Odliczanie i docelowy czas sesji |
| **Minęło: 00:01** | Czas od startu sesji |
| ▶ **Start / ⏸ Pauza** | Start, pauza, wznowienie timera |
| ⏹ **Stop** | Zatrzymanie i zerowanie sesji |
| ✋ **Zakończ przerwę** | Pominięcie bieżącej przerwy (widoczne podczas przerwy) |
| ⏱️ **+5 / +10 / −5 / −10 min** | Wydłużenie / skrócenie bieżącej sesji |
| 🕘 **Ostatnie:** | 10 ostatnio używanych zadań — klik = focus |
| 📋 **Zadania** | Wszystkie zadania — klik = focus (✓). Na dole „➕ Dodaj zadanie…" |
| ✏️ **Edytuj wybrane…** | Zmiana nazwy, czasu lub opisu |
| 🗑 **Usuń wybrane…** | Usunięcie aktywnego zadania |
| ⚙️ **Ustawienia** | Czas pracy / krótkiej / długiej przerwy oraz **język** |

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

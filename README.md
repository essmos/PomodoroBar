# 🍅 Pomodoro Bar

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A native **macOS menu bar app** that brings the **Pomodoro Technique** to your status bar.
Add tasks, set their duration, start a countdown timer that lives right in the menu bar,
and let the app handle your breaks — with notifications included.

Built with pure **AppKit (Swift)**, zero dependencies. No Dock icon — it stays quietly in
the menu bar.

## Features

- 🍅 **Menu bar timer** — counts down from the end of your session (e.g. `🍅 24:59`)
- ✅ **Tasks with custom durations** — name, minutes and an optional **description / notes**
- 📝 **Task note popup** — selecting a task with a note opens a small popup with what you planned to do (auto-dismisses after 12 s)
- ▶️ **Start / Pause / Resume / Stop** — full session control
- 🕘 **Recent tasks** — the last 10 used tasks for one-click focus switching
- ⏱️ **Extend session** — `+5 / +10 / −5 / −10 min` buttons (updates the task duration while working, or the current break)
- ☕ **Automatic breaks** — short break after each pomodoro, long break after every 4th (both count down, with notifications)
- 🔔 **System notifications** — pomodoro and break endings (beep fallback if notifications are off)
- 🌐 **6 languages** — Polski · English · Español · Français · العربية · Italiano (auto-detected, switchable in Settings)
- 💾 **Fully local** — tasks, notes and settings persist across restarts
- 🚫 No Dock icon, no accounts, no tracking

## The Pomodoro Technique

The **Pomodoro Technique** is a time-management method developed by **Francesco Cirillo**
in the late 1980s. The name comes from the Italian word for *tomato* — Cirillo used a
tomato-shaped kitchen timer while studying.

### How it works

1. **Pick one task** and commit to it.
2. **Work in a focused sprint** — traditionally **25 minutes**, called a *pomodoro*.
3. **Take a short break** — **5 minutes** — rest your eyes, stretch, grab some water.
4. **Repeat.** After every **4 pomodoros**, take a **longer break** — **15–30 minutes**.

### Why it works

- **Time becomes visible** — a ticking timer turns "I'll work on it" into a concrete, finite sprint.
- **Reduces procrastination** — starting is easier when you only commit to 25 minutes.
- **Trains focus** — the countdown is a gentle guardrail against distractions: "I'll check my phone after this pomodoro".
- **Breaks are part of the plan** — regular rest keeps your brain fresh and prevents burnout.
- **Big tasks shrink** — short, bounded intervals make even large or boring tasks approachable.

### In this app

- Each **task has its own duration** (1–480 minutes, default 25) — a 50-minute deep dive or a 10-minute quickie both fit.
- The timer **counts down** in the menu bar; at zero the app notifies you and **automatically starts the break** (5 min short, 15 min long every 4th pomodoro).
- After the break it returns to work automatically. You can skip a break (`✋ End break`) or stop completely (`⏹ Stop`).
- Running out of time mid-session? Hit `+5 / +10 min` — the task's duration grows and the countdown adjusts.

## Requirements

- macOS 13 or later (Apple Silicon or Intel)
- Building from source: Xcode Command Line Tools (`xcode-select --install`)

## Install

Download the latest release zip from the [Releases](https://github.com/essmos/PomodoroBar/releases)
page, unzip and move `PomodoroBar.app` to your Applications folder.

> The app is ad-hoc signed (not notarized). If macOS blocks it on first launch:
> right-click → **Open**, or run `xattr -dr com.apple.quarantine PomodoroBar.app`.

**Launch at login:** System Settings → General → Login Items → add `PomodoroBar.app`.

## Build from source

```bash
./build.sh
# produces PomodoroBar.app and dist/PomodoroBar-v1.2.0.zip
```

## Usage

Click the 🍅 icon in the menu bar:

| Menu item | What it does |
|---|---|
| 🍅 **Focus: *task*** | Header — currently focused task (or the break in progress) |
| **Remaining: 24:59 / 25:00** | Countdown and total session duration |
| **Elapsed: 00:01** | Time since the session started |
| ▶ **Start / ⏸ Pause** | Start, pause or resume the timer |
| ⏹ **Stop** | Stop and reset the session |
| ✋ **End break** | Skip the current break (visible during breaks) |
| ⏱️ **+5 / +10 / −5 / −10 min** | Extend or shorten the current session |
| 🕘 **Recent:** | 10 most recently used tasks — one click to focus |
| 📋 **Tasks** | All tasks — click to focus (✓). `➕ Add task…` at the bottom |
| ✏️ **Edit selected…** | Change name, duration or description |
| 🗑 **Delete selected…** | Remove the focused task |
| ⚙️ **Settings** | Work / short break / long break durations, and **language** |

### Task notes

When adding or editing a task you can write a **description / notes** — details, links,
a checklist, anything you need to remember. Tasks with notes get a `📝` marker. Selecting
such a task opens a **popup** with your note for 12 seconds; hovering the task shows it as
a tooltip.

## Languages

Polski · English · Español · Français · العربية · Italiano

The app follows your system language automatically. To override: **Settings → Language**.

## Privacy

100 % local. Tasks, notes and settings are stored on your Mac (UserDefaults). No accounts,
no tracking, no network access.

## License

[MIT](LICENSE) © 2025 essmos

# 🍅 Pomodoro Bar

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A native **macOS menu bar app** that brings the **Pomodoro Technique** to your status bar.
Add tasks, set their duration, start a countdown timer that lives right in the menu bar,
and let the app handle your breaks — with notifications included.

Built with pure **AppKit (Swift)**, zero dependencies. No Dock icon — it stays quietly in
the menu bar.

## Features

- 🍅 **Menu bar timer** — counts down from the end of your session (e.g. `🍅 24:59`); the tomato **pulses gently** while the timer runs and shows **⏸** when paused
- 🖼️ **Status card** — a rounded, centered card at the top of the menu shows Focus / Remaining / Elapsed / Pomodoros and the 📝 Show changelog button at a glance
- 📊 **Statistics window** — opens a dedicated window with a **Day / Week / Month** selector and a per-task list of time spent (every finished session is recorded)
- 📝 **Changelog (Apple Notes)** — „📝 Show changelog” in the menu opens and selects the focused task's note in the Notes app (folder „🍅 Pomodoro”) and stamps a bold **date/time divider** (---- 15.08.2026 22:40) on every open; one note per task, editing happens in Notes (one-time Automation permission required)
- ✅ **Tasks with custom durations** — name, minutes and an optional **description / notes**
- 🎯 **Session goal per task** — set how many pomodoros a task needs (0 = no limit); progress shows in the header (`· pomodoro 2/4`) and the task gets ✅ when the goal is reached (auto-stops, no break)
- 📝 **Task note popup** — selecting a task with a note opens a small popup with what you planned to do (auto-dismisses after 12 s)
- ▶️ **Start / Pause / Resume / Stop** — full session control
- ⚡ **Quick task** — inline input in the menu: type a name, set minutes, hit Start (no dialog needed)
- 🕘 **Recent tasks** — the last 10 used tasks for one-click focus switching
- 📅 **Daily routine** — mark any task as a daily to-do (checkbox in add/edit); unfinished items show **bold red with a TODO marker** in their own section, turn **green ✅** automatically after ¼ of the task time, and reset every day
- 🚀 **Launch at login** — optional, one click in Settings
- 🔗 **About → GitHub** — click the app info at the bottom of the menu to open the repository
- ⏱️ **Extend session** — `− 5 min +` / `− 10 min +` stepper buttons (updates the task duration while working, or the current break)
- ☕ **Breaks, on your terms** — after each pomodoro the app asks: **break / new task / continue** (long break auto after every 4th)
- 🔔 **Sounds & notifications** — dedicated chime at every session end (toggle in Settings) plus system notifications
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
- The timer **counts down** in the menu bar; at zero the app asks what's next: **☕ break** (5 min, 15 min every 4th), **📋 new task** or **▶ continue** the same task.
- After the break it returns to work automatically. You can skip a break (`✋ End break`) or stop completely (`⏹ Stop`).
- Running out of time mid-session? Hit the `− 5 min +` / `− 10 min +` steppers — the task's duration grows and the countdown adjusts.

## Requirements

- macOS 13 or later (Apple Silicon or Intel)
- Building from source: Xcode Command Line Tools (`xcode-select --install`)

## Install

Download the latest release zip from the [Releases](https://github.com/essmos/PomodoroBar/releases)
page, unzip and move `PomodoroBar.app` to your Applications folder.

> **First launch warning — "Apple could not verify ..."** is expected. The app is
> **ad-hoc signed** (no paid Apple Developer ID, for privacy — no personal name in the
> signature), so macOS can't verify the developer. The app is safe and 100 % local.
> To open it:
>
> 1. Right-click `PomodoroBar.app` → **Open** → **Open** (one-time), or
> 2. System Settings → Privacy & Security → **Open Anyway**, or
> 3. Terminal: `xattr -dr com.apple.quarantine PomodoroBar.app`

**Launch at login:** in the app, tick ⚙️ Settings → 🚀 Launch at login (macOS requires the app to live in /Applications).

## Build from source

```bash
./build.sh
# produces PomodoroBar.app and dist/PomodoroBar-v1.5.0.zip
```

## Usage

Click the 🍅 icon in the menu bar:

| Menu item | What it does |
|---|---|
| 🍅 **Focus: *task*** | Header — currently focused task (or the break in progress) |
| **Remaining: 24:59 / 25:00** | Countdown and total session duration |
| **Elapsed: 00:01** | Time since the session started |
| ⚡ **Quick task** | Inline input: name + minutes + ▶ Start — creates the task and starts it immediately |
| ▶ **Start / ⏸ Pause** | Start, pause or resume the timer |
| ⏹ **Stop** | Stop and reset the session |
| ✋ **End break** | Skip the current break (visible during breaks) |
| ⏱️ **− 5 min +** / **− 10 min +** | Stepper buttons — extend or shorten the session (click repeatedly, the menu stays open) |
| 🕘 **Recent:** | 10 most recently used tasks — one click to focus |
| 📅 **Daily routine** | Routine tasks, separated by bars. Not done: **bold red TODO**. Done: **green ✅** (auto after ¼ of the time). Click = focus the task. Resets daily |
| ⚙️ **Settings** | Work / short break / long break durations, **language**, 🚀 **Launch at login**, 🔔 **Sound at session end** |
| 📋 **Tasks** | All tasks — click to focus (✓). Management at the bottom: `➕ Add task…`, `✏️ Edit selected…`, `🗑 Delete selected…` |
| 🍅 **Pomodoro Bar · v1.5.0** | Click to open the GitHub repository |


### Quick task

Type a name in the ⚡ field at the top of the menu, set the minutes and press **▶ Start** — the task is created, focused and the timer starts immediately. Ideal for short or rarely repeated tasks.

### Daily routine

Tick **“This is part of my daily routine”** when adding/editing a task. Routine tasks get their own section between separators: **bold red `⬜ TODO`** when not done, **green `✅`** when done. They turn green automatically after you've worked **¼ of the task's time** on them, and reset every day. Routine tasks also stay in the Tasks list with a 📅 marker.

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

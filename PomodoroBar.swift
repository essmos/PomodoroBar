import AppKit
import UserNotifications
import ServiceManagement

// MARK: - Localization (pl, en, es, fr, ar, it)

struct L10n {
    static var lang: String = "en"
    static let supported = ["pl", "en", "es", "fr", "ar", "it"]
    static let nativeNames: [String: String] = [
        "pl": "Polski", "en": "English", "es": "Español",
        "fr": "Français", "ar": "العربية", "it": "Italiano"
    ]

    static func t(_ key: String) -> String {
        if let dict = table[lang], let s = dict[key] { return s }
        if let dict = table["en"], let s = dict[key] { return s }
        return key
    }

    static func t(_ key: String, _ args: CVarArg...) -> String {
        String(format: t(key), arguments: args)
    }

    static func detect() -> String {
        for pref in Locale.preferredLanguages {
            let code = String(pref.prefix(2))
            if supported.contains(code) { return code }
        }
        return "en"
    }

    static let table: [String: [String: String]] = [
        "pl": [
            "focus.work": "🍅 Skupienie: %@ (%d min)",
            "focus.break.short": "☕ Przerwa krótka",
            "focus.break.long": "☕ Przerwa długa",
            "focus.sessions": " · pomodoro %d/%d",
            "progress.remaining": "Zostało: %@ / %@",
            "progress.elapsed": "Minęło: %@",
            "progress.count": "Zrobione pomodoro: %d",
            "timer.start": "▶ Start",
            "timer.resume": "▶ Wznów",
            "timer.pause": "⏸ Pauza",
            "timer.stop": "⏹ Stop",
            "timer.skipBreak": "✋ Zakończ przerwę",
            "recent.header": "🕘 Ostatnie:",
            "tasks.title": "📋 Zadania",
            "tasks.add": "➕ Dodaj zadanie…",
            "tasks.empty": "Brak zadań — dodaj pierwsze",
            "tasks.edit": "✏️ Edytuj wybrane zadanie…",
            "tasks.delete": "🗑 Usuń wybrane zadanie…",
            "tasks.item": "🍅 %@ · %d min",
            "tasks.noteMark": " 📝",
            "settings.title": "⚙️ Ustawienia",
            "settings.work": "Czas pracy",
            "settings.shortBreak": "Krótka przerwa",
            "settings.longBreak": "Długa przerwa",
            "settings.language": "🌐 Język",
            "changelog.show": "📝 Pokaż changelog",
            "changelog.error": "Nie udało się otworzyć notatki",
            "changelog.errorInfo": "Ustawienia systemowe -> Prywatność i bezpieczeństwo -> Automatyzacja: pozwól aplikacji sterować aplikacją Notatki.",
            "changelog.tip": "Wskazówka: jeśli nie widzisz aplikacji w Automatyzacji, przenieś PomodoroBar.app do folderu Aplikacje i uruchom ponownie.",
            "changelog.openSettings": "Otwórz ustawienia",
            "stats.title": "📊 Statystyki",
            "stats.today": "Dziś: %@",
            "stats.week": "Ten tydzień: %@",
            "stats.month": "Ten miesiąc: %@",
            "stats.byTask": "Po zadaniach (tydzień):",
            "stats.empty": "Brak danych — ukończ sesję",
            "stats.rangeDay": "Dzień",
            "stats.rangeWeek": "Tydzień",
            "stats.rangeMonth": "Miesiąc",
            "stats.total": "Razem: %@",
            "stats.taskColumn": "Zadanie",
            "stats.timeColumn": "Czas",
            "settings.sounds": "🔔 Dźwięki na koniec sesji",
            "info": "🍅 Pomodoro Bar · v1.5.0",
            "menu.quit": "Zakończ",
            "dialog.addTitle": "Nowe zadanie",
            "dialog.editTitle": "Edytuj zadanie",
            "dialog.addConfirm": "Dodaj",
            "dialog.save": "Zapisz",
            "dialog.cancel": "Anuluj",
            "dialog.info": "Podaj nazwę, czas trwania i ewentualnie opis zadania.",
            "dialog.nameLabel": "Nazwa zadania:",
            "dialog.namePlaceholder": "np. Raport miesięczny",
            "dialog.minutesLabel": "Czas trwania (min):",
            "dialog.minutesPlaceholder": "np. 25",
            "dialog.noteLabel": "Opis / notatka (opcjonalnie):",
            "dialog.routineCheck": "To moja codzienna rutyna (TODO na dziś)",
            "dialog.sessionsLabel": "Pomodoros dla tego zadania (0 = bez limitu):",
            "dialog.sessionsPlaceholder": "np. 4 (0 = bez limitu)",
            "quick.placeholder": "Nazwa zadania…",
            "dialog.noTaskTitle": "Brak wybranego zadania",
            "dialog.noTaskInfo": "Najpierw wybierz zadanie z listy 📋 Zadania.",
            "dialog.deleteTitle": "Usunąć zadanie „%@”?",
            "dialog.deleteInfo": "Bieżąca sesja tego zadania zostanie zatrzymana.",
            "dialog.deleteConfirm": "Usuń",
            "notif.workDone": "🍅 Pomodoro zakończone!",
            "notif.breakStart.short": "Czas na krótką przerwę. 💪",
            "notif.breakStart.long": "Czas na długą przerwę. 💪",
            "notif.breakDone": "☕ Przerwa zakończona",
            "notif.breakDoneBody": "Wracaj do pracy — kolejny pomodoro!",
            "notif.taskDone": "Zadanie ukończone!",
            "notif.taskDoneBody": "Wszystkie pomodoro tego zadania zrobione. 🎉",
            "prompt.title": "🍅 Pomodoro ukończone!",
            "prompt.message": "Co robimy dalej?",
            "prompt.break": "☕ Przerwa",
            "prompt.newTask": "📋 Nowe zadanie",
            "prompt.continue": "▶ Kontynuuj",
            "routine.title": "📅 Codzienna rutyna",
            "routine.progress": "Rutyna: %d/%d wykonane",
            "routine.todoPrefix": "TODO ",
            "routine.add": "➕ Dodaj do rutyny…",
            "routine.empty": "Brak zadań w rutynie — oznacz zadanie jako codzienną rutynę",
            "routine.markDone": "✓ Oznacz jako wykonane",
            "routine.unmark": "↩ Cofnij",
            "routine.focus": "▶ Skup się na tym zadaniu",
            "routine.delete": "🗑 Usuń",
            "routine.deleteTitle": "Usunąć element rutyny „%@”?",
            "routine.deleteInfo": "Zostanie usunięty z codziennej rutyny.",
            "autostart.title": "🚀 Uruchamiaj przy logowaniu",
            "autostart.error": "Nie udało się zmienić uruchamiania przy logowaniu: %@",
            "about.github": "Otwórz repozytorium GitHub",
        ],
        "en": [
            "focus.work": "🍅 Focus: %@ (%d min)",
            "focus.break.short": "☕ Short break",
            "focus.break.long": "☕ Long break",
            "focus.sessions": " · pomodoro %d/%d",
            "progress.remaining": "Remaining: %@ / %@",
            "progress.elapsed": "Elapsed: %@",
            "progress.count": "Pomodoros completed: %d",
            "timer.start": "▶ Start",
            "timer.resume": "▶ Resume",
            "timer.pause": "⏸ Pause",
            "timer.stop": "⏹ Stop",
            "timer.skipBreak": "✋ End break",
            "recent.header": "🕘 Recent:",
            "tasks.title": "📋 Tasks",
            "tasks.add": "➕ Add task…",
            "tasks.empty": "No tasks — add the first one",
            "tasks.edit": "✏️ Edit selected task…",
            "tasks.delete": "🗑 Delete selected task…",
            "tasks.item": "🍅 %@ · %d min",
            "tasks.noteMark": " 📝",
            "settings.title": "⚙️ Settings",
            "settings.work": "Work duration",
            "settings.shortBreak": "Short break",
            "settings.longBreak": "Long break",
            "settings.language": "🌐 Language",
            "changelog.show": "📝 Show changelog",
            "changelog.error": "Could not open the note",
            "changelog.errorInfo": "System Settings -> Privacy & Security -> Automation: allow this app to control Notes.",
            "changelog.tip": "Tip: if you don't see the app in Automation, move PomodoroBar.app to /Applications and relaunch.",
            "changelog.openSettings": "Open Settings",
            "stats.title": "📊 Statistics",
            "stats.today": "Today: %@",
            "stats.week": "This week: %@",
            "stats.month": "This month: %@",
            "stats.byTask": "By task (this week):",
            "stats.empty": "No data yet — finish a session",
            "stats.rangeDay": "Day",
            "stats.rangeWeek": "Week",
            "stats.rangeMonth": "Month",
            "stats.total": "Total: %@",
            "stats.taskColumn": "Task",
            "stats.timeColumn": "Time",
            "settings.sounds": "🔔 Sound at session end",
            "info": "🍅 Pomodoro Bar · v1.5.0",
            "menu.quit": "Quit",
            "dialog.addTitle": "New task",
            "dialog.editTitle": "Edit task",
            "dialog.addConfirm": "Add",
            "dialog.save": "Save",
            "dialog.cancel": "Cancel",
            "dialog.info": "Enter a task name, a duration and an optional description.",
            "dialog.nameLabel": "Task name:",
            "dialog.namePlaceholder": "e.g. Monthly report",
            "dialog.minutesLabel": "Duration (minutes):",
            "dialog.minutesPlaceholder": "e.g. 25",
            "dialog.noteLabel": "Description / notes (optional):",
            "dialog.routineCheck": "This is part of my daily routine",
            "dialog.sessionsLabel": "Pomodoros for this task (0 = no limit):",
            "dialog.sessionsPlaceholder": "e.g. 4 (0 = no limit)",
            "quick.placeholder": "Task name…",
            "dialog.noTaskTitle": "No task selected",
            "dialog.noTaskInfo": "Select a task from the 📋 Tasks list first.",
            "dialog.deleteTitle": "Delete task “%@”?",
            "dialog.deleteInfo": "The current session for this task will be stopped.",
            "dialog.deleteConfirm": "Delete",
            "notif.workDone": "🍅 Pomodoro completed!",
            "notif.breakStart.short": "Time for a short break. 💪",
            "notif.breakStart.long": "Time for a long break. 💪",
            "notif.breakDone": "☕ Break finished",
            "notif.breakDoneBody": "Back to work — next pomodoro!",
            "notif.taskDone": "Task completed!",
            "notif.taskDoneBody": "All pomodoros for this task are done. 🎉",
            "prompt.title": "🍅 Pomodoro done!",
            "prompt.message": "What next?",
            "prompt.break": "☕ Break",
            "prompt.newTask": "📋 New task",
            "prompt.continue": "▶ Continue",
            "routine.title": "📅 Daily routine",
            "routine.progress": "Routine: %d/%d done",
            "routine.todoPrefix": "TODO ",
            "routine.add": "➕ Add to routine…",
            "routine.empty": "No routine tasks yet — mark a task as your daily routine",
            "routine.markDone": "✓ Mark as done",
            "routine.unmark": "↩ Unmark",
            "routine.focus": "▶ Focus this task",
            "routine.delete": "🗑 Delete",
            "routine.deleteTitle": "Delete routine item “%@”?",
            "routine.deleteInfo": "It will be removed from your daily routine.",
            "autostart.title": "🚀 Launch at login",
            "autostart.error": "Could not change launch-at-login: %@",
            "about.github": "Open the GitHub repository",
        ],
        "es": [
            "focus.work": "🍅 Enfoque: %@ (%d min)",
            "focus.break.short": "☕ Descanso corto",
            "focus.break.long": "☕ Descanso largo",
            "focus.sessions": " · pomodoro %d/%d",
            "progress.remaining": "Restante: %@ / %@",
            "progress.elapsed": "Transcurrido: %@",
            "progress.count": "Pomodoros completados: %d",
            "timer.start": "▶ Iniciar",
            "timer.resume": "▶ Reanudar",
            "timer.pause": "⏸ Pausa",
            "timer.stop": "⏹ Detener",
            "timer.skipBreak": "✋ Terminar descanso",
            "recent.header": "🕘 Recientes:",
            "tasks.title": "📋 Tareas",
            "tasks.add": "➕ Añadir tarea…",
            "tasks.empty": "No hay tareas — añade la primera",
            "tasks.edit": "✏️ Editar tarea seleccionada…",
            "tasks.delete": "🗑 Eliminar tarea seleccionada…",
            "tasks.item": "🍅 %@ · %d min",
            "tasks.noteMark": " 📝",
            "settings.title": "⚙️ Ajustes",
            "settings.work": "Duración de trabajo",
            "settings.shortBreak": "Descanso corto",
            "settings.longBreak": "Descanso largo",
            "settings.language": "🌐 Idioma",
            "changelog.show": "📝 Ver changelog",
            "changelog.error": "No se pudo abrir la nota",
            "changelog.errorInfo": "Ajustes del sistema -> Privacidad y seguridad -> Automatización: permite que la app controle Notas.",
            "changelog.tip": "Consejo: si no ves la app en Automatización, mueve PomodoroBar.app a /Applications y reiníciala.",
            "changelog.openSettings": "Abrir ajustes",
            "stats.title": "📊 Estadísticas",
            "stats.today": "Hoy: %@",
            "stats.week": "Esta semana: %@",
            "stats.month": "Este mes: %@",
            "stats.byTask": "Por tarea (esta semana):",
            "stats.empty": "Sin datos — termina una sesión",
            "stats.rangeDay": "Día",
            "stats.rangeWeek": "Semana",
            "stats.rangeMonth": "Mes",
            "stats.total": "Total: %@",
            "stats.taskColumn": "Tarea",
            "stats.timeColumn": "Tiempo",
            "settings.sounds": "🔔 Sonido al terminar la sesión",
            "info": "🍅 Pomodoro Bar · v1.5.0",
            "menu.quit": "Salir",
            "dialog.addTitle": "Nueva tarea",
            "dialog.editTitle": "Editar tarea",
            "dialog.addConfirm": "Añadir",
            "dialog.save": "Guardar",
            "dialog.cancel": "Cancelar",
            "dialog.info": "Introduce el nombre, la duración y, opcionalmente, una descripción.",
            "dialog.nameLabel": "Nombre de la tarea:",
            "dialog.namePlaceholder": "p. ej. Informe mensual",
            "dialog.minutesLabel": "Duración (minutos):",
            "dialog.minutesPlaceholder": "p. ej. 25",
            "dialog.noteLabel": "Descripción / notas (opcional):",
            "dialog.routineCheck": "Es parte de mi rutina diaria",
            "dialog.sessionsLabel": "Pomodoros para esta tarea (0 = sin límite):",
            "dialog.sessionsPlaceholder": "p. ej. 4 (0 = sin límite)",
            "quick.placeholder": "Nombre de la tarea…",
            "dialog.noTaskTitle": "No hay tarea seleccionada",
            "dialog.noTaskInfo": "Selecciona primero una tarea de la lista 📋 Tareas.",
            "dialog.deleteTitle": "¿Eliminar la tarea “%@”?",
            "dialog.deleteInfo": "La sesión actual de esta tarea se detendrá.",
            "dialog.deleteConfirm": "Eliminar",
            "notif.workDone": "🍅 ¡Pomodoro completado!",
            "notif.breakStart.short": "¡Hora de un descanso corto! 💪",
            "notif.breakStart.long": "¡Hora de un descanso largo! 💪",
            "notif.breakDone": "☕ Descanso terminado",
            "notif.breakDoneBody": "¡De vuelta al trabajo — siguiente pomodoro!",
            "notif.taskDone": "¡Tarea completada!",
            "notif.taskDoneBody": "Todos los pomodoros de esta tarea terminados. 🎉",
            "prompt.title": "🍅 ¡Pomodoro terminado!",
            "prompt.message": "¿Qué hacemos ahora?",
            "prompt.break": "☕ Descanso",
            "prompt.newTask": "📋 Nueva tarea",
            "prompt.continue": "▶ Continuar",
            "routine.title": "📅 Rutina diaria",
            "routine.progress": "Rutina: %d/%d hechas",
            "routine.todoPrefix": "TODO ",
            "routine.add": "➕ Añadir a la rutina…",
            "routine.empty": "Sin elementos — añade el primero",
            "routine.markDone": "✓ Marcar como hecha",
            "routine.unmark": "↩ Desmarcar",
            "routine.focus": "▶ Enfocar esta tarea",
            "routine.delete": "🗑 Eliminar",
            "routine.deleteTitle": "¿Eliminar el elemento “%@” de la rutina?",
            "routine.deleteInfo": "Se eliminará de tu rutina diaria.",
            "autostart.title": "🚀 Iniciar al iniciar sesión",
            "autostart.error": "No se pudo cambiar el inicio al iniciar sesión: %@",
            "about.github": "Abrir el repositorio de GitHub",
        ],
        "fr": [
            "focus.work": "🍅 Focus : %@ (%d min)",
            "focus.break.short": "☕ Pause courte",
            "focus.break.long": "☕ Pause longue",
            "focus.sessions": " · pomodoro %d/%d",
            "progress.remaining": "Restant : %@ / %@",
            "progress.elapsed": "Écoulé : %@",
            "progress.count": "Pomodoros terminés : %d",
            "timer.start": "▶ Démarrer",
            "timer.resume": "▶ Reprendre",
            "timer.pause": "⏸ Pause",
            "timer.stop": "⏹ Arrêter",
            "timer.skipBreak": "✋ Terminer la pause",
            "recent.header": "🕘 Récents :",
            "tasks.title": "📋 Tâches",
            "tasks.add": "➕ Ajouter une tâche…",
            "tasks.empty": "Aucune tâche — ajoutez la première",
            "tasks.edit": "✏️ Modifier la tâche sélectionnée…",
            "tasks.delete": "🗑 Supprimer la tâche sélectionnée…",
            "tasks.item": "🍅 %@ · %d min",
            "tasks.noteMark": " 📝",
            "settings.title": "⚙️ Réglages",
            "settings.work": "Durée de travail",
            "settings.shortBreak": "Pause courte",
            "settings.longBreak": "Pause longue",
            "settings.language": "🌐 Langue",
            "changelog.show": "📝 Voir le changelog",
            "changelog.error": "Impossible d'ouvrir la note",
            "changelog.errorInfo": "Réglages système -> Confidentialité et sécurité -> Automatisation : autorisez l'app à contrôler Notes.",
            "changelog.tip": "Astuce : si l'app n'apparaît pas dans Automatisation, déplacez PomodoroBar.app vers /Applications et relancez-la.",
            "changelog.openSettings": "Ouvrir les réglages",
            "stats.title": "📊 Statistiques",
            "stats.today": "Aujourd'hui : %@",
            "stats.week": "Cette semaine : %@",
            "stats.month": "Ce mois-ci : %@",
            "stats.byTask": "Par tâche (cette semaine) :",
            "stats.empty": "Pas encore de données — terminez une session",
            "stats.rangeDay": "Jour",
            "stats.rangeWeek": "Semaine",
            "stats.rangeMonth": "Mois",
            "stats.total": "Total : %@",
            "stats.taskColumn": "Tâche",
            "stats.timeColumn": "Temps",
            "settings.sounds": "🔔 Son à la fin de la session",
            "info": "🍅 Pomodoro Bar · v1.5.0",
            "menu.quit": "Quitter",
            "dialog.addTitle": "Nouvelle tâche",
            "dialog.editTitle": "Modifier la tâche",
            "dialog.addConfirm": "Ajouter",
            "dialog.save": "Enregistrer",
            "dialog.cancel": "Annuler",
            "dialog.info": "Saisissez un nom, une durée et éventuellement une description.",
            "dialog.nameLabel": "Nom de la tâche :",
            "dialog.namePlaceholder": "ex. Rapport mensuel",
            "dialog.minutesLabel": "Durée (minutes) :",
            "dialog.minutesPlaceholder": "ex. 25",
            "dialog.noteLabel": "Description / notes (facultatif) :",
            "dialog.routineCheck": "Fait partie de ma routine quotidienne",
            "dialog.sessionsLabel": "Pomodoros pour cette tâche (0 = sans limite) :",
            "dialog.sessionsPlaceholder": "ex. 4 (0 = sans limite)",
            "quick.placeholder": "Nom de la tâche…",
            "dialog.noTaskTitle": "Aucune tâche sélectionnée",
            "dialog.noTaskInfo": "Sélectionnez d'abord une tâche dans la liste 📋 Tâches.",
            "dialog.deleteTitle": "Supprimer la tâche « %@ » ?",
            "dialog.deleteInfo": "La session actuelle de cette tâche sera arrêtée.",
            "dialog.deleteConfirm": "Supprimer",
            "notif.workDone": "🍅 Pomodoro terminé !",
            "notif.breakStart.short": "C'est l'heure d'une pause courte. 💪",
            "notif.breakStart.long": "C'est l'heure d'une pause longue. 💪",
            "notif.breakDone": "☕ Pause terminée",
            "notif.breakDoneBody": "Retour au travail — prochain pomodoro !",
            "notif.taskDone": "Tâche terminée !",
            "notif.taskDoneBody": "Tous les pomodoros de cette tâche sont terminés. 🎉",
            "prompt.title": "🍅 Pomodoro terminé !",
            "prompt.message": "Et maintenant ?",
            "prompt.break": "☕ Pause",
            "prompt.newTask": "📋 Nouvelle tâche",
            "prompt.continue": "▶ Continuer",
            "routine.title": "📅 Routine quotidienne",
            "routine.progress": "Routine : %d/%d terminées",
            "routine.todoPrefix": "TODO ",
            "routine.add": "➕ Ajouter à la routine…",
            "routine.empty": "Aucun élément — ajoutez le premier",
            "routine.markDone": "✓ Marquer comme terminée",
            "routine.unmark": "↩ Annuler",
            "routine.focus": "▶ Se concentrer sur cette tâche",
            "routine.delete": "🗑 Supprimer",
            "routine.deleteTitle": "Supprimer l'élément « %@ » de la routine ?",
            "routine.deleteInfo": "Il sera retiré de votre routine quotidienne.",
            "autostart.title": "🚀 Lancer à la connexion",
            "autostart.error": "Impossible de modifier le lancement à la connexion : %@",
            "about.github": "Ouvrir le dépôt GitHub",
        ],
        "it": [
            "focus.work": "🍅 Focus: %@ (%d min)",
            "focus.break.short": "☕ Pausa breve",
            "focus.break.long": "☕ Pausa lunga",
            "focus.sessions": " · pomodoro %d/%d",
            "progress.remaining": "Rimanente: %@ / %@",
            "progress.elapsed": "Trascorso: %@",
            "progress.count": "Pomodori completati: %d",
            "timer.start": "▶ Avvia",
            "timer.resume": "▶ Riprendi",
            "timer.pause": "⏸ Pausa",
            "timer.stop": "⏹ Ferma",
            "timer.skipBreak": "✋ Termina pausa",
            "recent.header": "🕘 Recenti:",
            "tasks.title": "📋 Attività",
            "tasks.add": "➕ Aggiungi attività…",
            "tasks.empty": "Nessuna attività — aggiungine una",
            "tasks.edit": "✏️ Modifica attività selezionata…",
            "tasks.delete": "🗑 Elimina attività selezionata…",
            "tasks.item": "🍅 %@ · %d min",
            "tasks.noteMark": " 📝",
            "settings.title": "⚙️ Impostazioni",
            "settings.work": "Durata lavoro",
            "settings.shortBreak": "Pausa breve",
            "settings.longBreak": "Pausa lunga",
            "settings.language": "🌐 Lingua",
            "changelog.show": "📝 Mostra changelog",
            "changelog.error": "Impossibile aprire la nota",
            "changelog.errorInfo": "Impostazioni di sistema -> Privacy e sicurezza -> Automazione: consenti all'app di controllare Note.",
            "changelog.tip": "Suggerimento: se non vedi l'app in Automazione, sposta PomodoroBar.app in /Applications e riavviala.",
            "changelog.openSettings": "Apri impostazioni",
            "stats.title": "📊 Statistiche",
            "stats.today": "Oggi: %@",
            "stats.week": "Questa settimana: %@",
            "stats.month": "Questo mese: %@",
            "stats.byTask": "Per attività (questa settimana):",
            "stats.empty": "Nessun dato — completa una sessione",
            "stats.rangeDay": "Giorno",
            "stats.rangeWeek": "Settimana",
            "stats.rangeMonth": "Mese",
            "stats.total": "Totale: %@",
            "stats.taskColumn": "Attività",
            "stats.timeColumn": "Tempo",
            "settings.sounds": "🔔 Suono a fine sessione",
            "info": "🍅 Pomodoro Bar · v1.5.0",
            "menu.quit": "Esci",
            "dialog.addTitle": "Nuova attività",
            "dialog.editTitle": "Modifica attività",
            "dialog.addConfirm": "Aggiungi",
            "dialog.save": "Salva",
            "dialog.cancel": "Annulla",
            "dialog.info": "Inserisci nome, durata ed eventualmente una descrizione.",
            "dialog.nameLabel": "Nome attività:",
            "dialog.namePlaceholder": "es. Rapporto mensile",
            "dialog.minutesLabel": "Durata (minuti):",
            "dialog.minutesPlaceholder": "es. 25",
            "dialog.noteLabel": "Descrizione / note (facoltativo):",
            "dialog.routineCheck": "Fa parte della mia routine giornaliera",
            "dialog.sessionsLabel": "Pomodori per questa attività (0 = nessun limite):",
            "dialog.sessionsPlaceholder": "es. 4 (0 = nessun limite)",
            "quick.placeholder": "Nome attività…",
            "dialog.noTaskTitle": "Nessuna attività selezionata",
            "dialog.noTaskInfo": "Seleziona prima un'attività dall'elenco 📋 Attività.",
            "dialog.deleteTitle": "Eliminare l'attività “%@”?",
            "dialog.deleteInfo": "La sessione corrente di questa attività verrà interrotta.",
            "dialog.deleteConfirm": "Elimina",
            "notif.workDone": "🍅 Pomodoro completato!",
            "notif.breakStart.short": "È ora di una pausa breve. 💪",
            "notif.breakStart.long": "È ora di una pausa lunga. 💪",
            "notif.breakDone": "☕ Pausa terminata",
            "notif.breakDoneBody": "Torna al lavoro — prossimo pomodoro!",
            "notif.taskDone": "Attività completata!",
            "notif.taskDoneBody": "Tutti i pomodori di questa attività sono completati. 🎉",
            "prompt.title": "🍅 Pomodoro completato!",
            "prompt.message": "E adesso?",
            "prompt.break": "☕ Pausa",
            "prompt.newTask": "📋 Nuova attività",
            "prompt.continue": "▶ Continua",
            "routine.title": "📅 Routine giornaliera",
            "routine.progress": "Routine: %d/%d completate",
            "routine.todoPrefix": "TODO ",
            "routine.add": "➕ Aggiungi alla routine…",
            "routine.empty": "Nessun elemento — aggiungine uno",
            "routine.markDone": "✓ Segna come completata",
            "routine.unmark": "↩ Annulla",
            "routine.focus": "▶ Concentrati su questa attività",
            "routine.delete": "🗑 Elimina",
            "routine.deleteTitle": "Eliminare l'elemento “%@” dalla routine?",
            "routine.deleteInfo": "Verrà rimosso dalla tua routine giornaliera.",
            "autostart.title": "🚀 Avvia all'accesso",
            "autostart.error": "Impossibile modificare l'avvio all'accesso: %@",
            "about.github": "Apri il repository GitHub",
        ],
        "ar": [
            "focus.work": "🍅 التركيز: %@ (%d دقيقة)",
            "focus.break.short": "☕ استراحة قصيرة",
            "focus.break.long": "☕ استراحة طويلة",
            "focus.sessions": " · pomodoro %d/%d",
            "progress.remaining": "المتبقي: %@ / %@",
            "progress.elapsed": "المنقضي: %@",
            "progress.count": "بومودورو المكتملة: %d",
            "timer.start": "▶ ابدأ",
            "timer.resume": "▶ استئناف",
            "timer.pause": "⏸ إيقاف مؤقت",
            "timer.stop": "⏹ إيقاف",
            "timer.skipBreak": "✋ إنهاء الاستراحة",
            "recent.header": "🕘 الأخيرة:",
            "tasks.title": "📋 المهام",
            "tasks.add": "➕ إضافة مهمة…",
            "tasks.empty": "لا توجد مهام — أضف أول مهمة",
            "tasks.edit": "✏️ تعديل المهمة المحددة…",
            "tasks.delete": "🗑 حذف المهمة المحددة…",
            "tasks.item": "🍅 %@ · %d دقيقة",
            "tasks.noteMark": " 📝",
            "settings.title": "⚙️ الإعدادات",
            "settings.work": "مدة العمل",
            "settings.shortBreak": "استراحة قصيرة",
            "settings.longBreak": "استراحة طويلة",
            "settings.language": "🌐 اللغة",
            "changelog.show": "📝 عرض سجل التغييرات",
            "changelog.error": "تعذّر فتح الملاحظة",
            "changelog.errorInfo": "إعدادات النظام -> الخصوصية والأمان -> الأتمتة: اسمح للتطبيق بالتحكم في الملاحظات.",
            "changelog.tip": "تلميح: إذا لم تظهر التطبيق في الأتمتة، انقل PomodoroBar.app إلى /Applications وأعد تشغيله.",
            "changelog.openSettings": "فتح الإعدادات",
            "stats.title": "📊 الإحصائيات",
            "stats.today": "اليوم: %@",
            "stats.week": "هذا الأسبوع: %@",
            "stats.month": "هذا الشهر: %@",
            "stats.byTask": "حسب المهمة (هذا الأسبوع):",
            "stats.empty": "لا توجد بيانات بعد — أكمل جلسة",
            "stats.rangeDay": "يوم",
            "stats.rangeWeek": "أسبوع",
            "stats.rangeMonth": "شهر",
            "stats.total": "الإجمالي: %@",
            "stats.taskColumn": "المهمة",
            "stats.timeColumn": "الوقت",
            "settings.sounds": "🔔 صوت عند انتهاء الجلسة",
            "info": "🍅 بومودورو بار · v1.5.0",
            "menu.quit": "إنهاء",
            "dialog.addTitle": "مهمة جديدة",
            "dialog.editTitle": "تعديل المهمة",
            "dialog.addConfirm": "إضافة",
            "dialog.save": "حفظ",
            "dialog.cancel": "إلغاء",
            "dialog.info": "أدخل الاسم والمدة ووصفًا اختياريًا.",
            "dialog.nameLabel": "اسم المهمة:",
            "dialog.namePlaceholder": "مثال: تقرير شهري",
            "dialog.minutesLabel": "المدة (بالدقائق):",
            "dialog.minutesPlaceholder": "مثال: 25",
            "dialog.noteLabel": "الوصف / ملاحظات (اختياري):",
            "dialog.routineCheck": "جزء من روتيني اليومي",
            "dialog.sessionsLabel": "بومودورو لهذه المهمة (0 = بدون حد):",
            "dialog.sessionsPlaceholder": "مثال: 4 (0 = بدون حد)",
            "quick.placeholder": "اسم المهمة…",
            "dialog.noTaskTitle": "لم يتم تحديد مهمة",
            "dialog.noTaskInfo": "اختر مهمة من قائمة 📋 المهام أولًا.",
            "dialog.deleteTitle": "حذف المهمة «%@»؟",
            "dialog.deleteInfo": "سيتم إيقاف الجلسة الحالية لهذه المهمة.",
            "dialog.deleteConfirm": "حذف",
            "notif.workDone": "🍅 اكتمل بومودورو!",
            "notif.breakStart.short": "حان وقت استراحة قصيرة. 💪",
            "notif.breakStart.long": "حان وقت استراحة طويلة. 💪",
            "notif.breakDone": "☕ انتهت الاستراحة",
            "notif.breakDoneBody": "عُد إلى العمل — بومودورو التالي!",
            "notif.taskDone": "اكتملت المهمة!",
            "notif.taskDoneBody": "اكتملت جميع بومودورو هذه المهمة. 🎉",
            "prompt.title": "🍅 اكتمل بومودورو!",
            "prompt.message": "ماذا بعد؟",
            "prompt.break": "☕ استراحة",
            "prompt.newTask": "📋 مهمة جديدة",
            "prompt.continue": "▶ متابعة",
            "routine.title": "📅 الروتين اليومي",
            "routine.progress": "الروتين: %d/%d مكتملة",
            "routine.todoPrefix": "TODO ",
            "routine.add": "➕ إضافة إلى الروتين…",
            "routine.empty": "لا توجد عناصر — أضف الأول",
            "routine.markDone": "✓ وضع علامة كمكتملة",
            "routine.unmark": "↩ تراجع",
            "routine.focus": "▶ التركيز على هذه المهمة",
            "routine.delete": "🗑 حذف",
            "routine.deleteTitle": "حذف العنصر «%@» من الروتين؟",
            "routine.deleteInfo": "سيتم إزالته من روتينك اليومي.",
            "autostart.title": "🚀 التشغيل عند تسجيل الدخول",
            "autostart.error": "تعذّر تغيير التشغيل عند تسجيل الدخول: %@",
            "about.github": "فتح مستودع GitHub",
        ],
    ]
}

// MARK: - Model

struct Task: Codable {
    var id: UUID
    var name: String
    var durationMinutes: Int
    var note: String?
    var isRoutine: Bool = false
    var routineDone: Bool = false
    var sessionLimit: Int = 0
    var completedSessions: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name, durationMinutes, note, isRoutine, routineDone, sessionLimit, completedSessions
    }

    init(id: UUID, name: String, durationMinutes: Int, note: String? = nil,
         isRoutine: Bool = false, routineDone: Bool = false,
         sessionLimit: Int = 0, completedSessions: Int = 0) {
        self.id = id
        self.name = name
        self.durationMinutes = durationMinutes
        self.note = note
        self.isRoutine = isRoutine
        self.routineDone = routineDone
        self.sessionLimit = sessionLimit
        self.completedSessions = completedSessions
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(UUID.self, forKey: .id)
        name = try c.decode(String.self, forKey: .name)
        durationMinutes = try c.decode(Int.self, forKey: .durationMinutes)
        note = try c.decodeIfPresent(String.self, forKey: .note)
        isRoutine = try c.decodeIfPresent(Bool.self, forKey: .isRoutine) ?? false
        routineDone = try c.decodeIfPresent(Bool.self, forKey: .routineDone) ?? false
        sessionLimit = try c.decodeIfPresent(Int.self, forKey: .sessionLimit) ?? 0
        completedSessions = try c.decodeIfPresent(Int.self, forKey: .completedSessions) ?? 0
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(id, forKey: .id)
        try c.encode(name, forKey: .name)
        try c.encode(durationMinutes, forKey: .durationMinutes)
        try c.encodeIfPresent(note, forKey: .note)
        try c.encode(isRoutine, forKey: .isRoutine)
        try c.encode(routineDone, forKey: .routineDone)
        try c.encode(sessionLimit, forKey: .sessionLimit)
        try c.encode(completedSessions, forKey: .completedSessions)
    }
}

struct SessionRecord: Codable {
    var id: UUID
    var date: String
    var taskID: UUID
    var taskName: String
    var minutes: Int
}

enum Phase {
    case work
    case shortBreak
    case longBreak
}

// MARK: - App Delegate

final class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate, NSTableViewDataSource, NSTableViewDelegate {

    // Persistence keys
    private let defaults = UserDefaults.standard
    private let tasksKey = "pomodoro.tasks"
    private let focusKey = "pomodoro.focusTask"
    private let recentKey = "pomodoro.recentTasks"
    private let workKey = "pomodoro.workMinutes"
    private let shortKey = "pomodoro.shortBreakMinutes"
    private let longKey = "pomodoro.longBreakMinutes"
    private let pomodorosKey = "pomodoro.completedPomodoros"
    private let langKey = "pomodoro.language"
    private let routineDateKey = "pomodoro.routineDate"
    private let soundsKey = "pomodoro.sounds"
    private let historyKey = "pomodoro.history"

    private var tasks: [Task] = []
    private var focusTaskID: UUID?
    private var recentTaskIDs: [UUID] = []
    private var workMinutes = 25
    private var shortBreakMinutes = 5
    private var longBreakMinutes = 15
    private var completedPomodoros = 0
    private var routineDate = ""
    private var soundsEnabled = true
    private var history: [SessionRecord] = []

    // Timer state
    private var phase: Phase = .work
    private var isRunning = false
    private var sessionStart: Date?
    private var accumulated: TimeInterval = 0
    private var breakOverrideMinutes = 0
    private var ticker: Timer?
    private var pulseTimer: Timer?

    // UI references
    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private let menu = NSMenu()
    private var statusBox: NSView!
    private var focusLabel: NSTextField!
    private var remainingLabel: NSTextField!
    private var elapsedLabel: NSTextField!
    private var countLabel: NSTextField!
    private var changelogButton: NSButton!
    private var startPauseItem: NSMenuItem!
    private var stopItem: NSMenuItem!
    private var skipBreakItem: NSMenuItem!
    private var tasksMenuItem: NSMenuItem!
    private var tasksSubmenu: NSMenu!
    private var editTaskItem: NSMenuItem!
    private var deleteTaskItem: NSMenuItem!
    private var statsMenuItem: NSMenuItem!
    private var statsWindow: NSWindow?
    private var statsTable: NSTableView!
    private var totalLabel: NSTextField!
    private var statsData: [(name: String, minutes: Int, sessions: Int)] = []
    private var statsRange = 0
    private var workSubmenu: NSMenu!
    private var shortSubmenu: NSMenu!
    private var longSubmenu: NSMenu!
    private var languageSubmenu: NSMenu!
    private var routineSectionItems: [NSMenuItem] = []
    private var recentHeaderItem: NSMenuItem?
    private var recentItems: [NSMenuItem] = []
    private var infoPanel: NSPanel?
    private var infoPanelTaskID: UUID?
    private var quickTaskItem: NSMenuItem!
    private var quickNameField: NSTextField?
    private var quickMinutesField: NSTextField?

    // MARK: - Lifecycle

    func applicationDidFinishLaunching(_ notification: Notification) {
        loadState()
        setupStatusItem()
        setupMenu()
        resetRoutineIfNeeded()
        refreshStatus()
        let argsLine = CommandLine.arguments.joined(separator: " ")
        logFile("launch args: " + argsLine)
        if CommandLine.arguments.contains("--notes-diag") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.runNotesDiagnostic()
            }
        }
        startTicker()
        requestNotificationPermission()
    }

    // MARK: - Setup

    private func setupStatusItem() {
        statusItem.button?.title = "🍅 00:00"
        statusItem.menu = menu
        menu.delegate = self
    }

    private func makeStatusView() -> NSView {
        let container = NSView(frame: NSRect(x: 0, y: 0, width: 310, height: 122))
        let box = NSView(frame: NSRect(x: 23, y: 0, width: 264, height: 122))
        box.wantsLayer = true
        box.layer?.cornerRadius = 10
        box.layer?.masksToBounds = true
        box.layer?.backgroundColor = NSColor.systemGray.withAlphaComponent(0.09).cgColor
        box.layer?.borderWidth = 1
        box.layer?.borderColor = NSColor.systemGray.withAlphaComponent(0.28).cgColor

        focusLabel = NSTextField(labelWithString: "…")
        focusLabel.frame = NSRect(x: 12, y: 96, width: 240, height: 18)
        focusLabel.font = .boldSystemFont(ofSize: 13)
        box.addSubview(focusLabel)

        remainingLabel = NSTextField(labelWithString: "…")
        remainingLabel.frame = NSRect(x: 12, y: 72, width: 240, height: 16)
        remainingLabel.font = .systemFont(ofSize: 12)
        remainingLabel.textColor = .secondaryLabelColor
        box.addSubview(remainingLabel)

        elapsedLabel = NSTextField(labelWithString: "…")
        elapsedLabel.frame = NSRect(x: 12, y: 50, width: 240, height: 16)
        elapsedLabel.font = .systemFont(ofSize: 12)
        elapsedLabel.textColor = .secondaryLabelColor
        box.addSubview(elapsedLabel)

        countLabel = NSTextField(labelWithString: "…")
        countLabel.frame = NSRect(x: 12, y: 28, width: 240, height: 16)
        countLabel.font = .systemFont(ofSize: 12)
        countLabel.textColor = .secondaryLabelColor
        box.addSubview(countLabel)

        changelogButton = NSButton(title: "", target: self, action: #selector(openNotesChangelog))
        changelogButton.isBordered = false
        changelogButton.frame = NSRect(x: 10, y: 4, width: 244, height: 20)
        changelogButton.alignment = .left
        let attrs: [NSAttributedString.Key: Any] = [
            .font: NSFont.systemFont(ofSize: 12),
            .foregroundColor: NSColor.systemBlue
        ]
        changelogButton.attributedTitle = NSAttributedString(string: L10n.t("changelog.show"), attributes: attrs)
        changelogButton.isEnabled = false
        box.addSubview(changelogButton)

        container.addSubview(box)
        statusBox = box
        return container
    }

    private func setupMenu() {
        menu.removeAllItems()

        let statusMenuItem = NSMenuItem()
        statusMenuItem.view = makeStatusView()
        menu.addItem(statusMenuItem)

        menu.addItem(.separator())

        quickTaskItem = makeQuickTaskItem()
        menu.addItem(quickTaskItem)

        menu.addItem(.separator())

        startPauseItem = NSMenuItem(title: L10n.t("timer.start"), action: #selector(toggleStartPause), keyEquivalent: "")
        startPauseItem.target = self
        menu.addItem(startPauseItem)

        stopItem = NSMenuItem(title: L10n.t("timer.stop"), action: #selector(stopSession), keyEquivalent: "")
        stopItem.target = self
        menu.addItem(stopItem)

        skipBreakItem = NSMenuItem(title: L10n.t("timer.skipBreak"), action: #selector(skipBreak), keyEquivalent: "")
        skipBreakItem.target = self
        skipBreakItem.isHidden = true
        menu.addItem(skipBreakItem)

        menu.addItem(.separator())

        menu.addItem(makeStepperItem(label: "5 min", delta: 5))
        menu.addItem(makeStepperItem(label: "10 min", delta: 10))

        menu.addItem(.separator())

        tasksMenuItem = NSMenuItem(title: L10n.t("tasks.title"), action: nil, keyEquivalent: "")
        tasksSubmenu = NSMenu()
        tasksMenuItem.submenu = tasksSubmenu
        menu.addItem(tasksMenuItem)

        statsMenuItem = NSMenuItem(title: L10n.t("stats.title"), action: #selector(showStatsWindow), keyEquivalent: "")
        statsMenuItem.target = self
        menu.addItem(statsMenuItem)





        menu.addItem(.separator())

        let settingsItem = NSMenuItem(title: L10n.t("settings.title"), action: nil, keyEquivalent: "")
        let settingsMenu = NSMenu()

        workSubmenu = NSMenu()
        let workItem = NSMenuItem(title: L10n.t("settings.work"), action: nil, keyEquivalent: "")
        workItem.submenu = workSubmenu
        settingsMenu.addItem(workItem)

        shortSubmenu = NSMenu()
        let shortItem = NSMenuItem(title: L10n.t("settings.shortBreak"), action: nil, keyEquivalent: "")
        shortItem.submenu = shortSubmenu
        settingsMenu.addItem(shortItem)

        longSubmenu = NSMenu()
        let longItem = NSMenuItem(title: L10n.t("settings.longBreak"), action: nil, keyEquivalent: "")
        longItem.submenu = longSubmenu
        settingsMenu.addItem(longItem)

        languageSubmenu = NSMenu()
        let languageItem = NSMenuItem(title: L10n.t("settings.language"), action: nil, keyEquivalent: "")
        languageItem.submenu = languageSubmenu
        settingsMenu.addItem(languageItem)

        let autostartItem = NSMenuItem(title: L10n.t("autostart.title"), action: #selector(toggleLaunchAtLogin), keyEquivalent: "")
        autostartItem.target = self
        autostartItem.state = isLaunchAtLoginEnabled ? .on : .off
        settingsMenu.addItem(autostartItem)

        let soundsItem = NSMenuItem(title: L10n.t("settings.sounds"), action: #selector(toggleSounds), keyEquivalent: "")
        soundsItem.target = self
        soundsItem.state = soundsEnabled ? .on : .off
        settingsMenu.addItem(soundsItem)

        settingsItem.submenu = settingsMenu
        menu.addItem(settingsItem)

        menu.addItem(.separator())

        let infoItem = NSMenuItem(title: L10n.t("info"), action: #selector(openGitHub), keyEquivalent: "")
        infoItem.target = self
        infoItem.toolTip = L10n.t("about.github")
        menu.addItem(infoItem)

        menu.addItem(.separator())

        let quitItem = NSMenuItem(title: L10n.t("menu.quit"), action: #selector(quitApp), keyEquivalent: "")
        quitItem.target = self
        menu.addItem(quitItem)

        buildTasksMenu()
        buildDurationMenus()
        buildLanguageMenu()
        rebuildRoutineSection()
        rebuildRecentSection()
        refreshStatus()
    }

    private func buildTasksMenu() {
        tasksSubmenu.removeAllItems()
        if tasks.isEmpty {
            let empty = NSMenuItem(title: L10n.t("tasks.empty"), action: nil, keyEquivalent: "")
            empty.isEnabled = false
            tasksSubmenu.addItem(empty)
        } else {
            for task in tasks {
                let noteMark = (task.note?.isEmpty == false) ? L10n.t("tasks.noteMark") : ""
                let routineMark = task.isRoutine ? " 📅" : ""
                var itemTitle = L10n.t("tasks.item", task.name, task.durationMinutes) + noteMark + routineMark
                if isDoneToday(task) {
                    itemTitle = "✅ " + itemTitle
                } else if task.sessionLimit > 0 {
                    itemTitle += L10n.t("focus.sessions", task.completedSessions, task.sessionLimit)
                }

                let item = NSMenuItem(title: itemTitle, action: nil, keyEquivalent: "")
                item.representedObject = task.id
                item.toolTip = (task.note?.isEmpty == false) ? task.note : nil
                item.state = (task.id == focusTaskID) ? .on : .off

                let sub = NSMenu()
                let focusItem = NSMenuItem(title: L10n.t("routine.focus"), action: #selector(focusTask(_:)), keyEquivalent: "")
                focusItem.target = self
                focusItem.representedObject = task.id
                sub.addItem(focusItem)

                let editItem = NSMenuItem(title: L10n.t("tasks.edit"), action: #selector(editTaskByID(_:)), keyEquivalent: "")
                editItem.target = self
                editItem.representedObject = task.id
                sub.addItem(editItem)

                let deleteItem = NSMenuItem(title: L10n.t("routine.delete"), action: #selector(deleteTaskByID(_:)), keyEquivalent: "")
                deleteItem.target = self
                deleteItem.representedObject = task.id
                sub.addItem(deleteItem)

                item.submenu = sub
                tasksSubmenu.addItem(item)
            }
        }
        tasksSubmenu.addItem(.separator())
        let addItem = NSMenuItem(title: L10n.t("tasks.add"), action: #selector(addTask), keyEquivalent: "")
        addItem.target = self
        tasksSubmenu.addItem(addItem)
    }

    private func buildDurationMenus() {
        workSubmenu.removeAllItems()
        for m in [15, 20, 25, 30, 45, 60] {
            let item = NSMenuItem(title: "\(m) min", action: #selector(setWorkDuration(_:)), keyEquivalent: "")
            item.target = self
            item.representedObject = m
            item.state = (m == workMinutes) ? .on : .off
            workSubmenu.addItem(item)
        }
        shortSubmenu.removeAllItems()
        for m in [3, 5, 10, 15] {
            let item = NSMenuItem(title: "\(m) min", action: #selector(setShortDuration(_:)), keyEquivalent: "")
            item.target = self
            item.representedObject = m
            item.state = (m == shortBreakMinutes) ? .on : .off
            shortSubmenu.addItem(item)
        }
        longSubmenu.removeAllItems()
        for m in [10, 15, 20, 30] {
            let item = NSMenuItem(title: "\(m) min", action: #selector(setLongDuration(_:)), keyEquivalent: "")
            item.target = self
            item.representedObject = m
            item.state = (m == longBreakMinutes) ? .on : .off
            longSubmenu.addItem(item)
        }
    }

    private func buildLanguageMenu() {
        languageSubmenu.removeAllItems()
        for code in L10n.supported {
            let item = NSMenuItem(title: L10n.nativeNames[code] ?? code,
                                  action: #selector(setLanguage(_:)), keyEquivalent: "")
            item.target = self
            item.representedObject = code
            item.state = (code == L10n.lang) ? .on : .off
            languageSubmenu.addItem(item)
        }
    }

    // MARK: - Statystyki

    private var weekStartString: String {
        let cal = Calendar(identifier: .gregorian)
        let start = cal.startOfDay(for: Date())
        let weekday = cal.component(.weekday, from: start)
        let daysSinceMonday = (weekday + 5) % 7
        let monday = cal.date(byAdding: .day, value: -daysSinceMonday, to: start) ?? start
        return Self.dateString(monday)
    }

    private var monthPrefix: String {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM"
        return f.string(from: Date())
    }

    private func formatMinutes(_ m: Int) -> String {
        if m < 60 { return "\(m) min" }
        let h = m / 60
        let rem = m % 60
        if rem == 0 { return "\(h) h" }
        return "\(h) h \(rem) min"
    }

    @objc private func showStatsWindow() {
        if let w = statsWindow {
            refreshStatsWindow()
            w.makeKeyAndOrderFront(nil)
            NSApp.activate(ignoringOtherApps: true)
            return
        }

        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 520, height: 380),
                              styleMask: [.titled, .closable, .resizable],
                              backing: .buffered, defer: false)
        window.title = L10n.t("stats.title")
        window.isReleasedWhenClosed = false
        window.center()

        let content = NSView(frame: NSRect(x: 0, y: 0, width: 520, height: 380))
        window.contentView = content

        let seg = NSSegmentedControl(labels: [L10n.t("stats.rangeDay"), L10n.t("stats.rangeWeek"), L10n.t("stats.rangeMonth")],
                                     trackingMode: .selectOne, target: self, action: #selector(statsRangeChanged(_:)))
        seg.selectedSegment = statsRange
        seg.frame = NSRect(x: 16, y: 344, width: 300, height: 24)
        content.addSubview(seg)

        totalLabel = NSTextField(labelWithString: "")
        totalLabel.frame = NSRect(x: 330, y: 348, width: 174, height: 18)
        totalLabel.alignment = .right
        totalLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        content.addSubview(totalLabel)

        let scroll = NSScrollView(frame: NSRect(x: 16, y: 16, width: 488, height: 316))
        scroll.hasVerticalScroller = true
        scroll.borderType = .bezelBorder
        scroll.autohidesScrollers = true

        let table = NSTableView(frame: NSRect(x: 0, y: 0, width: 488, height: 316))
        let colTask = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("task"))
        colTask.title = L10n.t("stats.taskColumn")
        colTask.width = 350
        table.addTableColumn(colTask)
        let colTime = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("time"))
        colTime.title = L10n.t("stats.timeColumn")
        colTime.width = 120
        table.addTableColumn(colTime)
        table.usesAlternatingRowBackgroundColors = true
        table.delegate = self
        table.dataSource = self
        scroll.documentView = table
        content.addSubview(scroll)

        statsTable = table
        statsWindow = window
        refreshStatsWindow()
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    @objc private func statsRangeChanged(_ sender: NSSegmentedControl) {
        statsRange = sender.selectedSegment
        refreshStatsWindow()
    }

    private func refreshStatsWindow() {
        var records: [SessionRecord]
        switch statsRange {
        case 0:
            records = history.filter { $0.date == Self.dateString(Date()) }
        case 1:
            records = history.filter { $0.date >= weekStartString }
        default:
            records = history.filter { $0.date.hasPrefix(monthPrefix) }
        }
        let grouped = Dictionary(grouping: records, by: { $0.taskName })
        statsData = grouped.map { (name: $0.key, minutes: $0.value.reduce(0) { $0 + $1.minutes }, sessions: $0.value.count) }
            .sorted { $0.minutes > $1.minutes }
        let total = statsData.reduce(0) { $0 + $1.minutes }
        totalLabel?.stringValue = L10n.t("stats.total", formatMinutes(total))
        statsTable?.reloadData()
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        statsData.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard row < statsData.count else { return nil }
        let colID = tableColumn?.identifier.rawValue ?? "task"
        let reuseID = NSUserInterfaceItemIdentifier(colID)
        var cell = tableView.makeView(withIdentifier: reuseID, owner: self) as? NSTextField
        if cell == nil {
            cell = NSTextField(labelWithString: "")
            cell?.identifier = reuseID
        }
        let item = statsData[row]
        if colID == "time" {
            cell?.stringValue = formatMinutes(item.minutes)
            cell?.alignment = .right
        } else {
            cell?.stringValue = "🍅 \(item.name) · \(item.sessions)×"
            cell?.alignment = .left
        }
        return cell
    }

    // MARK: - Codzienna rutyna

    private var routineTasks: [Task] {
        tasks.filter { $0.isRoutine }
    }

    private func isDoneToday(_ task: Task) -> Bool {
        if task.isRoutine && task.routineDone { return true }
        return task.sessionLimit > 0 && task.completedSessions >= task.sessionLimit
    }

    private func rebuildRoutineSection() {
        for item in routineSectionItems {
            menu.removeItem(item)
        }
        routineSectionItems = []

        let routine = routineTasks
        guard !routine.isEmpty, let anchor = tasksMenuItem else { return }

        func insertIndex() -> Int {
            menu.items.firstIndex(of: anchor) ?? menu.items.count
        }

        let separator = NSMenuItem.separator()
        menu.insertItem(separator, at: insertIndex())
        routineSectionItems.append(separator)

        let doneCount = routine.filter { isDoneToday($0) }.count
        let header = NSMenuItem(title: "\(L10n.t("routine.title"))  ·  \(doneCount)/\(routine.count)",
                                action: nil, keyEquivalent: "")
        header.isEnabled = false
        menu.insertItem(header, at: insertIndex())
        routineSectionItems.append(header)

        for task in routine {
            let item = makeRoutineTaskItem(task)
            menu.insertItem(item, at: insertIndex())
            routineSectionItems.append(item)
        }

        let trailingSeparator = NSMenuItem.separator()
        menu.insertItem(trailingSeparator, at: insertIndex())
        routineSectionItems.append(trailingSeparator)
    }

    private func makeRoutineTaskItem(_ task: Task) -> NSMenuItem {
        let minutes = " · \(task.durationMinutes) min"
        let item = NSMenuItem(title: "", action: #selector(focusTask(_:)), keyEquivalent: "")
        item.target = self
        item.representedObject = task.id
        item.toolTip = (task.note?.isEmpty == false) ? task.note : nil
        if isDoneToday(task) {
            item.attributedTitle = NSAttributedString(string: "✅ \(task.name)\(minutes)", attributes: [
                .font: NSFont.systemFont(ofSize: 13),
                .foregroundColor: NSColor.systemGreen
            ])
        } else {
            let title = "⬜ \(L10n.t("routine.todoPrefix"))\(task.name)\(minutes)"
            item.attributedTitle = NSAttributedString(string: title, attributes: [
                .font: NSFont.boldSystemFont(ofSize: 13),
                .foregroundColor: NSColor.systemRed
            ])
        }
        return item
    }

    private func selectTask(_ id: UUID) {
        focusTaskID = id
        saveTasks()
        touchRecent(id)
        buildTasksMenu()
        rebuildRoutineSection()
        refreshStatus()
        if let task = tasks.first(where: { $0.id == id }), task.note?.isEmpty == false {
            showTaskInfoPopup(task)
        }
    }

    private func markRoutineDoneIfDue() {
        guard phase == .work, let id = focusTaskID,
              let idx = tasks.firstIndex(where: { $0.id == id }),
              tasks[idx].isRoutine, !tasks[idx].routineDone else { return }
        let quarter = Double(tasks[idx].durationMinutes) * 60.0 * 0.25
        if elapsed() >= quarter {
            tasks[idx].routineDone = true
            saveTasks()
            rebuildRoutineSection()
        }
    }

    private func resetRoutineIfNeeded() {
        let today = Self.dateString(Date())
        if routineDate != today {
            routineDate = today
            defaults.set(routineDate, forKey: routineDateKey)
            var changed = false
            for i in tasks.indices {
                if tasks[i].isRoutine && tasks[i].routineDone {
                    tasks[i].routineDone = false
                    changed = true
                }
                if tasks[i].completedSessions != 0 {
                    tasks[i].completedSessions = 0
                    changed = true
                }
            }
            if changed {
                saveTasks()
                rebuildRoutineSection()
                buildTasksMenu()
            }
        }
    }

    private static func dateString(_ d: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        return f.string(from: d)
    }

    // MARK: - Changelog (Apple Notes)

    private func escapeAppleScript(_ s: String) -> String {
        s.replacingOccurrences(of: "\\", with: "\\\\")
         .replacingOccurrences(of: "\"", with: "\\\"")
    }

    @objc private func openNotesChangelog() {
        guard let task = focusTask, !task.name.isEmpty else { return }
        logFile("openNotesChangelog: task=\(task.name)")
        let name = escapeAppleScript(task.name)
        let script = """
        tell application "Notes"
            set folderName to "🍅 Pomodoro"
            if not (exists folder folderName) then
                make new folder with properties {name:folderName}
            end if
            set targetFolder to folder folderName
            set noteName to "\(name)"
            if (count of (notes of targetFolder whose name is noteName)) = 0 then
                make new note at targetFolder with properties {name:noteName, body:"\(name)"}
            end if
            set targetNote to first note of targetFolder whose name is noteName
            set stamp to (do shell script "date '+%d.%m.%Y %H:%M'")
            set divider to "---- " & stamp
            set noteBody to body of targetNote
            set titleEnd to offset of linefeed in noteBody
            if titleEnd > 0 then
                set noteBody to (text 1 thru titleEnd of noteBody) & divider & linefeed & linefeed & (text (titleEnd + 1) thru -1 of noteBody)
            else
                set noteBody to noteBody & linefeed & divider & linefeed & linefeed
            end if
            set body of targetNote to noteBody
            activate
            set selection to targetNote
        end tell
        """
        runAppleScript(script)
        menu.cancelTracking()
    }

    private func runAppleScript(_ script: String) {
        logFile("runAppleScript script: \n\(script)")
        let p = Process()
        p.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        p.arguments = ["-e", script]
        let errPipe = Pipe()
        p.standardError = errPipe
        p.standardOutput = Pipe()
        do {
            try p.run()
            p.waitUntilExit()
            let errData = errPipe.fileHandleForReading.readDataToEndOfFile()
            if p.terminationStatus != 0 {
                let detail = String(data: errData, encoding: .utf8) ?? ""
                logFile("runAppleScript FAILED (exit \(p.terminationStatus)): \(detail)")
                let alert = NSAlert()
                alert.messageText = L10n.t("changelog.error")
                alert.informativeText = L10n.t("changelog.tip") + "\n\n" + L10n.t("changelog.errorInfo") + "\n\n" + detail
                alert.addButton(withTitle: "OK")
                alert.addButton(withTitle: L10n.t("changelog.openSettings"))
                let resp = alert.runModal()
                if resp == .alertSecondButtonReturn,
                   let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Automation") {
                    NSWorkspace.shared.open(url)
                }
            } else {
                logFile("runAppleScript OK")
            }
        } catch {
            let alert = NSAlert()
            alert.messageText = L10n.t("changelog.error")
            alert.informativeText = L10n.t("changelog.errorInfo")
            alert.addButton(withTitle: "OK")
            alert.runModal()
        }
    }

    private func logFile(_ text: String) {
        let path = "/tmp/pomodoro_notes_log.txt"
        let line = "[\(Self.dateTimeString())] \(text)\n"
        if let handle = FileHandle(forWritingAtPath: path) {
            handle.seekToEndOfFile()
            handle.write(line.data(using: .utf8) ?? Data())
            try? handle.close()
        } else {
            try? line.write(toFile: path, atomically: true, encoding: .utf8)
        }
    }

    private static func dateTimeString() -> String {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return f.string(from: Date())
    }

    private func runAppleScriptCapture(_ script: String) -> String {
        let p = Process()
        p.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        p.arguments = ["-e", script]
        let outPipe = Pipe()
        let errPipe = Pipe()
        p.standardOutput = outPipe
        p.standardError = errPipe
        do {
            try p.run()
            p.waitUntilExit()
            let outData = outPipe.fileHandleForReading.readDataToEndOfFile()
            let errData = errPipe.fileHandleForReading.readDataToEndOfFile()
            var result = String(data: outData, encoding: .utf8) ?? ""
            if p.terminationStatus != 0 {
                result += "EXIT:\(p.terminationStatus) " + (String(data: errData, encoding: .utf8) ?? "")
            }
            logFile("runAppleScriptCapture result: \(result)")
            return result
        } catch {
            return "RUN ERROR: \(error.localizedDescription)"
        }
    }

    private func runNotesDiagnostic() {
        let script = """
        set results to ""
        tell application "Notes"
            set folderName to "🍅 Pomodoro"
            if not (exists folder folderName) then
                make new folder with properties {name:folderName}
            end if
            set targetFolder to folder folderName
            set noteName to "DIAG"
            if (count of (notes of targetFolder whose name is noteName)) = 0 then
                make new note at targetFolder with properties {name:noteName, body:"<div>diag</div>"}
            end if
            set targetNote to first note of targetFolder whose name is noteName
            set nid to id of targetNote
            set results to results & "NID: " & nid & linefeed
            try
                set theNote to note id nid
                set results to results & "A NOTE_ID_ACCESSOR: ok " & (name of theNote) & linefeed
            on error ea
                set results to results & "A NOTE_ID_ACCESSOR: " & ea & linefeed
            end try
            try
                set selection to targetNote
                set results to results & "B SELECTION_SET: ok" & linefeed
                delay 1
                set selRef to selection
                set results to results & "B SELECTION_AFTER: " & ((id of selRef) as text) & linefeed
            on error eb
                set results to results & "B SELECTION_SET: " & eb & linefeed
            end try
            try
                set selection to {targetNote}
                set results to results & "C SELECTION_SET_LIST: ok" & linefeed
            on error ec
                set results to results & "C SELECTION_SET_LIST: " & ec & linefeed
            end try
            activate
            return results
        end tell
        """
        let out = runAppleScriptCapture(script)
        let path = "/tmp/pomodoro_notes_diag.txt"
        try? out.write(toFile: path, atomically: true, encoding: .utf8)
        let alert = NSAlert()
        alert.messageText = "Notes diagnostic"
        alert.informativeText = out
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    // MARK: - Autostart i GitHub

    private var isLaunchAtLoginEnabled: Bool {
        if #available(macOS 13.0, *) {
            return SMAppService.mainApp.status == .enabled
        }
        return false
    }

    @objc private func toggleLaunchAtLogin() {
        guard #available(macOS 13.0, *) else { return }
        do {
            if isLaunchAtLoginEnabled {
                try SMAppService.mainApp.unregister()
            } else {
                try SMAppService.mainApp.register()
            }
        } catch {
            let alert = NSAlert()
            alert.messageText = L10n.t("autostart.error", error.localizedDescription)
            alert.addButton(withTitle: "OK")
            alert.runModal()
        }
        setupMenu()
    }

    @objc private func openGitHub() {
        if let url = URL(string: "https://github.com/essmos/PomodoroBar") {
            NSWorkspace.shared.open(url)
        }
    }

    @objc private func toggleSounds() {
        soundsEnabled.toggle()
        defaults.set(soundsEnabled, forKey: soundsKey)
        setupMenu()
    }

    private func playCompletionSound(_ name: String) {
        guard soundsEnabled else { return }
        NSSound(named: name)?.play()
    }

    // MARK: - Ostatnie zadania (szybki wybór)

    private var recentTasks: [Task] {
        recentTaskIDs.compactMap { id in tasks.first { $0.id == id } }
    }

    private func touchRecent(_ id: UUID) {
        recentTaskIDs.removeAll { $0 == id }
        recentTaskIDs.insert(id, at: 0)
        if recentTaskIDs.count > 10 {
            recentTaskIDs.removeLast(recentTaskIDs.count - 10)
        }
        defaults.set(recentTaskIDs.map { $0.uuidString }, forKey: recentKey)
        rebuildRecentSection()
    }

    private func rebuildRecentSection() {
        for item in recentItems {
            menu.removeItem(item)
        }
        if let h = recentHeaderItem {
            menu.removeItem(h)
        }
        recentItems = []
        recentHeaderItem = nil

        let recent = recentTasks
        guard let anchor = tasksMenuItem else { return }
        guard !recent.isEmpty else { return }

        func insertIndex() -> Int {
            menu.items.firstIndex(of: anchor) ?? menu.items.count
        }

        let header = NSMenuItem(title: L10n.t("recent.header"), action: nil, keyEquivalent: "")
        header.isEnabled = false
        menu.insertItem(header, at: insertIndex())
        recentHeaderItem = header

        for task in recent {
            let noteMark = (task.note?.isEmpty == false) ? L10n.t("tasks.noteMark") : ""
            let item = NSMenuItem(title: L10n.t("tasks.item", task.name, task.durationMinutes) + noteMark,
                                  action: #selector(focusTask(_:)), keyEquivalent: "")
            item.target = self
            item.representedObject = task.id
            item.toolTip = (task.note?.isEmpty == false) ? task.note : nil
            item.state = (task.id == focusTaskID) ? .on : .off
            menu.insertItem(item, at: insertIndex())
            recentItems.append(item)
        }
    }

    // MARK: - Szybkie zadanie

    private func makeQuickTaskItem() -> NSMenuItem {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 310, height: 36))

        let bolt = NSTextField(labelWithString: "⚡")
        bolt.frame = NSRect(x: 6, y: 10, width: 22, height: 17)
        view.addSubview(bolt)

        let nameField = NSTextField(frame: NSRect(x: 30, y: 6, width: 130, height: 24))
        nameField.placeholderString = L10n.t("quick.placeholder")
        nameField.font = .systemFont(ofSize: 13)
        nameField.target = self
        nameField.action = #selector(quickStart(_:))
        view.addSubview(nameField)
        quickNameField = nameField

        let minutesField = NSTextField(frame: NSRect(x: 164, y: 6, width: 40, height: 24))
        minutesField.stringValue = "25"
        minutesField.alignment = .center
        minutesField.font = .systemFont(ofSize: 13)
        minutesField.target = self
        minutesField.action = #selector(quickStart(_:))
        view.addSubview(minutesField)
        quickMinutesField = minutesField

        let minLabel = NSTextField(labelWithString: "min")
        minLabel.frame = NSRect(x: 206, y: 10, width: 26, height: 17)
        minLabel.font = .systemFont(ofSize: 12)
        view.addSubview(minLabel)

        let startButton = NSButton(title: L10n.t("timer.start"), target: self, action: #selector(quickStart(_:)))
        startButton.bezelStyle = .rounded
        startButton.controlSize = .small
        startButton.frame = NSRect(x: 236, y: 4, width: 68, height: 26)
        view.addSubview(startButton)

        let item = NSMenuItem()
        item.view = view
        return item
    }

    @objc private func quickStart(_ sender: Any?) {
        let rawName = (quickNameField?.stringValue ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let rawMinutes = quickMinutesField?.integerValue ?? 25
        let minutes = max(1, min(480, rawMinutes == 0 ? 25 : rawMinutes))
        guard !rawName.isEmpty else {
            NSSound.beep()
            return
        }
        let task = Task(id: UUID(), name: rawName, durationMinutes: minutes)
        tasks.append(task)
        focusTaskID = task.id
        saveTasks()
        touchRecent(task.id)
        buildTasksMenu()
        rebuildRoutineSection()
        rebuildRecentSection()
        accumulated = 0
        start()
        quickNameField?.stringValue = ""
        refreshStatus()
        menu.cancelTracking()
    }

    // MARK: - Task actions

    @objc private func addTask() {
        presentTaskDialog(title: L10n.t("dialog.addTitle"), confirm: L10n.t("dialog.addConfirm"),
                          initialName: nil, initialMinutes: workMinutes, initialNote: nil,
                          initialIsRoutine: false, initialSessions: 4) { [weak self] name, minutes, note, isRoutine, sessions in
            guard let self else { return }
            let task = Task(id: UUID(), name: name, durationMinutes: minutes, note: note, isRoutine: isRoutine, sessionLimit: sessions)
            self.tasks.append(task)
            if self.focusTaskID == nil {
                self.focusTaskID = task.id
            }
            self.saveTasks()
            self.touchRecent(task.id)
            self.buildTasksMenu()
            self.rebuildRoutineSection()
            self.refreshStatus()
        }
    }

    @objc private func editFocusTask() {
        guard let id = focusTaskID, let idx = tasks.firstIndex(where: { $0.id == id }) else {
            let alert = NSAlert()
            alert.messageText = L10n.t("dialog.noTaskTitle")
            alert.informativeText = L10n.t("dialog.noTaskInfo")
            alert.addButton(withTitle: "OK")
            alert.runModal()
            return
        }
        let task = tasks[idx]
        presentTaskDialog(title: L10n.t("dialog.editTitle"), confirm: L10n.t("dialog.save"),
                          initialName: task.name, initialMinutes: task.durationMinutes,
                          initialNote: task.note, initialIsRoutine: task.isRoutine,
                          initialSessions: task.sessionLimit) { [weak self] name, minutes, note, isRoutine, sessions in
            guard let self else { return }
            self.tasks[idx].name = name
            self.tasks[idx].durationMinutes = minutes
            self.tasks[idx].note = note
            self.tasks[idx].isRoutine = isRoutine
            self.tasks[idx].sessionLimit = sessions
            self.saveTasks()
            self.buildTasksMenu()
            self.rebuildRoutineSection()
            self.refreshStatus()
        }
    }

    @objc private func editTaskByID(_ sender: NSMenuItem) {
        guard let id = sender.representedObject as? UUID else { return }
        focusTaskID = id
        saveTasks()
        editFocusTask()
    }

    @objc private func deleteTaskByID(_ sender: NSMenuItem) {
        guard let id = sender.representedObject as? UUID,
              let task = tasks.first(where: { $0.id == id }) else { return }
        let alert = NSAlert()
        alert.messageText = L10n.t("dialog.deleteTitle", task.name)
        alert.informativeText = L10n.t("dialog.deleteInfo")
        alert.addButton(withTitle: L10n.t("dialog.deleteConfirm"))
        alert.addButton(withTitle: L10n.t("dialog.cancel"))
        guard alert.runModal() == .alertFirstButtonReturn else { return }
        tasks.removeAll { $0.id == id }
        recentTaskIDs.removeAll { $0 == id }
        defaults.set(recentTaskIDs.map { $0.uuidString }, forKey: recentKey)
        if focusTaskID == id {
            focusTaskID = tasks.first?.id
            stopSession()
        }
        saveTasks()
        buildTasksMenu()
        rebuildRoutineSection()
        rebuildRecentSection()
        refreshStatus()
    }

    @objc private func deleteFocusTask() {
        guard let id = focusTaskID, let task = tasks.first(where: { $0.id == id }) else { return }
        let alert = NSAlert()
        alert.messageText = L10n.t("dialog.deleteTitle", task.name)
        alert.informativeText = L10n.t("dialog.deleteInfo")
        alert.addButton(withTitle: L10n.t("dialog.deleteConfirm"))
        alert.addButton(withTitle: L10n.t("dialog.cancel"))
        guard alert.runModal() == .alertFirstButtonReturn else { return }
        tasks.removeAll { $0.id == id }
        recentTaskIDs.removeAll { $0 == id }
        defaults.set(recentTaskIDs.map { $0.uuidString }, forKey: recentKey)
        if focusTaskID == id {
            focusTaskID = tasks.first?.id
            stopSession()
        }
        saveTasks()
        buildTasksMenu()
        rebuildRoutineSection()
        rebuildRecentSection()
        refreshStatus()
    }

    @objc private func focusTask(_ sender: NSMenuItem) {
        guard let id = sender.representedObject as? UUID else { return }
        selectTask(id)
    }

    @objc private func setLanguage(_ sender: NSMenuItem) {
        guard let code = sender.representedObject as? String else { return }
        L10n.lang = code
        defaults.set(code, forKey: langKey)
        setupMenu()
    }

    // MARK: - Popup z opisem zadania

    private func showTaskInfoPopup(_ task: Task) {
        infoPanel?.close()
        infoPanel = nil

        let panel = NSPanel(contentRect: NSRect(x: 0, y: 0, width: 380, height: 200),
                            styleMask: [.titled, .closable, .nonactivatingPanel],
                            backing: .buffered, defer: false)
        panel.title = "🍅 \(task.name)"
        panel.level = .floating
        panel.isFloatingPanel = true
        panel.hidesOnDeactivate = false
        panel.becomesKeyOnlyIfNeeded = true
        panel.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]

        let content = NSView(frame: NSRect(x: 0, y: 0, width: 380, height: 272))

        let scroll = NSTextView.scrollableTextView()
        scroll.frame = NSRect(x: 16, y: 52, width: 348, height: 204)
        scroll.hasVerticalScroller = true
        scroll.autohidesScrollers = true
        scroll.drawsBackground = false
        let textView = scroll.documentView as! NSTextView
        textView.isEditable = false
        textView.isSelectable = true
        textView.drawsBackground = false
        textView.font = .systemFont(ofSize: 13)
        textView.textContainerInset = NSSize(width: 6, height: 60)
        textView.string = task.note ?? ""
        content.addSubview(scroll)

        let startButton = NSButton(title: "▶ \(L10n.t("timer.start"))",
                                   target: self, action: #selector(startFromInfoPanel(_:)))
        startButton.bezelStyle = .rounded
        startButton.controlSize = .regular
        startButton.keyEquivalent = "\r"
        startButton.frame = NSRect(x: 16, y: 12, width: 348, height: 32)
        content.addSubview(startButton)

        panel.contentView = content

        if let screen = NSScreen.main {
            let vf = screen.visibleFrame
            panel.setFrameOrigin(NSPoint(x: vf.maxX - panel.frame.width - 14,
                                         y: vf.maxY - panel.frame.height - 4))
        }
        panel.orderFrontRegardless()
        infoPanel = panel
        infoPanelTaskID = task.id

        DispatchQueue.main.asyncAfter(deadline: .now() + 12) { [weak self, weak panel] in
            guard let panel, panel.isVisible else { return }
            panel.close()
            if self?.infoPanel === panel {
                self?.infoPanel = nil
                self?.infoPanelTaskID = nil
            }
        }
    }

    @objc private func startFromInfoPanel(_ sender: NSButton) {
        guard let id = infoPanelTaskID else { return }
        infoPanel?.close()
        infoPanel = nil
        infoPanelTaskID = nil

        focusTaskID = id
        saveTasks()
        touchRecent(id)
        buildTasksMenu()
        rebuildRoutineSection()
        refreshStatus()

        if phase != .work { phase = .work }
        accumulated = 0
        start()
        refreshStatus()
        menu.cancelTracking()
    }

    private func presentTaskDialog(title: String, confirm: String, initialName: String?, initialMinutes: Int,
                                   initialNote: String?, initialIsRoutine: Bool, initialSessions: Int,
                                   completion: @escaping (String, Int, String, Bool, Int) -> Void) {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = L10n.t("dialog.info")

        let container = NSView(frame: NSRect(x: 0, y: 0, width: 420, height: 360))

        let nameLabel = NSTextField(labelWithString: L10n.t("dialog.nameLabel"))
        nameLabel.frame = NSRect(x: 0, y: 330, width: 420, height: 17)
        container.addSubview(nameLabel)

        let nameField = NSTextField(frame: NSRect(x: 0, y: 296, width: 420, height: 28))
        nameField.placeholderString = L10n.t("dialog.namePlaceholder")
        nameField.font = .systemFont(ofSize: 14)
        nameField.stringValue = initialName ?? ""
        container.addSubview(nameField)

        let minLabel = NSTextField(labelWithString: L10n.t("dialog.minutesLabel"))
        minLabel.frame = NSRect(x: 0, y: 272, width: 420, height: 17)
        container.addSubview(minLabel)

        let minutesField = NSTextField(frame: NSRect(x: 0, y: 238, width: 420, height: 28))
        minutesField.placeholderString = L10n.t("dialog.minutesPlaceholder")
        minutesField.font = .systemFont(ofSize: 14)
        minutesField.stringValue = String(initialMinutes)
        container.addSubview(minutesField)

        let noteLabel = NSTextField(labelWithString: L10n.t("dialog.noteLabel"))
        noteLabel.frame = NSRect(x: 0, y: 214, width: 420, height: 17)
        container.addSubview(noteLabel)

        let scroll = NSScrollView(frame: NSRect(x: 0, y: 100, width: 420, height: 106))
        scroll.hasVerticalScroller = true
        scroll.borderType = .bezelBorder
        scroll.autohidesScrollers = true
        let contentSize = scroll.contentSize
        let noteView = NSTextView(frame: NSRect(origin: .zero, size: contentSize))
        noteView.minSize = NSSize(width: 0, height: contentSize.height)
        noteView.maxSize = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        noteView.isVerticallyResizable = true
        noteView.isHorizontallyResizable = false
        noteView.autoresizingMask = [.width]
        noteView.isRichText = false
        noteView.font = .systemFont(ofSize: 13)
        noteView.string = initialNote ?? ""
        scroll.documentView = noteView
        container.addSubview(scroll)

        let sessionsLabel = NSTextField(labelWithString: L10n.t("dialog.sessionsLabel"))
        sessionsLabel.frame = NSRect(x: 0, y: 74, width: 420, height: 17)
        container.addSubview(sessionsLabel)

        let sessionsField = NSTextField(frame: NSRect(x: 0, y: 40, width: 420, height: 28))
        sessionsField.placeholderString = L10n.t("dialog.sessionsPlaceholder")
        sessionsField.font = .systemFont(ofSize: 14)
        sessionsField.stringValue = String(initialSessions)
        container.addSubview(sessionsField)

        let routineCheck = NSButton(checkboxWithTitle: L10n.t("dialog.routineCheck"), target: nil, action: nil)
        routineCheck.frame = NSRect(x: 0, y: 12, width: 420, height: 20)
        routineCheck.state = initialIsRoutine ? .on : .off
        container.addSubview(routineCheck)

        alert.accessoryView = container
        alert.window.initialFirstResponder = nameField
        alert.addButton(withTitle: confirm)
        alert.addButton(withTitle: L10n.t("dialog.cancel"))

        guard alert.runModal() == .alertFirstButtonReturn else { return }
        let name = nameField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        let raw = minutesField.integerValue == 0 ? initialMinutes : minutesField.integerValue
        let minutes = max(1, min(480, raw))
        let note = noteView.string.trimmingCharacters(in: .whitespacesAndNewlines)
        let isRoutine = routineCheck.state == .on
        let sessions = max(0, min(99, sessionsField.integerValue))
        guard !name.isEmpty else { return }
        completion(name, minutes, note, isRoutine, sessions)
    }

    // MARK: - Duration settings

    @objc private func setWorkDuration(_ sender: NSMenuItem) {
        guard let m = sender.representedObject as? Int else { return }
        workMinutes = m
        defaults.set(m, forKey: workKey)
        buildDurationMenus()
        refreshStatus()
    }

    @objc private func setShortDuration(_ sender: NSMenuItem) {
        guard let m = sender.representedObject as? Int else { return }
        shortBreakMinutes = m
        defaults.set(m, forKey: shortKey)
        buildDurationMenus()
        refreshStatus()
    }

    @objc private func setLongDuration(_ sender: NSMenuItem) {
        guard let m = sender.representedObject as? Int else { return }
        longBreakMinutes = m
        defaults.set(m, forKey: longKey)
        buildDurationMenus()
        refreshStatus()
    }

    // MARK: - Wydłużanie / skracanie sesji

    private func makeStepperItem(label: String, delta: Int) -> NSMenuItem {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 24))

        let labelField = NSTextField(labelWithString: "⏱️ \(label)")
        labelField.frame = NSRect(x: 8, y: 4, width: 110, height: 17)
        labelField.font = .systemFont(ofSize: 13)
        view.addSubview(labelField)

        let minus = NSButton(title: "−", target: self, action: #selector(adjustDuration(_:)))
        minus.tag = -delta
        minus.bezelStyle = .rounded
        minus.controlSize = .small
        minus.frame = NSRect(x: 126, y: 1, width: 32, height: 22)
        view.addSubview(minus)

        let plus = NSButton(title: "+", target: self, action: #selector(adjustDuration(_:)))
        plus.tag = delta
        plus.bezelStyle = .rounded
        plus.controlSize = .small
        plus.frame = NSRect(x: 162, y: 1, width: 32, height: 22)
        view.addSubview(plus)

        let item = NSMenuItem()
        item.view = view
        return item
    }

    @objc private func adjustDuration(_ sender: NSButton) {
        applyDurationDelta(sender.tag)
    }

    private func applyDurationDelta(_ delta: Int) {
        if phase == .work {
            if let id = focusTaskID, let idx = tasks.firstIndex(where: { $0.id == id }) {
                tasks[idx].durationMinutes = max(1, min(480, tasks[idx].durationMinutes + delta))
                saveTasks()
                buildTasksMenu()
            } else {
                workMinutes = max(1, min(480, workMinutes + delta))
                defaults.set(workMinutes, forKey: workKey)
            }
        } else {
            breakOverrideMinutes = max(-120, min(120, breakOverrideMinutes + delta))
        }
        refreshStatus()
    }

    // MARK: - Timer control

    @objc private func toggleStartPause() {
        if isRunning { pause() } else { start() }
    }

    private func start() {
        isRunning = true
        sessionStart = Date()
        refreshStatus()
    }

    private func pause() {
        guard isRunning else { return }
        accumulated = elapsed()
        isRunning = false
        sessionStart = nil
        refreshStatus()
    }

    @objc private func stopSession() {
        isRunning = false
        sessionStart = nil
        accumulated = 0
        breakOverrideMinutes = 0
        if phase != .work { phase = .work }
        refreshStatus()
    }

    @objc private func skipBreak() {
        phase = .work
        accumulated = 0
        breakOverrideMinutes = 0
        sessionStart = isRunning ? Date() : nil
        refreshStatus()
    }

    // MARK: - Timing

    private func elapsed() -> TimeInterval {
        var t = accumulated
        if isRunning, let s = sessionStart {
            t += Date().timeIntervalSince(s)
        }
        return t
    }

    private var sessionDuration: TimeInterval {
        switch phase {
        case .work: return TimeInterval(max(1, focusTaskMinutes)) * 60
        case .shortBreak: return TimeInterval(max(1, shortBreakMinutes + breakOverrideMinutes)) * 60
        case .longBreak: return TimeInterval(max(1, longBreakMinutes + breakOverrideMinutes)) * 60
        }
    }

    private var focusTaskMinutes: Int {
        if let id = focusTaskID, let t = tasks.first(where: { $0.id == id }) {
            return t.durationMinutes
        }
        return workMinutes
    }

    private var focusTask: Task? {
        guard let id = focusTaskID else { return nil }
        return tasks.first { $0.id == id }
    }

    private var focusTaskName: String {
        if let id = focusTaskID, let t = tasks.first(where: { $0.id == id }) {
            return t.name
        }
        return "—"
    }

    private func format(_ t: TimeInterval) -> String {
        let total = Int(t.rounded(.down))
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        if h > 0 { return String(format: "%d:%02d:%02d", h, m, s) }
        return String(format: "%02d:%02d", m, s)
    }

    private func startTicker() {
        let t = Timer(timeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
        ticker = t
        RunLoop.main.add(t, forMode: .common)
    }

    // MARK: - Delikatne pulsowanie pomidora

    private func updatePulse() {
        if isRunning {
            if pulseTimer == nil {
                startPulse()
            }
        } else {
            stopPulse()
        }
    }

    private func startPulse() {
        let t = Timer(timeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.pulseOnce()
        }
        pulseTimer = t
        RunLoop.main.add(t, forMode: .common)
    }

    private func stopPulse() {
        pulseTimer?.invalidate()
        pulseTimer = nil
        statusItem.button?.alphaValue = 1.0
    }

    private func pulseOnce() {
        guard let button = statusItem.button else { return }
        NSAnimationContext.runAnimationGroup({ ctx in
            ctx.duration = 0.7
            ctx.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            button.animator().alphaValue = 0.75
        }, completionHandler: {
            NSAnimationContext.runAnimationGroup({ ctx in
                ctx.duration = 0.9
                ctx.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                button.animator().alphaValue = 1.0
            }, completionHandler: nil)
        })
    }

    private func tick() {
        guard isRunning else { return }
        markRoutineDoneIfDue()
        if elapsed() >= sessionDuration {
            completeSession()
        }
        refreshStatus()
    }

    private enum SessionChoice {
        case breakNow
        case newTask
        case continueWork
    }

    private func showSessionChoice() -> SessionChoice {
        let alert = NSAlert()
        alert.messageText = L10n.t("prompt.title")
        alert.informativeText = L10n.t("prompt.message")
        alert.addButton(withTitle: L10n.t("prompt.break"))
        alert.addButton(withTitle: L10n.t("prompt.newTask"))
        alert.addButton(withTitle: L10n.t("prompt.continue"))
        switch alert.runModal() {
        case .alertFirstButtonReturn: return .breakNow
        case .alertSecondButtonReturn: return .newTask
        default: return .continueWork
        }
    }

    private func completeSession() {
        switch phase {
        case .work:
            completedPomodoros += 1
            defaults.set(completedPomodoros, forKey: pomodorosKey)

            if let id = focusTaskID {
                let rec = SessionRecord(id: UUID(), date: Self.dateString(Date()),
                                        taskID: id, taskName: focusTaskName,
                                        minutes: focusTaskMinutes)
                history.append(rec)
                if history.count > 1000 {
                    history.removeFirst(history.count - 1000)
                }
                if let data = try? JSONEncoder().encode(history) {
                    defaults.set(data, forKey: historyKey)
                }
            }

            var taskDone = false
            if let id = focusTaskID, let idx = tasks.firstIndex(where: { $0.id == id }) {
                tasks[idx].completedSessions += 1
                if tasks[idx].sessionLimit > 0 && tasks[idx].completedSessions >= tasks[idx].sessionLimit {
                    taskDone = true
                    if tasks[idx].isRoutine {
                        tasks[idx].routineDone = true
                    }
                }
                saveTasks()
                buildTasksMenu()
                rebuildRoutineSection()
            }

            // zatrzymaj timer, zanim pokazemy modal (ticker nie moze strzelic ponownie)
            isRunning = false
            sessionStart = nil
            accumulated = 0
            breakOverrideMinutes = 0

            if taskDone {
                phase = .work
                playCompletionSound("Hero")
                notify(title: L10n.t("notif.taskDone"),
                       body: L10n.t("notif.taskDoneBody"))
                refreshStatus()
                return
            }

            playCompletionSound("Glass")
            switch showSessionChoice() {
            case .breakNow:
                phase = (completedPomodoros % 4 == 0) ? .longBreak : .shortBreak
                isRunning = true
                sessionStart = Date()
            case .newTask:
                phase = .work
                isRunning = false
            case .continueWork:
                phase = .work
                isRunning = true
                sessionStart = Date()
            }
            refreshStatus()
        case .shortBreak, .longBreak:
            phase = .work
            playCompletionSound("Ping")
            notify(title: L10n.t("notif.breakDone"),
                   body: L10n.t("notif.breakDoneBody"))
            accumulated = 0
            breakOverrideMinutes = 0
            sessionStart = Date()
            refreshStatus()
        }
    }

    private func refreshStatus() {
        let e = elapsed()
        let dur = sessionDuration
        let remaining = max(0, dur - e)
        let emoji = (phase == .work) ? "🍅" : "☕"
        let pauseMark = (!isRunning && accumulated > 0) ? "⏸️" : ""

        statusItem.button?.title = "\(emoji)\(pauseMark) \(format(remaining))"

        if phase == .work {
            var headerTitle = L10n.t("focus.work", focusTaskName, focusTaskMinutes)
            if let id = focusTaskID, let task = tasks.first(where: { $0.id == id }), task.sessionLimit > 0 {
                headerTitle += L10n.t("focus.sessions", task.completedSessions, task.sessionLimit)
            }
            focusLabel.stringValue = headerTitle
        } else {
            focusLabel.stringValue = L10n.t(phase == .longBreak ? "focus.break.long" : "focus.break.short")
        }
        remainingLabel.stringValue = L10n.t("progress.remaining", format(remaining), format(dur))
        elapsedLabel.stringValue = L10n.t("progress.elapsed", format(e))
        countLabel.stringValue = L10n.t("progress.count", completedPomodoros)
        startPauseItem.title = isRunning ? L10n.t("timer.pause") : (accumulated > 0 ? L10n.t("timer.resume") : L10n.t("timer.start"))
        skipBreakItem.isHidden = (phase == .work)
        changelogButton.isEnabled = (focusTaskID != nil)
        updatePulse()
    }

    // MARK: - Notifications

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    private func notify(title: String, body: String) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else {
                NSSound.beep()
                return
            }
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = .default
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
            center.add(request)
        }
    }

    // MARK: - Persistence

    private func loadState() {
        if let saved = defaults.string(forKey: langKey), L10n.supported.contains(saved) {
            L10n.lang = saved
        } else {
            L10n.lang = L10n.detect()
        }

        if let data = defaults.data(forKey: tasksKey),
           let decoded = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = decoded
        }
        if let s = defaults.string(forKey: focusKey), let id = UUID(uuidString: s) {
            if tasks.contains(where: { $0.id == id }) {
                focusTaskID = id
            } else {
                focusTaskID = tasks.first?.id
            }
        }
        if let arr = defaults.array(forKey: recentKey) as? [String] {
            recentTaskIDs = arr.compactMap { UUID(uuidString: $0) }
                .filter { id in tasks.contains { $0.id == id } }
        }
        routineDate = defaults.string(forKey: routineDateKey) ?? ""
        soundsEnabled = defaults.object(forKey: soundsKey) as? Bool ?? true
        if let data = defaults.data(forKey: historyKey),
           let decoded = try? JSONDecoder().decode([SessionRecord].self, from: data) {
            history = decoded
        }
        workMinutes = defaults.integer(forKey: workKey) > 0 ? defaults.integer(forKey: workKey) : 25
        shortBreakMinutes = defaults.integer(forKey: shortKey) > 0 ? defaults.integer(forKey: shortKey) : 5
        longBreakMinutes = defaults.integer(forKey: longKey) > 0 ? defaults.integer(forKey: longKey) : 15
        completedPomodoros = defaults.integer(forKey: pomodorosKey)
    }

    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            defaults.set(data, forKey: tasksKey)
        }
        if let id = focusTaskID {
            defaults.set(id.uuidString, forKey: focusKey)
        } else {
            defaults.removeObject(forKey: focusKey)
        }
    }

    // MARK: - Menu delegate

    func menuWillOpen(_ menu: NSMenu) {
        resetRoutineIfNeeded()
        refreshStatus()
        buildTasksMenu()
        rebuildRoutineSection()
        rebuildRecentSection()
    }

    // MARK: - Quit

    @objc private func quitApp() {
        NSApp.terminate(nil)
    }
}

// MARK: - Main

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.accessory)
app.run()

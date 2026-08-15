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
            "settings.sounds": "🔔 Dźwięki na koniec sesji",
            "info": "🍅 Pomodoro Bar · v1.3.3",
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
            "settings.sounds": "🔔 Sound at session end",
            "info": "🍅 Pomodoro Bar · v1.3.3",
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
            "settings.sounds": "🔔 Sonido al terminar la sesión",
            "info": "🍅 Pomodoro Bar · v1.3.3",
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
            "settings.sounds": "🔔 Son à la fin de la session",
            "info": "🍅 Pomodoro Bar · v1.3.3",
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
            "settings.sounds": "🔔 Suono a fine sessione",
            "info": "🍅 Pomodoro Bar · v1.3.3",
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
            "settings.sounds": "🔔 صوت عند انتهاء الجلسة",
            "info": "🍅 بومودورو بار · v1.3.3",
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

enum Phase {
    case work
    case shortBreak
    case longBreak
}

// MARK: - App Delegate

final class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {

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

    private var tasks: [Task] = []
    private var focusTaskID: UUID?
    private var recentTaskIDs: [UUID] = []
    private var workMinutes = 25
    private var shortBreakMinutes = 5
    private var longBreakMinutes = 15
    private var completedPomodoros = 0
    private var routineDate = ""
    private var soundsEnabled = true

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
    private var headerItem: NSMenuItem!
    private var progressItem: NSMenuItem!
    private var elapsedItem: NSMenuItem!
    private var pomodoroCountItem: NSMenuItem!
    private var startPauseItem: NSMenuItem!
    private var stopItem: NSMenuItem!
    private var skipBreakItem: NSMenuItem!
    private var tasksMenuItem: NSMenuItem!
    private var tasksSubmenu: NSMenu!
    private var editTaskItem: NSMenuItem!
    private var deleteTaskItem: NSMenuItem!
    private var workSubmenu: NSMenu!
    private var shortSubmenu: NSMenu!
    private var longSubmenu: NSMenu!
    private var languageSubmenu: NSMenu!
    private var routineSectionItems: [NSMenuItem] = []
    private var recentHeaderItem: NSMenuItem?
    private var recentItems: [NSMenuItem] = []
    private var infoPanel: NSPanel?
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
        startTicker()
        requestNotificationPermission()
    }

    // MARK: - Setup

    private func setupStatusItem() {
        statusItem.button?.title = "🍅 00:00"
        statusItem.menu = menu
        menu.delegate = self
    }

    private func setupMenu() {
        menu.removeAllItems()

        headerItem = NSMenuItem(title: "…", action: nil, keyEquivalent: "")
        headerItem.isEnabled = false
        menu.addItem(headerItem)

        progressItem = NSMenuItem(title: "…", action: nil, keyEquivalent: "")
        progressItem.isEnabled = false
        menu.addItem(progressItem)

        elapsedItem = NSMenuItem(title: "…", action: nil, keyEquivalent: "")
        elapsedItem.isEnabled = false
        menu.addItem(elapsedItem)

        pomodoroCountItem = NSMenuItem(title: "…", action: nil, keyEquivalent: "")
        pomodoroCountItem.isEnabled = false
        menu.addItem(pomodoroCountItem)

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
                let item = NSMenuItem(title: itemTitle,
                                      action: #selector(focusTask(_:)), keyEquivalent: "")
                item.target = self
                item.representedObject = task.id
                item.toolTip = (task.note?.isEmpty == false) ? task.note : nil
                item.state = (task.id == focusTaskID) ? .on : .off
                tasksSubmenu.addItem(item)
            }
        }
        tasksSubmenu.addItem(.separator())
        let addItem = NSMenuItem(title: L10n.t("tasks.add"), action: #selector(addTask), keyEquivalent: "")
        addItem.target = self
        tasksSubmenu.addItem(addItem)

        editTaskItem = NSMenuItem(title: L10n.t("tasks.edit"), action: #selector(editFocusTask), keyEquivalent: "")
        editTaskItem.target = self
        editTaskItem.isEnabled = !tasks.isEmpty
        tasksSubmenu.addItem(editTaskItem)

        deleteTaskItem = NSMenuItem(title: L10n.t("tasks.delete"), action: #selector(deleteFocusTask), keyEquivalent: "")
        deleteTaskItem.target = self
        deleteTaskItem.isEnabled = !tasks.isEmpty
        tasksSubmenu.addItem(deleteTaskItem)
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

        let content = NSView(frame: NSRect(x: 0, y: 0, width: 380, height: 200))
        let scroll = NSScrollView(frame: NSRect(x: 16, y: 12, width: 348, height: 168))
        scroll.hasVerticalScroller = true
        scroll.borderType = .noBorder
        scroll.autohidesScrollers = true
        let contentSize = scroll.contentSize
        let textView = NSTextView(frame: NSRect(origin: .zero, size: contentSize))
        textView.minSize = NSSize(width: 0, height: contentSize.height)
        textView.maxSize = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        textView.isVerticallyResizable = true
        textView.isHorizontallyResizable = false
        textView.autoresizingMask = [.width]
        textView.isEditable = false
        textView.isSelectable = true
        textView.isRichText = false
        textView.font = .systemFont(ofSize: 13)
        textView.string = task.note ?? ""
        scroll.documentView = textView
        content.addSubview(scroll)
        panel.contentView = content

        if let screen = NSScreen.main {
            let vf = screen.visibleFrame
            panel.setFrameOrigin(NSPoint(x: vf.maxX - panel.frame.width - 14,
                                         y: vf.maxY - panel.frame.height - 4))
        }
        panel.orderFrontRegardless()
        infoPanel = panel

        DispatchQueue.main.asyncAfter(deadline: .now() + 12) { [weak self, weak panel] in
            guard let panel, panel.isVisible else { return }
            panel.close()
            if self?.infoPanel === panel { self?.infoPanel = nil }
        }
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
            headerItem.title = headerTitle
        } else {
            headerItem.title = L10n.t(phase == .longBreak ? "focus.break.long" : "focus.break.short")
        }
        progressItem.title = L10n.t("progress.remaining", format(remaining), format(dur))
        elapsedItem.title = L10n.t("progress.elapsed", format(e))
        pomodoroCountItem.title = L10n.t("progress.count", completedPomodoros)
        startPauseItem.title = isRunning ? L10n.t("timer.pause") : (accumulated > 0 ? L10n.t("timer.resume") : L10n.t("timer.start"))
        skipBreakItem.isHidden = (phase == .work)
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

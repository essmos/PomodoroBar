import AppKit
import UserNotifications

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
            "info": "🍅 Pomodoro Bar · v1.2",
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
        ],
        "en": [
            "focus.work": "🍅 Focus: %@ (%d min)",
            "focus.break.short": "☕ Short break",
            "focus.break.long": "☕ Long break",
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
            "info": "🍅 Pomodoro Bar · v1.2",
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
        ],
        "es": [
            "focus.work": "🍅 Enfoque: %@ (%d min)",
            "focus.break.short": "☕ Descanso corto",
            "focus.break.long": "☕ Descanso largo",
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
            "info": "🍅 Pomodoro Bar · v1.2",
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
        ],
        "fr": [
            "focus.work": "🍅 Focus : %@ (%d min)",
            "focus.break.short": "☕ Pause courte",
            "focus.break.long": "☕ Pause longue",
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
            "info": "🍅 Pomodoro Bar · v1.2",
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
        ],
        "it": [
            "focus.work": "🍅 Focus: %@ (%d min)",
            "focus.break.short": "☕ Pausa breve",
            "focus.break.long": "☕ Pausa lunga",
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
            "info": "🍅 Pomodoro Bar · v1.2",
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
        ],
        "ar": [
            "focus.work": "🍅 التركيز: %@ (%d دقيقة)",
            "focus.break.short": "☕ استراحة قصيرة",
            "focus.break.long": "☕ استراحة طويلة",
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
            "info": "🍅 بومودورو بار · v1.2",
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
        ],
    ]
}

// MARK: - Model

struct Task: Codable {
    var id: UUID
    var name: String
    var durationMinutes: Int
    var note: String?
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

    private var tasks: [Task] = []
    private var focusTaskID: UUID?
    private var recentTaskIDs: [UUID] = []
    private var workMinutes = 25
    private var shortBreakMinutes = 5
    private var longBreakMinutes = 15
    private var completedPomodoros = 0

    // Timer state
    private var phase: Phase = .work
    private var isRunning = false
    private var sessionStart: Date?
    private var accumulated: TimeInterval = 0
    private var breakOverrideMinutes = 0
    private var ticker: Timer?

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
    private var recentHeaderItem: NSMenuItem?
    private var recentItems: [NSMenuItem] = []
    private var infoPanel: NSPanel?

    // MARK: - Lifecycle

    func applicationDidFinishLaunching(_ notification: Notification) {
        loadState()
        setupStatusItem()
        setupMenu()
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

        let plus5 = NSMenuItem(title: "⏱️ +5 min", action: #selector(adjustDuration(_:)), keyEquivalent: "")
        plus5.target = self
        plus5.representedObject = 5
        menu.addItem(plus5)

        let plus10 = NSMenuItem(title: "⏱️ +10 min", action: #selector(adjustDuration(_:)), keyEquivalent: "")
        plus10.target = self
        plus10.representedObject = 10
        menu.addItem(plus10)

        let minus5 = NSMenuItem(title: "⏱️ −5 min", action: #selector(adjustDuration(_:)), keyEquivalent: "")
        minus5.target = self
        minus5.representedObject = -5
        menu.addItem(minus5)

        let minus10 = NSMenuItem(title: "⏱️ −10 min", action: #selector(adjustDuration(_:)), keyEquivalent: "")
        minus10.target = self
        minus10.representedObject = -10
        menu.addItem(minus10)

        menu.addItem(.separator())

        tasksMenuItem = NSMenuItem(title: L10n.t("tasks.title"), action: nil, keyEquivalent: "")
        tasksSubmenu = NSMenu()
        tasksMenuItem.submenu = tasksSubmenu
        menu.addItem(tasksMenuItem)

        editTaskItem = NSMenuItem(title: L10n.t("tasks.edit"), action: #selector(editFocusTask), keyEquivalent: "")
        editTaskItem.target = self
        menu.addItem(editTaskItem)

        deleteTaskItem = NSMenuItem(title: L10n.t("tasks.delete"), action: #selector(deleteFocusTask), keyEquivalent: "")
        deleteTaskItem.target = self
        menu.addItem(deleteTaskItem)

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

        settingsItem.submenu = settingsMenu
        menu.addItem(settingsItem)

        menu.addItem(.separator())

        let infoItem = NSMenuItem(title: L10n.t("info"), action: nil, keyEquivalent: "")
        infoItem.isEnabled = false
        menu.addItem(infoItem)

        menu.addItem(.separator())

        let quitItem = NSMenuItem(title: L10n.t("menu.quit"), action: #selector(quitApp), keyEquivalent: "")
        quitItem.target = self
        menu.addItem(quitItem)

        buildTasksMenu()
        buildDurationMenus()
        buildLanguageMenu()
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
                let item = NSMenuItem(title: L10n.t("tasks.item", task.name, task.durationMinutes) + noteMark,
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

    // MARK: - Task actions

    @objc private func addTask() {
        presentTaskDialog(title: L10n.t("dialog.addTitle"), confirm: L10n.t("dialog.addConfirm"),
                          initialName: nil, initialMinutes: workMinutes, initialNote: nil) { [weak self] name, minutes, note in
            guard let self else { return }
            let task = Task(id: UUID(), name: name, durationMinutes: minutes, note: note)
            self.tasks.append(task)
            if self.focusTaskID == nil {
                self.focusTaskID = task.id
            }
            self.saveTasks()
            self.touchRecent(task.id)
            self.buildTasksMenu()
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
                          initialName: task.name, initialMinutes: task.durationMinutes, initialNote: task.note) { [weak self] name, minutes, note in
            guard let self else { return }
            self.tasks[idx].name = name
            self.tasks[idx].durationMinutes = minutes
            self.tasks[idx].note = note
            self.saveTasks()
            self.buildTasksMenu()
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
        rebuildRecentSection()
        refreshStatus()
    }

    @objc private func focusTask(_ sender: NSMenuItem) {
        guard let id = sender.representedObject as? UUID else { return }
        focusTaskID = id
        saveTasks()
        touchRecent(id)
        buildTasksMenu()
        refreshStatus()
        if let task = tasks.first(where: { $0.id == id }), task.note?.isEmpty == false {
            showTaskInfoPopup(task)
        }
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
                                   initialNote: String?,
                                   completion: @escaping (String, Int, String) -> Void) {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = L10n.t("dialog.info")

        let container = NSView(frame: NSRect(x: 0, y: 0, width: 420, height: 252))

        let nameLabel = NSTextField(labelWithString: L10n.t("dialog.nameLabel"))
        nameLabel.frame = NSRect(x: 0, y: 228, width: 420, height: 17)
        container.addSubview(nameLabel)

        let nameField = NSTextField(frame: NSRect(x: 0, y: 194, width: 420, height: 28))
        nameField.placeholderString = L10n.t("dialog.namePlaceholder")
        nameField.font = .systemFont(ofSize: 14)
        nameField.stringValue = initialName ?? ""
        container.addSubview(nameField)

        let minLabel = NSTextField(labelWithString: L10n.t("dialog.minutesLabel"))
        minLabel.frame = NSRect(x: 0, y: 170, width: 420, height: 17)
        container.addSubview(minLabel)

        let minutesField = NSTextField(frame: NSRect(x: 0, y: 136, width: 420, height: 28))
        minutesField.placeholderString = L10n.t("dialog.minutesPlaceholder")
        minutesField.font = .systemFont(ofSize: 14)
        minutesField.stringValue = String(initialMinutes)
        container.addSubview(minutesField)

        let noteLabel = NSTextField(labelWithString: L10n.t("dialog.noteLabel"))
        noteLabel.frame = NSRect(x: 0, y: 112, width: 420, height: 17)
        container.addSubview(noteLabel)

        let scroll = NSScrollView(frame: NSRect(x: 0, y: 0, width: 420, height: 106))
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

        alert.accessoryView = container
        alert.window.initialFirstResponder = nameField
        alert.addButton(withTitle: confirm)
        alert.addButton(withTitle: L10n.t("dialog.cancel"))

        guard alert.runModal() == .alertFirstButtonReturn else { return }
        let name = nameField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        let raw = minutesField.integerValue == 0 ? initialMinutes : minutesField.integerValue
        let minutes = max(1, min(480, raw))
        let note = noteView.string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !name.isEmpty else { return }
        completion(name, minutes, note)
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

    @objc private func adjustDuration(_ sender: NSMenuItem) {
        guard let delta = sender.representedObject as? Int else { return }
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

    private func tick() {
        guard isRunning else { return }
        if elapsed() >= sessionDuration {
            completeSession()
        }
        refreshStatus()
    }

    private func completeSession() {
        switch phase {
        case .work:
            completedPomodoros += 1
            defaults.set(completedPomodoros, forKey: pomodorosKey)
            let isLong = completedPomodoros % 4 == 0
            phase = isLong ? .longBreak : .shortBreak
            let kind = isLong ? "long" : "short"
            notify(title: L10n.t("notif.workDone"),
                   body: L10n.t("notif.breakStart.\(kind)"))
        case .shortBreak, .longBreak:
            phase = .work
            notify(title: L10n.t("notif.breakDone"),
                   body: L10n.t("notif.breakDoneBody"))
        }
        accumulated = 0
        breakOverrideMinutes = 0
        sessionStart = Date()
        refreshStatus()
    }

    private func refreshStatus() {
        let e = elapsed()
        let dur = sessionDuration
        let remaining = max(0, dur - e)
        let emoji = (phase == .work) ? "🍅" : "☕"

        statusItem.button?.title = "\(emoji) \(format(remaining))"

        if phase == .work {
            headerItem.title = L10n.t("focus.work", focusTaskName, focusTaskMinutes)
        } else {
            headerItem.title = L10n.t(phase == .longBreak ? "focus.break.long" : "focus.break.short")
        }
        progressItem.title = L10n.t("progress.remaining", format(remaining), format(dur))
        elapsedItem.title = L10n.t("progress.elapsed", format(e))
        pomodoroCountItem.title = L10n.t("progress.count", completedPomodoros)
        startPauseItem.title = isRunning ? L10n.t("timer.pause") : (accumulated > 0 ? L10n.t("timer.resume") : L10n.t("timer.start"))
        skipBreakItem.isHidden = (phase == .work)
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
        refreshStatus()
        buildTasksMenu()
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

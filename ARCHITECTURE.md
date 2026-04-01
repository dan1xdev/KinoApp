# Архитектура приложения CinemaApp

## Стек

- **UIKit** — весь UI строится кодом, без Storyboard
- **Coordinator pattern** — управление навигацией
- **MVC** — базовый паттерн для экранов
- **Repository pattern** — слой доступа к данным
- **Realm** — локальное кэширование фильмов
- **async/await** — асинхронные сетевые запросы
- **CocoaPods** — менеджер зависимостей

---

## Структура проекта

```
kinoApp/
├── Core/
│   ├── AppDelegate.swift          # Точка входа, подключение SceneDelegate
│   ├── SceneDelegate.swift        # Создание окна и запуск AppCoordinator
│   ├── Coordinators/
│   │   ├── Coordinator.swift      # Протокол: func start() -> UIViewController
│   │   ├── AppCoordinator.swift   # Корневой координатор
│   │   ├── AuthCoordinator.swift  # Поток авторизации
│   │   └── MainCoordinator.swift  # Главный поток (TabBar)
│   ├── Data/
│   │   ├── APIConfig.swift        # Базовый URL и API-ключ из Info.plist
│   │   ├── FilmAPI.swift          # Сетевые запросы к Кинопоиску
│   │   ├── FilmRepository.swift   # Единая точка доступа к данным
│   │   └── FilmCacheService.swift # Сохранение/загрузка из Realm
│   └── Services/
│       └── Auth/
│           ├── AuthService.swift          # Состояние авторизации
│           ├── Controller/AuthVC.swift    # Экран входа
│           └── View/AuthView.swift        # UI экрана входа
└── Modules/
    ├── Main/       # Главный экран со списком фильмов
    ├── Eat/        # Экран еды/напитков
    ├── Profile/    # Экран профиля
    └── TabBar/     # TabController
```

---

## Coordinator pattern

Координаторы отвечают за навигацию — контроллеры не знают друг о друге.

Протокол простой:
```swift
protocol Coordinator {
    func start() -> UIViewController
}
```

### Цепочка запуска

```
SceneDelegate
    └── AppCoordinator.start()
            ├── authService.isAuthorized == false
            │       └── AuthCoordinator.start() → AuthVC
            │               onFinish → AppCoordinator.showMainFlow()
            └── authService.isAuthorized == true
                    └── MainCoordinator.start() → TabController
```

### Logout

```
LogoutButtonView.onLogoutTap
    → ProfileVC.onLogout
    → MainCoordinator.onLogout
    → AppCoordinator.showAuthFlow()
        → authService.logout()
        → FilmRepository.shared.clearMemoryCache()
        → AuthCoordinator.start()
```

Каждый координатор передаёт коллбэк `onFinish` / `onLogout` наверх — так родительский координатор знает когда переключить поток.

---

## Слой данных

Данные проходят три уровня кэширования:

```
FilmRepository.getPopularFilms()
    │
    ├── 1. memoryCache (in-memory, [Film]?)
    │       Живёт пока живёт приложение.
    │       Сбрасывается при logout.
    │
    ├── 2. Realm (FilmCacheService)
    │       Переживает перезапуск приложения.
    │       FilmObject — Realm-модель с @Persisted полями.
    │
    └── 3. Network (FilmAPI)
            GET kinopoiskapiunofficial.tech/api/v2.2/films/collections
            Декодирует KinoResponse → [Film]
```

### Модели

- `Film` — чистая Swift-структура (`Decodable`, `Hashable`), используется в UI
- `FilmObject` — Realm-объект (`Object`), хранится в базе
- `FilmObject.toFilm()` — конвертация из Realm в Swift-модель
- `FilmObject(film:)` — конвертация из Swift-модели в Realm

### Синглтон Repository

`FilmRepository` реализован как синглтон (`FilmRepository.shared`), чтобы `memoryCache` не сбрасывался при создании нового экземпляра.

---

## MVC на уровне экранов

Каждый модуль устроен одинаково:

```
Controller (VC)   — логика, подписки, вызов данных
View              — UI-компоненты, лейаут, коллбэки наверх
Model             — структуры данных
```

Пример — главный экран:
```
MainPageVC (Controller)
    ├── HeaderView
    ├── LoyaltyView
    └── FilmCollectionView
            ├── UICollectionView
            └── FilmCellView (ячейка)
```

`MainPageVC` не знает про навигацию — это зона координатора.
Вью-компоненты не знают про данные — они получают готовые модели через `configure(with:)`.

---

## Жизненный цикл запроса фильмов

1. `MainPageVC.viewDidLoad()` вызывает `loadFilms()`
2. `FilmRepository.shared.getPopularFilms()` проверяет `memoryCache`
3. Если кэш пуст — проверяет Realm через `FilmCacheService`
4. Если Realm пуст — делает запрос через `FilmAPI`
5. Результат сохраняется в Realm и `memoryCache`
6. `filmCollectionView.configure(with: films)` обновляет UI на главном потоке

При повторном открытии экрана (переключение табов) — шаг 2 возвращает данные мгновенно из памяти, сеть не трогается.

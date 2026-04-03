# KinoApp

iOS приложение для просмотра информации о фильмах на основе [Kinopoisk Unofficial API](https://kinopoiskapiunofficial.tech).
https://youtube.com/shorts/zP4RNgzImEQ

## Стек технологий

- **Swift** + UIKit
- **MVVM** + Coordinator pattern
- **Realm** — локальное кэширование данных
- **CocoaPods** — менеджер зависимостей

## Архитектура

Приложение построено на паттерне **MVVM** с координаторами для навигации.

```
kinoApp/
├── Core/
│   ├── Coordinators/       # AppCoordinator, MainCoordinator, AuthCoordinator
│   ├── Data/               # APIConfig, FilmAPI, FilmRepository, FilmCacheService
│   └── Services/           # Auth
├── Modules/
│   ├── Main/               # Главный экран со списком фильмов
│   ├── Eat/                # Модуль рекомендаций
│   ├── Profile/            # Профиль пользователя
│   └── TabBar/             # Таб-бар навигация
└── Resources/
    └── Assets, шрифты (Urbanist)
```

## Установка и запуск

### Требования

- Xcode 15+
- iOS 15+
- CocoaPods

### Шаги

1. Клонируй репозиторий:
   ```bash
   git clone https://github.com/dan1xdev/KinoApp.git
   cd KinoApp
   ```

2. Установи зависимости:
   ```bash
   pod install
   ```

3. Открой `.xcworkspace`:
   ```bash
   open kinoApp.xcworkspace
   ```

4. Добавь API-ключ в `kinoApp/Info.plist`:
   ```xml
   <key>KINOPOISK_API_KEY</key>
   <string>YOUR_API_KEY_HERE</string>
   ```
   Получить ключ можно на [kinopoiskapiunofficial.tech](https://kinopoiskapiunofficial.tech).

5. Собери и запусти проект на симуляторе или устройстве (⌘R).

## Функциональность

- Просмотр популярных фильмов
- Поиск фильмов через Kinopoisk API
- Кэширование данных с Realm
- Авторизация пользователя
- Профиль

## Зависимости

| Библиотека | Назначение |
|---|---|
| Realm / RealmSwift | Локальная база данных |

final class FilmRepository {

    static let shared = FilmRepository()
    private init() {}

    private let api = FilmAPI()
    private let cache = FilmCacheService()
    private var memoryCache: [Film]?

    func clearMemoryCache() {
        memoryCache = nil
    }

    func getPopularFilms() async throws -> [Film] {
        if let cached = memoryCache {
            return cached
        }

        let cached = cache.loadFilms()
        if !cached.isEmpty {
            let films = cached.map { $0.toFilm() }
            memoryCache = films
            return films
        }

        let films = try await api.fetchPopularFilms()
        cache.save(films)
        memoryCache = films
        return films
    }
}

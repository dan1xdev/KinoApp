import RealmSwift

class FilmObject: Object {
    @Persisted(primaryKey: true) var kinopoiskId: Int
    @Persisted var imdbId: String?
    @Persisted var nameRu: String?
    @Persisted var nameEn: String?
    @Persisted var nameOriginal: String?

    @Persisted var ratingKinopoisk: Double?
    @Persisted var ratingImdb: Double?
    @Persisted var year: Int?
    @Persisted var type: String

    @Persisted var posterUrl: String?
    @Persisted var posterUrlPreview: String?
    @Persisted var coverUrl: String?
    @Persisted var logoUrl: String?
    @Persisted var filmDescription: String?
    @Persisted var ratingAgeLimits: String?

    @Persisted var countries = List<CountryObject>()
    @Persisted var genres = List<GenreObject>()
}

extension FilmObject {

    func toFilm() -> Film {
        Film(
            kinopoiskId: kinopoiskId,
            imdbId: imdbId,
            nameRu: nameRu,
            nameEn: nameEn,
            nameOriginal: nameOriginal,

            countries: countries.map {
                Country(country: $0.country)
            },
            genres: genres.map {
                Genre(genre: $0.genre)
            },

            ratingKinopoisk: ratingKinopoisk,
            ratingImdb: ratingImdb,
            year: year,
            type: type,

            posterUrl: posterUrl,
            posterUrlPreview: posterUrlPreview,
            coverUrl: coverUrl,
            logoUrl: logoUrl,
            filmDescription: filmDescription,
            ratingAgeLimits: ratingAgeLimits
        )
    }
}

extension FilmObject {
    convenience init(film: Film) {
        self.init()
        kinopoiskId = film.kinopoiskId
        imdbId = film.imdbId
        nameRu = film.nameRu
        nameEn = film.nameEn
        nameOriginal = film.nameOriginal
        ratingKinopoisk = film.ratingKinopoisk
        ratingImdb = film.ratingImdb
        year = film.year
        type = film.type
        posterUrl = film.posterUrl
        posterUrlPreview = film.posterUrlPreview
        coverUrl = film.coverUrl
        logoUrl = film.logoUrl
        filmDescription = film.filmDescription
        ratingAgeLimits = film.ratingAgeLimits

        countries.append(objectsIn: film.countries.map {
            CountryObject(value: ["country": $0.country])
        })

        genres.append(objectsIn: film.genres.map {
            GenreObject(value: ["genre": $0.genre])
        })
    }
}

class CountryObject: Object {
    @Persisted var country: String = ""
}

class GenreObject: Object {
    @Persisted var genre: String = ""
}

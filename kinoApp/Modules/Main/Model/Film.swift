import RealmSwift
struct KinoResponse: Decodable {
    let total: Int
    let totalPages: Int
    let items: [Film]
}

struct Film: Decodable, Hashable {
    let kinopoiskId: Int
    let imdbId: String?
    let nameRu: String?
    let nameEn: String?
    let nameOriginal: String?

    let countries: [Country]
    let genres: [Genre]

    let ratingKinopoisk: Double?
    let ratingImdb: Double?
    let year: Int?
    let type: String

    let posterUrl: String?
    let posterUrlPreview: String?
    let coverUrl: String?
    let logoUrl: String?
    let filmDescription: String?
    let ratingAgeLimits: String?
}

struct Country: Decodable, Hashable {
    let country: String
}

struct Genre: Decodable, Hashable {
    let genre: String
}

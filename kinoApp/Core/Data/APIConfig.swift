import Foundation
enum APIConfig {
    static let baseURL = "https://kinopoiskapiunofficial.tech"

    static var apiKey: String {
        guard let key = Bundle.main.object(
            forInfoDictionaryKey: "KINOPOISK_API_KEY"
        ) as? String else {
            fatalError("❌ KINOPOISK_API_KEY not set")
        }
        return key
    }
}

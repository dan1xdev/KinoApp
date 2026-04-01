import Foundation
final class FilmAPI {

    func fetchPopularFilms() async throws -> [Film] {
        guard let baseURL = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/collections"),
              var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return []
        }

        components.queryItems = [
            .init(name: "type", value: "TOP_POPULAR_ALL"),
            .init(name: "page", value: "1")
        ]

        guard let url = components.url else { return [] }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(APIConfig.apiKey, forHTTPHeaderField: "X-API-KEY")

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(KinoResponse.self, from: data)
        return response.items
    }
}

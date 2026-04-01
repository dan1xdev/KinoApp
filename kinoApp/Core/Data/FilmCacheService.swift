import RealmSwift

final class FilmCacheService {

    // MARK: - Save

    func save(_ films: [Film]) {
        guard let realm = try? Realm() else { return }
        let objects = films.map { FilmObject(film: $0) }
        try? realm.write {
            realm.add(objects, update: .modified)
        }
    }

    // MARK: - Load

    func loadFilms() -> [FilmObject] {
        guard let realm = try? Realm() else { return [] }
        return Array(realm.objects(FilmObject.self))
    }

    // MARK: - Clear

    func clear() {
        guard let realm = try? Realm() else { return }
        try? realm.write {
            realm.delete(realm.objects(FilmObject.self))
        }
    }
}

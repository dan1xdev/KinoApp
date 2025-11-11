import UIKit


class MainPageVC: UIViewController {
    
    // MARK: - Initialize Views
    private let headerView = HeaderView()
    private let loyaltyView = LoyaltyView()
    private let filmCollectionView = FilmCollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        loyaltyView.translatesAutoresizingMaskIntoConstraints = false
        filmCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        view.addSubview(loyaltyView)
        view.addSubview(filmCollectionView)
        
        let sampleFilms = [
                    Film(title: "Маска", imageName: "maska"),
                    Film(title: "Мстители: Финал", imageName: "avengers-final"),
                    Film(title: "Гарри Поттер ", imageName: "garry-potter"),
                    Film(title: "Остров проклятых", imageName: "ostrov-prokl"),
                    Film(title: "Трансформеры: Эпоха истребления", imageName: "transformers-epoha")
        ]
        filmCollectionView.configure(with: sampleFilms)
        
        // MARK: - layout
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            loyaltyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            loyaltyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loyaltyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loyaltyView.heightAnchor.constraint(equalToConstant: 150),
            
            filmCollectionView.topAnchor.constraint(equalTo: loyaltyView.bottomAnchor),
            filmCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filmCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filmCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
    }

}

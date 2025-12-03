import UIKit

class MainPageVC: UIViewController {
    
    // MARK: - Initialize Views
    private var loyaltyHeightConstraint: NSLayoutConstraint!
    private var filmCollectionConstraint: NSLayoutConstraint!
    private let headerView = HeaderView()
    private let loyaltyView = LoyaltyView()
    private let filmCollectionView = FilmCollectionView()
    private var isLoyaltyCollapsed = false
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Task{
            await self.searchFilm()
        }
        view.backgroundColor = UIColor(named: "Background")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        loyaltyView.translatesAutoresizingMaskIntoConstraints = false
        filmCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        view.addSubview(loyaltyView)
        view.addSubview(filmCollectionView)
        
        filmCollectionView.onScroll = { [weak self] offset in
                self?.updateLoyaltyHeight(offset: offset)
            }
        

        
        let sampleFilms: [Film] = []
        filmCollectionView.configure(with: sampleFilms)
        loyaltyHeightConstraint = loyaltyView.heightAnchor.constraint(equalToConstant: 150)
        filmCollectionConstraint = filmCollectionView.topAnchor.constraint(equalTo: loyaltyView.bottomAnchor)

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            loyaltyView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            loyaltyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loyaltyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loyaltyHeightConstraint,
            
            filmCollectionConstraint,
            filmCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filmCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filmCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
    }
    
    private func updateLoyaltyHeight(offset: CGFloat) {
        let clampedOffset = max(0, offset)
        let newHeight = max(0, 150 - clampedOffset * 0.5)
        
        if isLoyaltyCollapsed {
            if newHeight > 120 {
                
                isLoyaltyCollapsed = false
                loyaltyView.isHidden = false
                loyaltyHeightConstraint.constant = 150
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                UIView.animate(withDuration: 0.15,
                               delay: 0,
                               options: [.curveEaseInOut]) {
                    self.loyaltyView.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
            return
        }
        
        loyaltyHeightConstraint.constant = newHeight
        view.layoutIfNeeded()
        
        if newHeight <= 115 {
            isLoyaltyCollapsed = true
            loyaltyHeightConstraint.constant = 0
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           options: [.curveEaseInOut]) {
                self.loyaltyView.alpha = 0
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.loyaltyView.isHidden = true
            }
        } else {
            // пока ещё выше порога — следим, чтобы view была видимой
            loyaltyView.isHidden = false
            loyaltyView.alpha = 1
        }
    }
    
    private func searchFilm() async {
        let url = URL(string:
            "https://kinopoiskapiunofficial.tech/api/v2.2/films/collections"
        )!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            .init(name: "type", value: "TOP_POPULAR_ALL"),
            .init(name: "page", value: "1")
        ]
        
        guard let finalURL = components.url else { return }

        var request = URLRequest(url: finalURL)
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("3037eb60-3ee3-47a0-844a-b32be33073b4",
                         forHTTPHeaderField: "X-API-KEY")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let result = try JSONDecoder().decode(KinoResponse.self, from: data)
            
            await MainActor.run {
                filmCollectionView.configure(with: result.items)
            }

        } catch {
            print("❌ Error:", error)
        }
    }

}


import UIKit

class MainPageVC: UIViewController {
    // MARK: - Initialize Views
    private let repository = FilmRepository.shared
    private var loyaltyHeightConstraint: NSLayoutConstraint!
    private var filmCollectionConstraint: NSLayoutConstraint!
    private let headerView = HeaderView()
    private let loyaltyView = LoyaltyView()
    private let filmCollectionView = FilmCollectionView()
    private var isLoyaltyCollapsed = false
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        view.accessibilityIdentifier = "mainScreen"
        view.backgroundColor = UIColor(named: "Background")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        loyaltyView.translatesAutoresizingMaskIntoConstraints = false
        filmCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        view.addSubview(loyaltyView)
        view.addSubview(filmCollectionView)
        setupViews()
        loadFilms()
    }
    
    
    private func setupViews(){
        filmCollectionView.onScroll = { [weak self] offset in
                self?.updateLoyaltyHeight(offset: offset)
        }

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
            loyaltyView.isHidden = false
            loyaltyView.alpha = 1
        }
    }
    
    private func loadFilms() {
        Task {
            do {
                let films = try await repository.getPopularFilms()
                await MainActor.run {
                    self.filmCollectionView.configure(with: films)
                }
            } catch {
                print("❌ Failed to load films:", error)
            }
        }}

}


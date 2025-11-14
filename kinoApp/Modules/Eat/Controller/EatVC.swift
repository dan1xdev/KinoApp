import UIKit


class EatVC: UIViewController{
    private var choosenCategory: EatCategory = .promotion
    
    private let eatPositions: [EatPosition] = []
    private let headerView = EatHeaderView()
    private let searchView = SearchView()
    private let selectorView = SelectorView()

    private let positionListView = PositionListView()
    
    override func viewDidLoad() {
        setupSelectorDelegate()
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        view.addSubview(headerView)
        view.addSubview(searchView)
        view.addSubview(selectorView)
//        view.addSubview(eatPositionView)
        addPosition(title: "Комбо 1", image: UIImage(named: "kombo1")!, price: 549, category: .promotion)
        addPosition(title: "Яблочный лимонад", image: UIImage(named: "apple_lemon")!, price: 150, category: .drink)
        addPosition(title: "Попкорн", image: UIImage(named: "popcorn")!, price: 359, category: .food)
        addPosition(title: "Картофель Фри", image: UIImage(named:"kartofel1")!, price: 99, category: .food)
        view.addSubview(positionListView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        searchView.translatesAutoresizingMaskIntoConstraints = false
        selectorView.translatesAutoresizingMaskIntoConstraints = false
        positionListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            searchView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 80),
            
            
            selectorView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 10),
            selectorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectorView.heightAnchor.constraint(equalToConstant: 50),
            
            
//            eatPositionView.topAnchor.constraint(equalTo: selectorView.bottomAnchor, constant: 10),
//            eatPositionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            eatPositionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            eatPositionView.heightAnchor.constraint(equalToConstant: 300),
            
            
            positionListView.topAnchor.constraint(equalTo: selectorView.bottomAnchor),
            positionListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            positionListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            positionListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
    }
    private func setupSelectorDelegate(){
        selectorView.delegate = self
    }
    
    private func addPosition(title: String, image: UIImage, price: Int, category: EatCategory){
        let newPosition = EatPosition(title: title, price: price, image: image, category: category)
        let newPositionView = EatPositionView()
        newPositionView.setupPositionView(position: newPosition)
        positionListView.eatPositionViews.append(newPositionView)
        
    }
}


extension EatVC: SelectorViewDelegate {
    func didSelectCategory(_ category: EatCategory) {
        choosenCategory = category
        positionListView.category = category
    }
}

import UIKit

final class PositionListView: UIView{
    var category: EatCategory = .promotion
    {
        didSet {
            filterContent(category)
        }
    }
    // MARK: - UI Views
    var eatPositionViews: [EatPositionView] = []
    {
        didSet {
            setContent()
            filterContent(category)
        }
    }
    
    private var eatScrollView: UIScrollView = {
        var sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    private var contentView: UIView = {
        var content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private var eatStackView: UIStackView = {
        var sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 16
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    
    // MARK: - Setup
    private func setupView(){
        addSubview(eatScrollView)
        
        NSLayoutConstraint.activate([
            
            eatScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            eatScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            eatScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            eatScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            
        ])
        eatScrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: eatScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: eatScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: eatScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: eatScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: eatScrollView.widthAnchor),
            
        ])
        
        contentView.addSubview(eatStackView)
        NSLayoutConstraint.activate([
            eatStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eatStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eatStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eatStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        setContent()
    }
    
    
    func setContent() {
        // Очистка старого контента
        eatStackView.arrangedSubviews.forEach { view in
            eatStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        // Добавляем новые элементы
        for view in eatPositionViews {
            eatStackView.addArrangedSubview(view)
        }
    }
    
    func filterContent(_ category: EatCategory){
        let filteredPositions = eatPositionViews.filter { $0.position?.category == category }
        eatStackView.arrangedSubviews.forEach { view in
            eatStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        for view in filteredPositions {
            eatStackView.addArrangedSubview(view)
        }
        
    }

}

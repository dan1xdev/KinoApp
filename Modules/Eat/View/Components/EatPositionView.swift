import UIKit


class EatPositionView: UIView {
    public var position: EatPosition?
    private var positionContainer: UIView = {
        var container = UIView()
        container.layer.cornerRadius = 12 
        container.backgroundColor = UIColor(named: "Background 2")
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        return container
    }()
    
    private var imageFood: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "popcorn")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var titleFood: UILabel = {
        var label = UILabel()
        label.text = "Попкорн 2x1"
        label.numberOfLines = 2
        label.font = UIFont(name: "Urbanist-ExtraBold", size: 20)
        label.textColor = UIColor(named: "Imperial red")
        return label
    }()

    
    
    private var priceFood: UILabel = {
        var label = UILabel()
        label.text = "$" + "3.99"
        label.font = UIFont(name: "Urbanist-Bold", size: 23)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var addBtn: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "plus.app.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 23)), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    
    lazy var secondHStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [priceFood, addBtn])
        stack.spacing = 8
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var vStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [titleFood, secondHStack])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        stack.alignment = .center
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8) // Отступы внутри стека
        stack.isLayoutMarginsRelativeArrangement = true // Включаем отступы
        return stack
    }()
    
    lazy var hStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageFood, vStack])
        
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    private func setupView(){
        addSubview(positionContainer)
        NSLayoutConstraint.activate([
            positionContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            positionContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            positionContainer.topAnchor.constraint(equalTo: topAnchor),
            positionContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            positionContainer.heightAnchor.constraint(equalToConstant: 150),
            ])
        
        positionContainer.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: positionContainer.leadingAnchor),
            hStack.bottomAnchor.constraint(equalTo: positionContainer.bottomAnchor),
            hStack.topAnchor.constraint(equalTo: positionContainer.topAnchor),
            hStack.trailingAnchor.constraint(equalTo: positionContainer.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            imageFood.widthAnchor.constraint(equalToConstant: 150),
            imageFood.heightAnchor.constraint(equalTo: positionContainer.heightAnchor)
        ])
    }
    
    
    func setupPositionView(position: EatPosition){
        imageFood.image = position.image
        titleFood.text = position.title
        priceFood.text = String(position.price) + " р."
        self.position = position
    }
}



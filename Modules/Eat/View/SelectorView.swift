import UIKit

protocol SelectorViewDelegate: AnyObject {
    func didSelectCategory(_ category: EatCategory)
}

class SelectorView: UIView{
    weak var delegate: SelectorViewDelegate?
    
    private var promotionsItem: ItemRectangleView?
    private var drinksItem: ItemRectangleView?
    private var foodItem: ItemRectangleView?
    private let hStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 12
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    private func setupView(){
        promotionsItem = ItemRectangleView()
        drinksItem = ItemRectangleView()
        foodItem = ItemRectangleView()
        
        promotionsItem?.textItem = "Акции"
        drinksItem?.textItem = "Напитки"
        foodItem?.textItem = "Еда"
        
        promotionsItem?.isSelected = true
        
        hStack.addArrangedSubview(promotionsItem ?? UIView())
        hStack.addArrangedSubview(drinksItem ?? UIView())
        hStack.addArrangedSubview(foodItem ?? UIView())
        
        backgroundColor = .clear
        addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])
        
        
        setupTapGestures()
        selectItem(promotionsItem ?? ItemRectangleView())
    }
    
    private func setupTapGestures(){
        let promotionsTap = UITapGestureRecognizer(target: self, action: #selector(promotionTapped))
        let drinksTap = UITapGestureRecognizer(target: self, action: #selector(drinkTapped))
        let foodTap = UITapGestureRecognizer(target: self, action: #selector(foodTapped))
        
        promotionsItem?.addGestureRecognizer(promotionsTap)
        drinksItem?.addGestureRecognizer(drinksTap)
        foodItem?.addGestureRecognizer(foodTap)
    }
    
    @objc private func promotionTapped() {
        selectItem(promotionsItem ?? ItemRectangleView())
        delegate?.didSelectCategory(.promotion)
    }
    @objc private func drinkTapped() {
        selectItem(drinksItem ?? ItemRectangleView())
        delegate?.didSelectCategory(.drink)
    }
    @objc private func foodTapped() {
        selectItem(foodItem ?? ItemRectangleView())
        delegate?.didSelectCategory(.food)
    }
    
    
    private func selectItem(_ selectedItem: ItemRectangleView){
        promotionsItem?.isSelected = false
        drinksItem?.isSelected = false
        foodItem?.isSelected = false
        selectedItem.isSelected = true
    }
}

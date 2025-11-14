//
//  PaymentInfoView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//
import UIKit

class PaymentInfoView: UIView {
    let ticketButton = InfoButtonView()
    let cardButton = InfoButtonView()
    let historyButton = InfoButtonView()
    
    private lazy var VStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ticketButton, cardButton, historyButton])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func configureButtons(){
        ticketButton.createInfoButtonView(image: UIImage(systemName: "ticket")!, text: "Мои билеты")
        cardButton.createInfoButtonView(image: UIImage(systemName: "creditcard")!, text: "Мои карты")
        historyButton.createInfoButtonView(image: UIImage(systemName: "book.closed")!, text: "История")
    }
    
    
    func setupView(){
        configureButtons()
        addSubview(VStackView)
        NSLayoutConstraint.activate([
            VStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            VStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStackView.topAnchor.constraint(equalTo: topAnchor),
            VStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

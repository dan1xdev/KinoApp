//
//  ChooseCinemaButtonView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 01.11.2025.
//


import UIKit

final class ChooseCinemaButtonView: UIView{
    // MARK: - Views
    private lazy var textChoose: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "Imperial red")
        label.font = UIFont(name: "Urbanist-Black", size: 12)
        label.text = "Кинотеатр"
        return label
    }()
    
    private lazy var chosenCinema: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(.white)
        label.font = UIFont(name: "Urbanist-Medium", size: 15)
        label.text = "ТЦ Бутово Молл"
        return label
    }()
    
    private lazy var arrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Arrow")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(named: "Background 2")
        container.layer.cornerRadius = 12
        container.layer.masksToBounds = true
        return container
    }()
    
    // MARK: - Stacks
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [vStack, arrow])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [textChoose, chosenCinema])
        stack.axis = .vertical
        return stack
    }()
    
    
    // MARK: - Inits
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        
        containerView.addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            ])
    }
}

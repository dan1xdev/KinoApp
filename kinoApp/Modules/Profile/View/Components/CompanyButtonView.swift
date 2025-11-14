//
//  CompanyButtonView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//
import UIKit

class CompanyButtonView: UIView {
    
    // MARK: - Views
    private let container: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 10
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    private let infoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = UIColor(named: "Imperial red")
        return image
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Urbanist-SemiBold", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var HStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [infoImage, infoLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: - Setup
    private func setupView(){
        addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        container.addSubview(HStack)
        NSLayoutConstraint.activate([
            HStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            HStack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            HStack.topAnchor.constraint(equalTo: container.topAnchor),
            HStack.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            infoImage.heightAnchor.constraint(equalToConstant: 30),
            infoImage.widthAnchor.constraint(equalToConstant: 30),
        ])
        

    }
    
    
    func createInfoButtonView(image: UIImage, text: String){
        infoImage.image = image
        infoLabel.text = text
    }
}

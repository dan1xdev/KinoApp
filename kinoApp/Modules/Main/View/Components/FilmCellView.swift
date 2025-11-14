//
//  FilmCellView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//


import UIKit

class FilmCellView: UICollectionViewCell {
    
    static let identifier = "FilmCellView"
    
    private let bottomContainer = UIView()

    // MARK: - Views
    private let filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let filmNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(named: "Imperial red")
        label.numberOfLines = 2
        label.font = UIFont(name: "Urbanist-Bold", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    func setupView(){
        contentView.addSubview(filmImageView)
            contentView.addSubview(bottomContainer)
            bottomContainer.addSubview(filmNameLabel)
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filmImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            filmImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filmImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filmImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            
            bottomContainer.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 12),
                   bottomContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   bottomContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                   bottomContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                   
                   filmNameLabel.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
                   filmNameLabel.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 4),
                   filmNameLabel.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -4)
        ])
    }
    
    func configure(with film: Film) {
        filmImageView.image = UIImage(named: film.imageName)
        filmNameLabel.text = film.title
    }
}

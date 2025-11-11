//
//  FilmCollectionView.swift
//  kinoApp
//
//  Created by Даниил Кискин on 07.11.2025.
//

import UIKit

final class FilmCollectionView: UIView{
    
    // MARK: - Properties
    private var films: [Film] = []
    
    
    
    // MARK: - Views
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 18
        layout.minimumInteritemSpacing = 10
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
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
    func setupView(){
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        collectionView.register(FilmCellView.self, forCellWithReuseIdentifier: FilmCellView.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configure(with films: [Film]) {
        self.films = films
        collectionView.reloadData()
    }

}


extension FilmCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCellView", for: indexPath) as! FilmCellView
        let film = films[indexPath.item]
        cell.configure(with: film)
        return cell
    }
}

extension FilmCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 10 * 3) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}



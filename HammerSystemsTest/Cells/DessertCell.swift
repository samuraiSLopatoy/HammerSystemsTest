//
//  DessertCell.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 25.01.2022.
//

import UIKit

class DessertCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "DessertCell"
    
    let dessertImageView = UIImageView()
    let nameLabel = UILabel(text: "Name", font: .systemFont(ofSize: 18))
    let taglineLabel = UILabel(text: "Description", font: .systemFont(ofSize: 12))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        dessertImageView.clipsToBounds = true
        dessertImageView.layer.cornerRadius = 6
        taglineLabel.textColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let dessert: Category = value as? Category else { return }
        dessertImageView.image = UIImage(named: dessert.imageURL)
        nameLabel.text = dessert.name
        taglineLabel.text = dessert.tagline
    }
    
}

// MARK: - Setup constraints
extension DessertCell {
    private func setupConstraints() {
        dessertImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
                
        addSubview(dessertImageView)
        addSubview(nameLabel)
        addSubview(taglineLabel)
        
        NSLayoutConstraint.activate([
            dessertImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            dessertImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dessertImageView.heightAnchor.constraint(equalToConstant: 78),
            dessertImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: dessertImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            taglineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            taglineLabel.leadingAnchor.constraint(equalTo: dessertImageView.trailingAnchor, constant: 16),
            taglineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
    }
    
}

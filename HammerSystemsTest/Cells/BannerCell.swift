//
//  BannerView.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 26.01.2022.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    static let reuseId = "BannerCell"
    
    let bannerImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bannerImageView)
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        bannerImageView.frame = self.bounds
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        bannerImageView.clipsToBounds = true
        bannerImageView.layer.cornerRadius = 6
        bannerImageView.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


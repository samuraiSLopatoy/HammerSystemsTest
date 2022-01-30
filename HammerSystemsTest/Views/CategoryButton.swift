//
//  CategoryButton.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 28.01.2022.
//

import UIKit

class CategoryButton: UIButton {
    
    convenience init(text: String) {
        self.init()
        
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.init(type: .system)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemPink.cgColor
        self.layer.cornerRadius = 20
        self.setTitle(text, for: .normal)
        self.tintColor = .red
    }
    
}

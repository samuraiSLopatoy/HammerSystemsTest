//
//  UILabel + Extension.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont) {
        self.init()
        
        self.text = text
        self.font = font
    }
}

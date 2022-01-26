//
//  SelfConfiguringCell.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 25.01.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}

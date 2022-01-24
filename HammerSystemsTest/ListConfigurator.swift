//
//  ListConfigurator.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//

import Foundation

class ListConfigurator {
    
    static let shared = ListConfigurator()
    
    private init() {}
    
    func configure(with viewController: ListViewController) {
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

//
//  ListPresenter.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListPresentationLogic {
    func presentSomething(response: List.Something.Response)
}

class ListPresenter: ListPresentationLogic {
    
    weak var viewController: ListDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: ListResponse) {
        let viewModel = ListViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
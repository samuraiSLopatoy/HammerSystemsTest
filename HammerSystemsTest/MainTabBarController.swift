//
//  MainTabBarController.swift
//  HammerSystemsTest
//
//  Created by Михаил Кулагин on 24.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let listViewController = ListViewController()
    let contactsViewController = ContactsViewController()
    let profileViewController = ProfileViewController()
    let basketViewController = BasketViewController()
    
    let menuImage = UIImage(systemName: "menucard")!
    let contactsImage = UIImage(systemName: "person.3")!
    let profileImage = UIImage(systemName: "person")!
    let basketImage = UIImage(systemName: "cart")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .red
        
        viewControllers = [
            createNavigationController(rootViewController: listViewController, title: "Menu", image: menuImage),
            createNavigationController(rootViewController: contactsViewController, title: "Contacts", image: contactsImage),
            createNavigationController(rootViewController: profileViewController, title: "Profile", image: profileImage),
            createNavigationController(rootViewController: basketViewController, title: "Basket", image: basketImage)
        ]
    }
    
    private func createNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

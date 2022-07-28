//
//  TabBarViewController.swift
//  movies
//
//  Created by gustavo.cosenza on 06/07/22.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }

    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .lightYellow
    }
    
    private func setupViewControllers() {
        let moviesCollectionViewController = InitialViewController()
        moviesCollectionViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "list.bullet"), tag: 0)
        
        let favoritesTableViewController = InitialViewController()
        favoritesTableViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        
        let viewControllerList = [ moviesCollectionViewController, favoritesTableViewController ]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}

//
//  TabBarViewController.swift
//  movies
//
//  Created by gustavo.cosenza on 06/07/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = UIColor(named: "lightYellow")

        let moviesCollectionViewController = InitialViewController()
        moviesCollectionViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "list_icon"), tag: 0)
        
        let favoritesTableViewController = InitialViewController()
        favoritesTableViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite_empty_icon"), tag: 1)
        
        let viewControllerList = [ moviesCollectionViewController, favoritesTableViewController ]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }

}

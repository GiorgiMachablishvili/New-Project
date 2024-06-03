//
//  TabBarController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Tako Metonidze on 01.06.24.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    setTabBarViewControllers()
    configureTabBar()
  }

  private func configureTabBar() {
    tabBar.isTranslucent = false
    tabBar.tintColor = UIColor(hexString: "040404")
    tabBar.backgroundColor = .white
  }

  private func setTabBarViewControllers() {
    let homeVC = ChooseItemsViewController()
    homeVC.view.backgroundColor = UIColor(hexString: "C4C4C4")
    homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
    let homeNavVC = UINavigationController(rootViewController: homeVC)

    let searchVC = UIViewController()
    searchVC.view.backgroundColor = UIColor(hexString: "C4C4C4")
    searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
    let searchNavVC = UINavigationController(rootViewController: searchVC)

    let cartVC = UIViewController()
    cartVC.view.backgroundColor = UIColor(hexString: "C4C4C4")
    cartVC.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
    let cartNavVC = UINavigationController(rootViewController: cartVC)

    let profileVC = CheckoutViewController()
    profileVC.view.backgroundColor = UIColor(hexString: "C4C4C4")
    profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
    let profileNavVC = UINavigationController(rootViewController: profileVC)

    self.viewControllers = [homeNavVC, searchNavVC, cartNavVC, profileNavVC]
  }

}

//
//  TapBarViewController.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import UIKit

class TapBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTapBarController()
        setupTapBarViewControllers()
    }
    
    func setupTapBarController() {
        tabBar.tintColor = .systemGray6
        tabBar.backgroundColor = .black
        tabBar.selectedImageTintColor = .systemBlue
    }
    
    func setupTapBarViewControllers() {
        let first = MediaLibraryTabBarViewController()
        let firstIcon = UITabBarItem(title: "Медиатека",
                                     image: UIImage(systemName: "house"),
                                     selectedImage: UIImage(systemName: "house.fill"))
        first.tabBarItem = firstIcon
        
        let second = ForYouTabBarViewController()
        let secondIcon = UITabBarItem(title: "Для вас",
                                     image: UIImage(systemName: "heart.text.square"),
                                     selectedImage: UIImage(systemName: "heart.text.square"))
        second.tabBarItem = secondIcon
        
        let third = AlbumViewController()
        let thirdIcon = UITabBarItem(title: "Альбомы",
                                     image: UIImage(systemName: "rectangle.stack.fill"),
                                     selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        third.tabBarItem = thirdIcon
        
        let fourth = SearchTabBarViewController()
        let fourthIcon = UITabBarItem(title: "Поиск",
                                     image: UIImage(systemName: "magnifyingglass"),
                                     selectedImage: UIImage(systemName: "magnifyingglass"))
        fourth.tabBarItem = fourthIcon
        
        let controllers = [first, second, third, fourth]
        self.setViewControllers(controllers, animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        print("Был выбран контроллер - \(viewController.title ?? "")")
    }
}

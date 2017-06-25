//
//  HomeDatasourceController+navbar.swift
//  MyTwitter
//
//  Created by 123 on 25.06.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupLeftNavItem() {
        let followButton = makeButtonWith(image: #imageLiteral(resourceName: "follow-1"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = makeButtonWith(image: #imageLiteral(resourceName: "search"))
        let composeButton = makeButtonWith(image: #imageLiteral(resourceName: "compose"))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func makeButtonWith(image: UIImage)-> UIButton {
        let button = UIButton()
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        return button
    }
}

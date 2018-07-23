//
//  UIViewControllerExtension.swift
//  LoginTest
//
//  Created by Codenation10 on 23/07/2018.
//  Copyright © 2018 Codenation. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // creates and adds navbar title Image
    func addNavBarImage() {
        let navController = navigationController!
        let jdLogo = #imageLiteral(resourceName: "JDW-JD-Williams-Logo")
        let imageView = UIImageView(image: jdLogo)
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        let bannerX = bannerWidth / 2 - jdLogo.size.width
        let bannerY = bannerHeight / 2 - jdLogo.size.height
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}

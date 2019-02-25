//
//  UIViewControllerExtension.swift
//  LottieAnimationStartedProject
//
//  Created by 辛忠翰 on 13/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    func setupRightNavigationItemByImage(img: String, selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: img), style: .plain, target: self, action: selector)
    }
    func setupLeftNavigationItemByImage(img: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: img), style: .plain, target: self, action: selector)
    }
    func setupRightNavigationItemByTitle(title: String, selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    func setupLeftNavigationItemByTitle(title: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    
    func setupLightBlueBackgroundView() {
        let lightBlueView = UIView()
        lightBlueView.backgroundColor = .lightBlue
        view.addSubview(lightBlueView)
        lightBlueView.anchor(top: view.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 150)
    }
}

//
//  MainTabBarController.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 12..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }

    @available(iOS 2.0, *)
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        switch index {
        case 0:
            if let vc = viewController as? FirstViewController {
                vc.changeTheme()
            }
            break
        case 1:
            if let vc = viewController as? SecondViewController {
                vc.changeTheme()
            }
            break
        case 2:
            if let vc = viewController as? ThirdViewController {
                vc.changeTheme()
            }
            break
        default: break
        }
    }

}

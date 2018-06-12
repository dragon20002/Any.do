//
//  ThirdViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var firstView: FirstViewController?
    var secondView: SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView = tabBarController?.viewControllers![0] as? FirstViewController
        secondView = tabBarController?.viewControllers![1] as? SecondViewController
    }
    
    func changeTheme() {
        firstView?.todoTableView.changeTheme()
        secondView?.calendarView.changeTheme()
    }

    @IBAction func changeThemeBlack(_ sender: Any) {
        Style.themeBlack()
        changeTheme()
    }
    
    @IBAction func changeThemeBlue(_ sender: Any) {
        Style.themeBlue()
        changeTheme()
    }
    
    @IBAction func changeThemeGreen(_ sender: Any) {
        Style.themeGreen()
        changeTheme()
    }
    
    @IBAction func changeThemePink(_ sender: Any) {
        Style.themePink()
        changeTheme()
    }
    
    @IBAction func changeThemeYellow(_ sender: Any) {
        Style.themeYellow()
        changeTheme()
    }

}

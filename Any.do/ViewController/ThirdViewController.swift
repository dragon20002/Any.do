//
//  ThirdViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var secondView: SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView = tabBarController?.viewControllers![1] as? SecondViewController
    }

    @IBAction func changeThemeBlack(_ sender: Any) {
        Style.themeBlack()
        secondView?.calendarView.changeTheme()
    }
    
    @IBAction func changeThemeBlue(_ sender: Any) {
        Style.themeBlue()
        secondView?.calendarView.changeTheme()
    }
    
    @IBAction func changeThemeGreen(_ sender: Any) {
        Style.themeGreen()
        secondView?.calendarView.changeTheme()
    }
    
    @IBAction func changeThemePink(_ sender: Any) {
        Style.themePink()
        secondView?.calendarView.changeTheme()
    }
    
    @IBAction func changeThemeYellow(_ sender: Any) {
        Style.themeYellow()
        secondView?.calendarView.changeTheme()
    }

}

//
//  ThirdViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTheme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func changeTheme() {
        view.backgroundColor = AppTheme.bgColor
        lblTitle.backgroundColor = AppTheme.lblBgColor
        lblTitle.textColor = AppTheme.btnTxtColor
        lblTheme.backgroundColor = AppTheme.lblBgColor
        lblTheme.textColor = AppTheme.lblTxtColor
        tabBarController?.tabBar.tintColor = AppTheme.tabBarItemColor
    }

    @IBAction func changeThemeBlack(_ sender: Any) {
        AppTheme.themeBlack()
        changeTheme()
        UserDefaults.standard.set(0, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemeBlue(_ sender: Any) {
        AppTheme.themeBlue()
        changeTheme()
        UserDefaults.standard.set(1, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemeGreen(_ sender: Any) {
        AppTheme.themeGreen()
        changeTheme()
        UserDefaults.standard.set(2, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemePink(_ sender: Any) {
        AppTheme.themePink()
        changeTheme()
        UserDefaults.standard.set(3, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemeYellow(_ sender: Any) {
        AppTheme.themeYellow()
        changeTheme()
        UserDefaults.standard.set(4, forKey: "theme")
        UserDefaults.standard.synchronize()
    }

}

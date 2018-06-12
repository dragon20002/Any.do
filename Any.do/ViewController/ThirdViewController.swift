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
        view.backgroundColor = Style.bgColor
        lblTitle.backgroundColor = Style.lblBgColor
        lblTitle.textColor = Style.btnTxtColor
        lblTheme.backgroundColor = Style.lblBgColor
        lblTheme.textColor = Style.lblTxtColor
        tabBarController?.tabBar.tintColor = Style.tabBarItemColor
    }

    @IBAction func changeThemeBlack(_ sender: Any) {
        Style.themeBlack()
        changeTheme()
        UserDefaults.standard.set(0, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemeBlue(_ sender: Any) {
        Style.themeBlue()
        changeTheme()
        UserDefaults.standard.set(1, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemeGreen(_ sender: Any) {
        Style.themeGreen()
        changeTheme()
        UserDefaults.standard.set(2, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemePink(_ sender: Any) {
        Style.themePink()
        changeTheme()
        UserDefaults.standard.set(3, forKey: "theme")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func changeThemeYellow(_ sender: Any) {
        Style.themeYellow()
        changeTheme()
        UserDefaults.standard.set(4, forKey: "theme")
        UserDefaults.standard.synchronize()
    }

}

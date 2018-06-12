//
//  Style.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

struct Style {
    static var tabBarItemColor = UIColor.blue
    static var bgColor = UIColor.white
    static var btnBgColor = UIColor.white
    static var btnTxtColor = UIColor.blue
    static var lblBgColor = UIColor.white
    static var lblTxtColor = UIColor.black
    static var cellAccentBgImage = UIImage(named: "circle-blue")
    static var cellAccentTxtColor = UIColor.white
    static var btnAddImage = UIImage(named: "plus-blue")
    static var backImage = UIImage(named: "back")
    static var cancelLine = UIColor.gray
    static var cancelImage = UIImage(named: "cancel")

    static func themeBlack() {
        tabBarItemColor = UIColor.black
        bgColor = UIColor.gray
        btnBgColor = UIColor.gray
        btnTxtColor = UIColor.yellow
        lblBgColor = UIColor.gray
        lblTxtColor = UIColor.white
        cellAccentBgImage = UIImage(named: "circle-black")
        cellAccentTxtColor = UIColor.white
        btnAddImage = UIImage(named: "plus-black")
        backImage = UIImage(named: "back-yellow")
        cancelLine = UIColor.red
        cancelImage = UIImage(named: "cancel-red")
    }
    
    static func themeBlue() {
        tabBarItemColor = UIColor.blue
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.blue
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-blue")
        cellAccentTxtColor = UIColor.white
        btnAddImage = UIImage(named: "plus-blue")
        backImage = UIImage(named: "back")
        cancelLine = UIColor.gray
        cancelImage = UIImage(named: "cancel")
    }
    
    static func themeGreen() {
        tabBarItemColor = UIColor.green
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.green
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-green")
        cellAccentTxtColor = UIColor.white
        btnAddImage = UIImage(named: "plus-green")
        backImage = UIImage(named: "back")
        cancelLine = UIColor.gray
        cancelImage = UIImage(named: "cancel")
    }

    static func themePink() {
        tabBarItemColor = UIColor.init(red: 0.99, green: 0.64, blue: 0.81, alpha: 1.0)
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.init(red: 0.99, green: 0.64, blue: 0.81, alpha: 1.0)
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-pink")
        cellAccentTxtColor = UIColor.white
        btnAddImage = UIImage(named: "plus-pink")
        backImage = UIImage(named: "back")
        cancelLine = UIColor.gray
        cancelImage = UIImage(named: "cancel")
    }
    
    static func themeYellow() {
        tabBarItemColor = UIColor.yellow
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.yellow
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-yellow")
        cellAccentTxtColor = UIColor.white
        btnAddImage = UIImage(named: "plus-yellow")
        backImage = UIImage(named: "back")
        cancelLine = UIColor.gray
        cancelImage = UIImage(named: "cancel")
    }
    
}

enum Theme {
    case Black
    case Blue
    case Green
    case Pink
    case Yellow
}

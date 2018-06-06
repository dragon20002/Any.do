//
//  Style.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

struct Style {
    static var bgColor = UIColor.white
    static var btnBgColor = UIColor.white
    static var btnTxtColor = UIColor.blue
    static var lblBgColor = UIColor.white
    static var lblTxtColor = UIColor.black
    static var cellAccentBgImage = UIImage(named: "circle-blue")
    static var cellAccentTxtColor = UIColor.white

    static func themeBlack() {
        bgColor = UIColor.black
        btnBgColor = UIColor.black
        btnTxtColor = UIColor.blue
        lblBgColor = UIColor.black
        lblTxtColor = UIColor.white
        cellAccentBgImage = UIImage(named: "circle-blue")
        cellAccentTxtColor = UIColor.white
    }
    
    static func themeBlue() {
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.blue
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-blue")
        cellAccentTxtColor = UIColor.white
    }
    
    static func themeGreen() {
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.blue
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-blue")
        cellAccentTxtColor = UIColor.white
    }

    static func themePink() {
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.blue
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-blue")
        cellAccentTxtColor = UIColor.white
    }
    
    static func themeYellow() {
        bgColor = UIColor.white
        btnBgColor = UIColor.white
        btnTxtColor = UIColor.blue
        lblBgColor = UIColor.white
        lblTxtColor = UIColor.black
        cellAccentBgImage = UIImage(named: "circle-blue")
        cellAccentTxtColor = UIColor.white
    }
    
}

enum Theme {
    case Black
    case Blue
    case Green
    case Pink
    case Yellow
}

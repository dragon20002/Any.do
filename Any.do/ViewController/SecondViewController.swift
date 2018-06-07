//
//  SecondViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let calendarView: CalendarView = {
        let v = CalendarView(theme: Theme.Blue)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calendarView)
        calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: 365).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calendarView.dateView.collectionViewLayout.invalidateLayout()
    }

    /* IBAction */
    @IBAction func addTodo(_ sender: Any) {
        // TODO on Add Item
        
    }
    
}


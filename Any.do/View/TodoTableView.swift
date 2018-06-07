//
//  TodoTableView.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 7..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    // default init
    
    
    /* UITableViewCell */
    
}

class TodoTableView: UITableView {
    // fields...
    static var todoList = [Todo]()

    // init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        TodoTableView.todoList.append(Todo(name: "과제하기"))
        TodoTableView.todoList.append(Todo(name: "과제하기2"))
        TodoTableView.todoList.append(Todo(name: "과제하기3"))
    }
    
    func changeTheme() {
    }
    
}

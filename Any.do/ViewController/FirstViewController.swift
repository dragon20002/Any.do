//
//  FirstViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var todoTableView: TodoTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }

    /* UITableViewDelegate */
    //    @available(iOS 2.0, *)
    //    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return
    //    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO on Select Item
    }
    
    @available(iOS 3.0, *)
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // TODO on Deselect Item
    }
    
    /* UITableViewDataSource */
    // must have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoTableView.todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        let todo = TodoTableView.todoList[indexPath.row]
        todoCell.lblName.text = todo.name
        return todoCell
    }

    /* IBAction */
    @IBAction func addTodo(_ sender: Any) {
        // TODO on Add Item
    }
    
}

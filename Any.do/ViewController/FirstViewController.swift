//
//  FirstViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 5. 27..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTodoDelegate {
    
    // fields
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var todoTableView: TodoTableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    func changeTheme() {
        view.backgroundColor = Style.bgColor
        lblTitle.backgroundColor = Style.lblBgColor
        lblTitle.textColor = Style.btnTxtColor
        todoTableView.changeTheme()
        btnAdd.setImage(Style.btnAddImage, for: .normal)
    }

    /* UITableViewDelegate */
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
        return todoTableView.todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        todoCell.todo = todoTableView.todoList[indexPath.row]
        return todoCell
    }
    
    /* 현재화면 >> 추가화면 */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addTodoViewController = segue.destination as! AddTodoViewController
        
        addTodoViewController.delegate = self
    }
    
    /* 현재화면 << 추가화면 */
    func addTodoAndUpdateTableView(_ todo: Todo) {
        todoTableView.todoList.append(todo)
        todoTableView.saveTodoList()
        todoTableView.reloadData()
    }

}

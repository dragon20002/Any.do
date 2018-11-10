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
        
        let theme = UserDefaults.standard.integer(forKey: "theme")
        switch theme {
        case 0:
            AppTheme.themeBlack()
            break
        case 1:
            AppTheme.themeBlue()
            break
        case 2:
            AppTheme.themeGreen()
            break
        case 3:
            AppTheme.themePink()
            break
        case 4:
            AppTheme.themeYellow()
        default:
            AppTheme.themeBlue()
        }
        changeTheme()
        tabBarController?.tabBar.tintColor = AppTheme.tabBarItemColor
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }

    func changeTheme() {
        view.backgroundColor = AppTheme.bgColor
        lblTitle.backgroundColor = AppTheme.lblBgColor
        lblTitle.textColor = AppTheme.btnTxtColor
        todoTableView.changeTheme()
        btnAdd.setImage(AppTheme.btnAddImage, for: .normal)
    }

    /* UITableViewDelegate */
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO on Select Item
    }
    
    /* UITableViewDataSource */
    // must have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoTableView.todoList.count
    }

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        todoCell.todo = todoTableView.todoList[indexPath.row]
        todoCell.changeTheme()
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

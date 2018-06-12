//
//  AddTodoViewController.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 12..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

protocol AddTodoDelegate {
    func addTodoAndUpdateTableView(_ todo: Todo)
}

class AddTodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoLabelList = [String]()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var todoLabelTableView: UITableView!
    var delegate: AddTodoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabelTableView.delegate = self
        todoLabelTableView.dataSource = self
        
        todoLabelList.append("전화")
        todoLabelList.append("받기")
        todoLabelList.append("이메일")
        todoLabelList.append("구매")
        todoLabelList.append("과제")
        todoLabelList.append("만들기")
        todoLabelList.append("결제")
        todoLabelList.append("선택")
        todoLabelList.append("전송")
        todoLabelList.append("가져가기")
        todoLabelTableView.reloadData()
    }

    @IBAction func backToMain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTodo(_ sender: UIButton) {
        if let text = textField.text {
            if text == "" {
                return
            }
            if delegate != nil {
                delegate?.addTodoAndUpdateTableView(Todo(name: text))
                dismiss(animated: true, completion: nil)
            }
        }
    }

    /* UITableViewDelegate */
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        textField.text = cell?.textLabel?.text
    }
    
    /* UITableViewDataSourc */
    // must have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoLabelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoLabelTableView.dequeueReusableCell(withIdentifier: "todoLabelCell")
        cell?.textLabel?.text = todoLabelList[indexPath.row]
        return cell!
    }

}

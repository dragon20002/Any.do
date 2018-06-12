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
    @IBOutlet weak var btnDelete: UIButton!
    
    var todo: Todo? {
        didSet {
            lblName.text = todo?.name
        }
    }
    
    /* Gesture Handler Delegate */
    func setCellModeNormal() {
        btnDelete.isHidden = true
    }
    
    func setCellModeDelete() {
        btnDelete.isHidden = false
    }
    
    @IBAction func deleteTodo(_ sender: UIButton) {
        let parent = superview?.superview as! TodoTableView
        let n = parent.todoList.count
        for i in 0 ..< n {
            if parent.todoList[i].id == todo?.id {
                parent.todoList.remove(at: i)
                parent.saveTodoList()
                parent.reloadData()
                btnDelete.isHidden = true
                return
            }
        }
    }

}

class TodoTableView: UITableView {
    // fields
    var todoList = [Todo]()
    var path: String {
        get {
            let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            return (dir?.appendingPathComponent("todo.archive").path)!
        }
    }

    // init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeCellMode))
        leftSwipeRecognizer.direction = .left
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeCellMode))
        rightSwipeRecognizer.direction = .right
        gestureRecognizers = [ leftSwipeRecognizer, rightSwipeRecognizer ]
        isUserInteractionEnabled = true
        
        if let archived = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! [Todo]? {
            todoList += archived
        }
    }

    func changeTheme() {
    }
    
    /* Gesture Handler */
    func getCellFromRecognizer(_ recognizer: UISwipeGestureRecognizer) -> TodoCell? {
        let point = recognizer.location(in: self)
        if let indexPath = indexPathForRow(at: point) {
            return cellForRow(at: indexPath) as? TodoCell
        }
        return nil
    }
    
    @objc func changeCellMode(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .left { //to normal mode
            getCellFromRecognizer(recognizer)?.setCellModeNormal()
        } else if recognizer.direction == .right { //to delete mode
            getCellFromRecognizer(recognizer)?.setCellModeDelete()
        }
    }
    
    /* File IO */
    func saveTodoList() {
        NSKeyedArchiver.archiveRootObject(todoList, toFile: path)
    }
    
}

//
//  TodoTableView.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 7..
//  Copyright © 2018년 haruu. All rights reserved.
//

/**
 * 호출순서
 * UITableView init >> FirstVC numberOfRowsInSection >> FirstVC cellForRowAt
 *  >> TodoCell todo didSet >> TodoCell setCellModeXXXX
 */

import UIKit

class TodoCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivCancelLine: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    var todo: Todo? {
        didSet {
            if let todo = todo {
                lblName.text = todo.name
                btnDelete.isHidden = !todo.delMode
                if btnDelete.isHidden {
                    setCellModeNormal()
                } else {
                    setCellModeDelete()
                }
            }
        }
    }
    
    func changeTheme() {
        backgroundColor = Style.bgColor
        if todo?.delMode == true {
            setCellModeDelete()
        } else {
            setCellModeNormal()
        }
        btnDelete.setImage(Style.cancelImage, for: .normal)
    }

    /* Gesture Handler Delegate */
    func setCellModeNormal() {
        lblName.textColor = Style.lblTxtColor
        btnDelete.isHidden = true
        todo?.delMode = false
        
        // erase line
        ivCancelLine.image = nil

        // update todo
        if let parent = superview?.superview as! TodoTableView? {
            if let id = todo?.id {
                parent.setTodoDelMode(id: id, delMode: false)
            }
        }
    }
    
    func setCellModeDelete() {
        lblName.textColor = Style.cancelLine
        btnDelete.isHidden = false
        todo?.delMode = true
        
        // draw line
        UIGraphicsBeginImageContext(ivCancelLine.frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(Style.cancelLine.cgColor)
        context?.move(to: CGPoint(x: 0, y: 50))
        context?.addLine(to: CGPoint(x: ivCancelLine.frame.size.width, y: 50))
        context?.strokePath()
        ivCancelLine.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        
        // update todo
        if let parent = superview?.superview as! TodoTableView? {
            if let id = todo?.id {
                parent.setTodoDelMode(id: id, delMode: true)
            }
        }
    }
    
    @IBAction func deleteTodo(_ sender: UIButton) {
        let parent = superview?.superview as! TodoTableView
        if let id = todo?.id {
            if (parent.deleteTodo(id: id) >= 0) {
                btnDelete.isHidden = true
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
    var longPressedTodoIndexPath: IndexPath?

    // init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeCellMode))
        leftSwipeRecognizer.direction = .left
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(changeCellMode))
        rightSwipeRecognizer.direction = .right
        gestureRecognizers = [ leftSwipeRecognizer, rightSwipeRecognizer ]
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(moveCell))
        addGestureRecognizer(longPressRecognizer)
        
        isUserInteractionEnabled = true
        
        if let archived = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! [Todo]? {
            todoList += archived
        }
    }

    func changeTheme() {
        backgroundColor = Style.bgColor
        visibleCells.forEach { cell in
            let c = cell as! TodoCell
            c.changeTheme()
        }
        reloadData()
    }
    
    func setTodoDelMode(id: Int, delMode: Bool) {
        let n = todoList.count
        for i in 0 ..< n {
            if todoList[i].id == id {
                todoList[i].delMode = delMode
                saveTodoList()
                return
            }
        }
    }
    
    func deleteTodo(id: Int) -> Int {
        let n = todoList.count
        for i in 0 ..< n {
            if todoList[i].id == id {
                todoList.remove(at: i)
                saveTodoList()
                reloadData()
                return id
            }
        }
        return 0
    }
    
    func moveRowAt(source: Int, dest: Int) {
        let todo = todoList[source]
        todoList.remove(at: source)
        todoList.insert(todo, at: dest)
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
    
    @objc func moveCell(recognizer: UILongPressGestureRecognizer) {
        let state = recognizer.state
        let point = recognizer.location(in: self)
        
        if state == .began {
            longPressedTodoIndexPath = indexPathForRow(at: point)
        } else if state == .ended {
            if let sourceIndexPath = longPressedTodoIndexPath, let destIndexPath = indexPathForRow(at: point) {
                moveRowAt(source: sourceIndexPath.row, dest: destIndexPath.row)
                moveRow(at: sourceIndexPath, to: destIndexPath)
                longPressedTodoIndexPath = nil
            }
        } else if state == .changed {
            if let sourceIndexPath = longPressedTodoIndexPath, let destIndexPath = indexPathForRow(at: point) {
                moveRowAt(source: sourceIndexPath.row, dest: destIndexPath.row)
                moveRow(at: sourceIndexPath, to: destIndexPath)
                longPressedTodoIndexPath = destIndexPath
            }
        }
    }
    
    /* File IO */
    func saveTodoList() {
        NSKeyedArchiver.archiveRootObject(todoList, toFile: path)
    }
    
}

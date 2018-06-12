//
//  EventView.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 11..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTime: UILabel!

    var event: Event? {
        didSet {
            lblName.text = event?.name
            
            // TODO date 계산 후 오전 8:00~12:00 식으로 표기하기
            //lblTime.text = "\(event?.end - event?.start)"
        }
    }
    
}

class EventTableView: UITableView {
    // fields
    var eventList = [Event]()
    var path: String {
        get {
            let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            return (dir?.appendingPathComponent("event.archive").path)!
        }
    }

    // init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        if let archived = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! [Event]? {
            eventList += archived
    }
    
    func changeTheme() {
    }
    
    /* Gesture Handler */
    func getCellFromRecognizer(_ recognizer: UISwipeGestureRecognizer) -> EventCell? {
        let point = recognizer.location(in: self)
        if let indexPath = indexPathForRow(at: point) {
            return cellForRow(at: indexPath) as? EventCell
        }
        return nil
    }
    
//    @objc func changeCellMode(recognizer: UISwipeGestureRecognizer) {
//        if recognizer.direction == .left { //to normal mode
//            getCellFromRecognizer(recognizer)?.setCellModeNormal()
//        } else if recognizer.direction == .right { //to delete mode
//            getCellFromRecognizer(recognizer)?.setCellModeDelete()
//        }
    }
    
    /* File IO */
    func saveEventList() {
        NSKeyedArchiver.archiveRootObject(eventList, toFile: path)
    }

}

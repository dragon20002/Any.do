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
            lblTime.text = String.datetimeToString(date: (event?.start)!) + " ~ " + String.datetimeToString(date: (event?.end)!)
        }
    }
    
    func changeTheme() {
        backgroundColor = Style.bgColor
        lblName.backgroundColor = Style.lblBgColor
        lblName.textColor = Style.lblTxtColor
        lblTime.backgroundColor = Style.lblBgColor
        lblTime.textColor = Style.lblTxtColor
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
    }
    
    func changeTheme() {
        backgroundColor = Style.bgColor
        visibleCells.forEach { cell in
            let c = cell as! EventCell
            c.changeTheme()
        }
        reloadData()
    }
    
    func deleteEvent(id: Int) -> Int {
        let n = eventList.count
        for i in 0 ..< n {
            if eventList[i].id == id {
                eventList.remove(at: i)
                saveEventList()
                reloadData()
                return id
            }
        }
        return 0
    }
    
    /* File IO */
    func saveEventList() {
        NSKeyedArchiver.archiveRootObject(eventList, toFile: path)
    }

}

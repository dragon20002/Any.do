//
//  Event.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 11..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class Event: NSObject, NSCoding {
    static var cnt = 0
    
    var id: Int
    var name: String
    var start: Date
    var end: Date
    var location: String
    var alarm: Date
    var memo: String
    
    init(name: String, start: Date, end: Date, location: String, alarm: Date, memo: String) {
        self.id = Todo.cnt
        Todo.cnt += 1
        self.name = name
        self.start = start
        self.end = end
        self.location = location
        self.alarm = alarm
        self.memo = memo
    }
    
    /* NSCoding */
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(start, forKey: "start")
        aCoder.encode(end, forKey: "end")
        aCoder.encode(location, forKey: "location")
        aCoder.encode(alarm, forKey: "alarm")
        aCoder.encode(memo, forKey: "memo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = Todo.cnt
        name = aDecoder.decodeObject(forKey: "name") as! String
        start = aDecoder.decodeObject(forKey: "start") as! Date
        end = aDecoder.decodeObject(forKey: "end") as! Date
        location = aDecoder.decodeObject(forKey: "location") as! String
        alarm = aDecoder.decodeObject(forKey: "alarm") as! Date
        memo = aDecoder.decodeObject(forKey: "memo") as! String
        Todo.cnt += 1
    }
    
}

//
//  Todo.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 7..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class Todo: NSObject, NSCoding {
    static var cnt = 0
    
    var id: Int
    var name: String
    var delMode: Bool
    
    init(name: String) {
        self.id = Todo.cnt
        self.name = name
        self.delMode = false
        Todo.cnt += 1
    }

    /* NSCoding */
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(delMode, forKey: "delMode")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = Todo.cnt
        name = aDecoder.decodeObject(forKey: "name") as! String
        delMode = aDecoder.decodeBool(forKey: "delMode")
        Todo.cnt += 1
    }

}

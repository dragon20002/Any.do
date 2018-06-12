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
    
    init(name: String) {
        self.id = Todo.cnt
        self.name = name
        Todo.cnt += 1
    }

    /* NSCoding */
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = Todo.cnt
        name = aDecoder.decodeObject(forKey: "name") as! String
        Todo.cnt += 1
    }

}

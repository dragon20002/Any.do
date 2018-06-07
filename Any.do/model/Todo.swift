//
//  Todo.swift
//  Any.do
//
//  Created by haruu on 2018. 6. 7..
//  Copyright © 2018년 haruu. All rights reserved.
//

import UIKit

class Todo: NSObject, NSCoding {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    /* NSCoding */
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
    }

}

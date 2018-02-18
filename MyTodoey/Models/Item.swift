//
//  Item.swift
//  MyTodoey
//
//  Created by Nikola Popovic on 2/18/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class Item: Codable {
    var title : String = ""
    var done : Bool = false
    
    init(title : String) {
        self.title = title
    }
}

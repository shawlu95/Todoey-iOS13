//
//  Item.swift
//  Todoey
//
//  Created by main on 6/13/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct Item: Encodable {
    var title: String = ""
    var done: Bool = false
}

//
//  DogModel.swift
//  realm
//
//  Created by Macmini on 06/11/2023.
//

import Foundation
import RealmSwift

class Book: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var subTitle = ""
    @objc dynamic var price = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

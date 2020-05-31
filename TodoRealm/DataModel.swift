//
//  DataModel.swift
//  TodoRealm
//
//  Created by Prapawit Patthasirivichot on 30/5/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import Foundation
import RealmSwift

public class ToDoModel: Object{
    @objc dynamic var id = 0
    @objc dynamic var header: String!
    @objc dynamic var desc: String!
    @objc dynamic var imageUrl: String!
}

class ImageModel: Object{
    @objc dynamic var id = 0
    @objc dynamic var imageName: String!
    @objc dynamic var imageUrl: String!
}

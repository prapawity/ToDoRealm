//
//  DatabaseManager.swift
//  TodoRealm
//
//  Created by Prapawit Patthasirivichot on 31/5/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import Foundation
import RealmSwift

public class DatabaseManager{
    private static var realm: Realm!
    public static let instance = DatabaseManager()
    private init() {
        DatabaseManager.realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    public func queryData() -> [ToDoModel]
    {
        let data = DatabaseManager.realm.objects(ToDoModel.self)
        var returnData: [ToDoModel] = []
        data.forEach { (todo) in
            print(todo.imageUrl)
            returnData.append(todo)
        }
        return returnData
    }
    
    public func addToDo(header: String, desc: String, path: String){
        let todoObj = ToDoModel()
        let myvalue = DatabaseManager.realm.objects(ToDoModel.self).map{$0.id}.max() ?? 0
        todoObj.id = myvalue + 1
        todoObj.header = header
        todoObj.desc = desc
        todoObj.imageUrl = path
        try! DatabaseManager.realm.write {
            DatabaseManager.realm.add(todoObj)
        }
        
    }
}

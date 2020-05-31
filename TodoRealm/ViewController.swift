//
//  ViewController.swift
//  TodoRealm
//
//  Created by Prapawit Patthasirivichot on 30/5/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataArray: [ToDoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        dataArray = DatabaseManager.instance.queryData()

//        print("Path to realm file: " + realm.configuration.fileURL!.absoluteString)
    }
    override func viewDidAppear(_ animated: Bool) {
        dataArray = DatabaseManager.instance.queryData()
        tableView.reloadData()
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.setCell(header: dataArray[indexPath.row].header, index: dataArray[indexPath.row].id, desc: dataArray[indexPath.row].desc, imgUrl: dataArray[indexPath.row].imageUrl ?? "")
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
    
    
}


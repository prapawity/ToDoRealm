//
//  TableViewCell.swift
//  TodoRealm
//
//  Created by Prapawit Patthasirivichot on 30/5/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setCell(header: String, index: Int, desc: String, imgUrl: String){
        if imgUrl != ""{
            img.image = load(fileName:imgUrl)
        }
        self.desc.text = desc
        self.index.text = String(index)
        self.header.text = header
    }
    
    private func load(fileName: String) -> UIImage? {
        var documentsUrl: URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return #imageLiteral(resourceName: "logo")
    }

}

//
//  AddToDoViewController.swift
//  TodoRealm
//
//  Created by Prapawit Patthasirivichot on 31/5/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var header: UITextField!
    @IBOutlet weak var desc: UITextField!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func addButtton(_ sender: Any) {
        var imgBtn: UIImage?
        var path: String?
        if imageButton.imageView?.image != nil {
            imgBtn = (imageButton.imageView?.image)!
        }

        if imgBtn != nil{
            path = saveImage(imageName: UUID().uuidString, image: imgBtn!)
        }
        
        DatabaseManager.instance.addToDo(header: header.text ?? "header", desc: desc.text ?? "desc",path: path ?? "")
    }
    
    func saveImage(imageName: String, image: UIImage) -> String{
        
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = imageName
        let fileURL = documentsDirectory!.appendingPathComponent(fileName)
        let data = image.jpegData(compressionQuality: 1)
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data?.write(to: fileURL)
            return fileName
        } catch let error {
            print("error saving file with error", error)
            return ""
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension AddToDoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageButton.imageView?.contentMode = .scaleToFill
            imageButton.setImage(pickedImage, for: .normal)
           }
        
           dismiss(animated: true, completion: nil)
    }
}

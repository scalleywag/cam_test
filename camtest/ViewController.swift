//
//  ViewController.swift
//  camtest
//
//  Created by Mac on 6/5/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func chooseimage(_ sender: Any) {
        
        let ImagePickerController = UIImagePickerController()
        ImagePickerController.delegate = self
      
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose A Source", preferredStyle: . actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            ImagePickerController.sourceType = .camera
            self.present(ImagePickerController, animated: true, completion: nil)

        }))
      
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
            ImagePickerController.sourceType = .photoLibrary
            self.present(ImagePickerController, animated: true, completion: nil)
                
            }else{
                    print("Camera Not Available")
            }
            
        }))
      
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageview.image = image
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


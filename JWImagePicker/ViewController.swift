//
//  ViewController.swift
//  JWImagePicker
//
//  Created by Hafiz Muhammad Junaid on 15/08/2017.
//  Copyright © 2017 Symmetry Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    let imagePicker = JWImagePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickImageTap(_ sender: Any) {
        imagePicker.showImagePickOption(callerVC: self) { (info) in
            
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.imgView.image = image
            }
        }
    }

}


//
//  JWImagePicker.swift
//  JWImagePicker
//
//  Created by Hafiz Muhammad Junaid on 22/06/2017.
//  Copyright © 2017 Appabilities. All rights reserved.
//

import UIKit

class JWImagePicker: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    typealias didFinishPickingMediaWithInfo = (_ info:[String:Any])->Void

    fileprivate let imagePicker = UIImagePickerController()
    fileprivate var pickingMediaWithInfo:didFinishPickingMediaWithInfo!
    
    override init() {
        super.init()
        
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = false
    }
    
    //MARK: - Alert Option
    func showImagePickOption(callerVC:UIViewController,completion:@escaping didFinishPickingMediaWithInfo) {
        self.pickingMediaWithInfo = completion
        let alertVC = UIAlertController(title: "Choose", message: "Select Image", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.imagePicker.sourceType = .camera
            callerVC.present(self.imagePicker, animated: true, completion: nil)
            
        }
        let gallery = UIAlertAction(title: "Gallery", style: .default) { (action) in
            self.imagePicker.sourceType = .photoLibrary
            callerVC.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertVC.addAction(camera)
        alertVC.addAction(gallery)
        alertVC.addAction(cancel)
        callerVC.present(alertVC, animated: true, completion: nil)
    }
    
    
    
    //MARK: - UIImagePickerControllerDelegate
   @objc internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.pickingMediaWithInfo(info)
        picker.dismiss(animated: true, completion: nil)
    }
}

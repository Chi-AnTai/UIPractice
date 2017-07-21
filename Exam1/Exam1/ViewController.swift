//
//  ViewController.swift
//  Exam1
//
//  Created by 戴其安 on 2017/7/21.
//  Copyright © 2017年 戴其安. All rights reserved.
//

import UIKit
extension UIFont {
class func asiTextStyle23Font() -> UIFont {
    return UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightHeavy)
}
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var pickImageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()

    @IBAction func pickImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
     func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
        self.dismiss(animated: true, completion: { () -> Void in })
        
    }
    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [String: Any]!){
//        self.dismiss(animated: true, completion: { () -> Void in
//            
//        })
//        
//        imageView.image = image
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myScrollView.delegate = self
        myScrollView.minimumZoomScale = 1.0
        myScrollView.maximumZoomScale = 6.0
        pickImageButton.titleLabel?.font = UIFont.asiTextStyle23Font()
        imageView.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }


}


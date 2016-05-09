//
//  CreateRecipeVC.swift
//  recipes
//
//  Created by Bartosz Odrzywołek on 09/05/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import UIKit

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var chooseImgBtn: UIButton!
    
    var imagePicker: UIImagePickerController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = recipeImg.frame.size.width / 2
        recipeImg.clipsToBounds = true
    }

    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
        chooseImgBtn.setTitle("CHANGE IMAGE", forState: .Normal)
    }
    
    @IBAction func chooseImgBtnPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
        chooseImgBtn.setTitle("", forState: .Normal)
    }
    
    
}

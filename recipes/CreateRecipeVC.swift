//
//  CreateRecipeVC.swift
//  recipes
//
//  Created by Bartosz Odrzywołek on 09/05/16.
//  Copyright © 2016 Bartosz. All rights reserved.
//

import UIKit
import CoreData

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
    
    @IBAction func createRecipeBtnPressed(sender: AnyObject) {
        if let title = recipeTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            // now we assign values
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImg.image!)
            
            context.insertObject(recipe)
            
            do {
                try context.save()
            } catch let err as NSError {
                print(err.debugDescription)
                print("Could not save recipe")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}

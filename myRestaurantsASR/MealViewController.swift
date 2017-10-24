//
//  MealViewController.swift
//  myRestaurantsASR
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var txtMealName: UITextField!
    @IBOutlet weak var imgMeal: UIImageView!
    @IBOutlet weak var txtComment: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtMealName.delegate = self
        txtComment.delegate = self
        
        //Setting the text view's border
        self.txtComment.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        self.txtComment.layer.borderWidth = 1.0
        self.txtComment.layer.cornerRadius = 8
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        txtMealName.resignFirstResponder()
        txtComment.resignFirstResponder()
    
        //Creating the image picker controller
        let imagePickerController = UIImagePickerController()
    
        //Defeining the source of the images: te photo library
        imagePickerController.sourceType = .photoLibrary
    
        //Notify the ViewController when the user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    
    }

    //MARK: Text Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    //Dismiss the text view keyboard, when the user types "Done"
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" // Recognizes enter key in keyboard
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    //MARK: Image View Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //Takes the original image
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //Set photoImageView to display the selected image
            imgMeal.image = selectedImage
            //Dismiss the picker
            dismiss(animated: true, completion: nil)
        
        } else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
    }

}

//
//  DetailViewController.swift
//  Homepwner2
//
//  Created by Sarah Pell on 3/28/20.
//  Copyright © 2020 Sarah Pell. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController, UITextFieldDelegate,
UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
         // If the device has a camera, take a picture; otherwise,
         // just pick from photo library
         if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
         } else {
            imagePicker.sourceType = .photoLibrary
         }
        imagePicker.delegate = self
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var desc: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item!{
        didSet {
            navigationItem.title = item.title
        }
    }
    var imageStore: ImageStore!
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        
        if let originalImage = info[.originalImage] as? UIImage {
            // Store the image in the ImageStore for the item's key
            imageStore.setImage(originalImage, forKey: item.itemKey)
            imageView.image = originalImage
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.title
        desc.text = item.desc
        valueField.text = numberFormatter.string(from: NSNumber(value: item.adoptionFee))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        // Get the item key
        let key = item.itemKey
        // If there is an associated image with the item
        // display it on the image view
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
     }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Clear first responder
        view.endEditing(true)
        // "Save" changes to item
        item.title = nameField.text!
        item.desc = desc.text!
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item.adoptionFee = value.intValue
        } else {
            item.adoptionFee = 0
        }
    }
}

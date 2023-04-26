//
//  ViewController.swift
//  exampleImage
//
//  Created by Mohan K on 16/03/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var saveImageView: UIImageView!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var showBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonPressed))
        saveImageView.layer.cornerRadius = 12
        showImageView.layer.cornerRadius = 12
    }
    
    @objc func cameraButtonPressed() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else {return}
        saveImageView.image = userPickedImage
        picker.dismiss(animated: true)
    }

    @IBAction func saveButton(_ sender: Any) {
        if let imageData = saveImageView.image?.pngData() {
            DataHelper.sharedInstance.exampleImage(data: imageData)
        }
    }
    
    @IBAction func showButton(_ sender: Any) {
   
        let arr = DataHelper.sharedInstance.fetchImage()
        showImageView.image = UIImage(data: arr[0].img!)
    }
}


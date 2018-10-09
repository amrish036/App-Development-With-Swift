//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Amrish Mahesh on 8/10/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBAction func shareButtonTapped(_ sender: UIButton) {
    guard let image = imageView.image else {return}
    let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    activityController.popoverPresentationController?.sourceView = sender
    present(activityController, animated: true, completion: nil)
  }
  
  @IBAction func safariButtonTapped(_ sender: Any) {
    if let url = URL(string: "https://www.apple.com/au"){
      let safariViewController = SFSafariViewController(url: url)
      present(safariViewController, animated: true, completion: nil)
    }
    else {return}
  }
  
  @IBAction func cameraButtonTapped(_ sender: UIButton) {
  
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    
    let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    if UIImagePickerController.isSourceTypeAvailable(.camera){
         let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in
          imagePicker.sourceType = .camera
          self.present(imagePicker, animated: true, completion: nil)
          print("User selected Camera Action")})
       alertController.addAction(cameraAction)
    }
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
          let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            print("User selected Photo Library Action")})
        alertController.addAction(photoLibraryAction)
    }

    alertController.addAction(cancelAction)
    alertController.popoverPresentationController?.sourceView = sender
    present(alertController, animated: true, completion: nil)
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      self.imageView.contentMode = .scaleAspectFit
      self.imageView.image = pickedImage
    }
    
    dismiss(animated: true, completion: nil)
  }

  
  @IBAction func emailButtonTapped(_ sender: Any) {
    guard MFMailComposeViewController.canSendMail()
      else{
        print("Cannot send mail")
        return
    }
    let mailComposer = MFMailComposeViewController()
    mailComposer.mailComposeDelegate = self
    mailComposer.setToRecipients(["amrish.036@gmail.com"])
    mailComposer.setSubject("Look at this")
    mailComposer.setMessageBody("Hello this is an email from an app that I made.", isHTML: false)
    present(mailComposer, animated: true, completion: nil)
  }
  
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    dismiss(animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}


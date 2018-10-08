//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Amrish Mahesh on 8/10/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBAction func shareButtonTapped(_ sender: UIButton) {
    guard let image = imageView.image else {return}
    let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    activityController.popoverPresentationController?.sourceView = sender
    present(activityController, animated: true, completion: nil)
  }
  @IBAction func safariButtonTapped(_ sender: Any) {
  }
  @IBAction func cameraButtonTapped(_ sender: Any) {
  }
  @IBAction func emailButtonTapped(_ sender: Any) {
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}


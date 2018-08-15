//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Amrish Mahesh on 15/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    registerForKeyboardNotifications()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: Keyboard Notifications
  
  func registerForKeyboardNotifications(){
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWasShown(_:)),name: .UIKeyboardDidShow, object: nil)
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillBeHidden(_:)),name: .UIKeyboardWillHide, object: nil)
 }
  @objc func keyboardWasShown(_ notification: NSNotification) {
    print("keyboardWillShow")
    guard let info = notification.userInfo,
      let keyboardFrameValue = info[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {return}
    let keyboardFrame = keyboardFrameValue.cgRectValue
    let keyboardSize = keyboardFrame.size
    let contentInsets = UIEdgeInsets(top: 0.0,left: 0.0,bottom: keyboardSize.height,right: 0.0)
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }
  
  @objc func keyboardWillBeHidden(_ notification: NSNotification){
    print("keyboardWillHide")
    let contentInsets = UIEdgeInsets.zero
    scrollView.contentInset = contentInsets
    scrollView.scrollIndicatorInsets = contentInsets
  }
}


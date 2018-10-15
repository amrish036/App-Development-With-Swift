//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Amrish Mahesh on 15/10/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var checkinDateLabel: UILabel!
  @IBOutlet weak var checkinDatePicker: UIDatePicker!
  @IBOutlet weak var checkoutDateLabel: UILabel!
  @IBOutlet weak var checkoutDatePicker: UIDatePicker!
  
  let checkinDatePickerIndexPath = IndexPath(row: 1, section: 2)
  let checkoutDatePickerIndexPath = IndexPath(row: 3, section: 2)
  
  
  @IBAction func doneBarButtonTapped(_ sender: Any) {
    let firstName = firstNameTextField.text ?? ""
    let lastName = lastNameTextField.text ?? ""
    let email = emailTextField.text ?? ""
    let checkinDate = checkinDatePicker.date
    let checkoutDate = checkoutDatePicker.date
    
    print("FirstName: \(firstName)")
    print("LastName: \(lastName)")
    print("Email: \(email)")
    print("Checkin: \(checkinDate)")
    print("Checkout: \(checkoutDate)")
  }
  
  @IBAction func datePickerValueChanged(_ sender: Any) {
    updateViews()
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    
      let midNightToday = Calendar.current.startOfDay(for: Date())
      checkinDatePicker.minimumDate = midNightToday
      checkinDatePicker.date = midNightToday
    

      
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
  func updateViews(){
    
    checkoutDatePicker.minimumDate = checkinDatePicker.minimumDate?.addingTimeInterval(86400)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    
    checkinDateLabel.text = dateFormatter.string(from: checkinDatePicker.date)
    checkoutDateLabel.text = dateFormatter.string(from: checkoutDatePicker.date)
    
  }

//    // MARK: - Table view data source
//
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    <#code#>
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    <#code#>
  }
  
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 4
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

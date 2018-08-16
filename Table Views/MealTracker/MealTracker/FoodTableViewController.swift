//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Amrish Mahesh on 16/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

  var meals: [Meal]  {
//    var breakfast: Meal
//    var lunch: Meal
//    var dinner: Meal
    
    let bread = Food(name: "Bread", description: "Loaf")
    let egg = Food(name: "Egg", description: "Good protien")
    let milk = Food(name: "Milk", description: "Good Calcium")
    
    let sandwich = Food(name: "Sandwich", description: "Delicious!")
    let chips = Food(name: "Chips", description: "Cheat Day")
    let soup = Food(name: "Soup", description: "Winter Warmer")
    
    let steak = Food(name: "Steak", description: "Good in protien")
    let gravy = Food(name: "Gravy", description: "The tastiness")
    let veggies = Food(name: "Veggies", description: "Healthy stuff")
    
    let breakfast = Meal(name: "BreakFast", food: [bread, egg, milk])
    let lunch =  Meal(name: "Lunch", food: [sandwich, chips, soup])
    let dinner =  Meal(name: "Dinner", food: [steak, gravy, veggies])
    
    return [breakfast,lunch,dinner]
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
    }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return meals[section].name
  }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

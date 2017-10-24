//
//  RestaurantTableViewController.swift
//  myRestaurantsASR
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit
import os.log

class RestaurantTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem
        
        //load the sample data
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as? RestaurantTableViewCell {
            //Fetches the appropriate restaurant for the data source layout
            let restaurant = data[indexPath.row]
            
            //Configure the cell
            cell.lblName.text = restaurant.name
            cell.restaurantImage.image = restaurant.image
            cell.rateTotal.rating = restaurant.rateTotal
            
            
            return cell
        } else {
            fatalError("The dequeued cell is not an instance of RestaurantTableViewCell")
        }
    }
    
    //MARK: Properties
    var data: [Restaurant] = []
    
    //MARK: Private Methods
    //Add restaurants to datas'array
    private func loadData() {
        let imgKFC = UIImage(named: "KFC")
        let imgMc = UIImage(named: "McDonalds")
        let imgTim = UIImage(named: "Tim Hortons")
        
        let tim = Restaurant(name: "Tim Hortons", image: imgTim, address: nil, comment: nil, location: 4, attendance: 4, cleaning: 5, total: 4, breakfast: nil, lunch: nil, dinner: nil)
        
        let mc = Restaurant(name: "McDonalds", image: imgMc, address: nil, comment: nil, location: 5, attendance: 3, cleaning: 4, total: 4, breakfast: nil, lunch: nil, dinner: nil)
        
        let kfc = Restaurant(name: "KFC", image: imgKFC, address: nil, comment: nil, location: 3, attendance: 5, cleaning: 5, total: 5, breakfast: nil, lunch: nil, dinner: nil)
        
        data.append(tim)
        data.append(mc)
        data.append(kfc)
    }
    
    //MARK: Actions
    @IBAction func unwindToRestaurantList(sender: UIStoryboardSegue) {
        //test if the sender is the  ViewController, and if there is a restaurant created
        if let sourceViewController = sender.source as? ViewController {
            if let newRestaurant = sourceViewController.restaurant {
                
                //testing if the user selected or not a table views row
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    //Update an existing restaurant
                    data[selectedIndexPath.row] = newRestaurant
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
                else {
                    //add a new restaurant
                    //where the new restaurant must be added
                    let newIndexPath = IndexPath(row: data.count, section: 0)
                
                    //adding the new restaurant to the array
                    data.append(newRestaurant)
                
                    //adding the new element to the tableview
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
    }
    //		
    //MARK - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? ""{
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "showDetail":
            //Verify if the destination os the restaurants view controller
            if let restaurantViewController = segue.destination as? ViewController  {
                //Verify if the cell selected is a valid cell
                if let selectedRestaurantCell = sender as? RestaurantTableViewCell  {
                   //Retrieve the position of the selected cell
                    if let indexPath = tableView.indexPath(for: selectedRestaurantCell) {
                        //retrieve the restaurant selected and...
                        let selectedRestaurant = data[indexPath.row]
                        //...pass to the destinantion
                        restaurantViewController.restaurant = selectedRestaurant
                    } else {
                        fatalError("The selected cell is not being displayed by the table")
                    }
                }  else {
                    //String test
                    fatalError("Unexpected sender: \(String(describing: sender))")
                }
            }  else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))")
        }
    }
    
    //Override to support editing the table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the row from the data source
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //Override to support conditional editing of the table view
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //Return false if you do not want the specified item to be editable
        return true
    }
}

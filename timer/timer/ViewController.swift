//
//  ViewController.swift
//  timer
//
//  Created by Nazmus Sakib on 8/5/19.
//  Copyright © 2019 ConstantMD. All rights reserved.
//

import UIKit
 // class with table view implement and array data (dynamic)
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var clicCount: Int = 0
    var mileStonint: Int = 10
    var mileSton: Int = 1
    var intArr:[Int] = []

    @IBOutlet weak var tableRecords: UITableView!
    @IBOutlet weak var lblMileSton: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTitle.text = "This is a sample Title"
        tableRecords.delegate = self
        tableRecords.dataSource = self
    }    
    // function for click +
    @IBAction func clickMepressed(_ sender: UIButton) {
        clicCount = clicCount + 1
        dispCount()
    }
        // function for click -
    @IBAction func clickDown(_ sender: UIButton) {
        clicCount = clicCount - 1
        dispCount()
    }
    //func for display
    func dispCount() {
        let modulas = clicCount % mileStonint
        let mileSton = clicCount / mileStonint
        
        //Condition for stop and display stoped
        if clicCount == -1 {
            clicCount = 0
            lblTitle.text = "click count stoped"
        }
        // else for continue this function
        else {
            lblTitle.text = "Click count: \(clicCount)"
        }

        //condition for update mileston [label 2]
        if modulas == 0 {
            lblMileSton.text = "Milestone Passed: \(clicCount / mileStonint)"
            intArr.append(mileSton)
            tableRecords.reloadData()
            print(intArr)
        } // finished if modulas condition
        
    }  // finish display function
    
    //function for Tabale view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intArr.count
    }
    
    //function for showing array data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Milestone: \(intArr[indexPath.row])"
        
        return cell
    }
}  //finished the class


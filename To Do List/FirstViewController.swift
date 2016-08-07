//
//  FirstViewController.swift
//  To Do List
//
//  Created by Pranav Bhandari on 8/6/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

import UIKit
var arr : [String] = []
class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if (NSUserDefaults.standardUserDefaults().objectForKey("todo") != nil) {
            arr = NSUserDefaults.standardUserDefaults().objectForKey("todo") as! [String]
        }
        
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel!.text = arr[indexPath.row] 
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            arr.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "todo")
            tableView.reloadData()
        }
    }
    
}


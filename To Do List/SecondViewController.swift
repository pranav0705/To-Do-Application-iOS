//
//  SecondViewController.swift
//  To Do List
//
//  Created by Pranav Bhandari on 8/6/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newItem : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.newItem.delegate = self
    }

    @IBAction func addItem(sender: AnyObject) {
        arr.append(newItem.text!)
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "todo")
        newItem.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


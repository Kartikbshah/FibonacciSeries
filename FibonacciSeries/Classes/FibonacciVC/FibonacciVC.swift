//
//  FibonacciVC.swift
//  FibonacciSeries
//
//  Created by MAC-186 on 4/15/16.
//  Copyright © 2016 MoveoApps. All rights reserved.
//

import UIKit

class FibonacciVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Variables
    
    @IBOutlet var tblFibonacci: UITableView!
    var arrFibonacci = [String]()
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doInitialSettings()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource/Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCellWithIdentifier("FibonacciTableCell") as! FibonacciTableCell
        
        //To Remvoe Separator Insets
        aCell.preservesSuperviewLayoutMargins = false
        aCell.layoutMargins = UIEdgeInsetsZero
        
        aCell.txtView.text = "F\(indexPath.row) = " + arrFibonacci[indexPath.row]
        
        return aCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFibonacci.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    //MARK: Class Methods
    func doInitialSettings() {
        
        for i in 0 ..< 1000 {
            if i < 2 {
                arrFibonacci.append("\(i)")
            }
            else {
                let aVarTemp : Double = Double(arrFibonacci[i-2])! + Double(arrFibonacci[i-1])!
                arrFibonacci.append(String(format: "%.0f", aVarTemp))
            }
        }
        self.tblFibonacci.reloadData()
    }
}

